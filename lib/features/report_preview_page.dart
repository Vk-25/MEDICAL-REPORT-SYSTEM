import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import '../core/config.dart';
import '../core/models.dart';
import '../core/providers.dart';
import '../core/theme.dart';
import '../core/utils.dart';
import '../widgets/common_widgets.dart';

/// High-Fidelity PDF Preview & Official Certificate Verification Page.
class ReportPreviewPage extends ConsumerStatefulWidget {
  final String reportId;
  const ReportPreviewPage({super.key, required this.reportId});

  @override
  ConsumerState<ReportPreviewPage> createState() => _ReportPreviewPageState();
}

class _ReportPreviewPageState extends ConsumerState<ReportPreviewPage> {
  Report? _report;
  Clinic? _clinic;
  Doctor? _doctor;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final id = int.tryParse(widget.reportId);
    if (id == null) {
      if (mounted) setState(() => _isLoading = false);
      return;
    }

    final reportRepo = ref.read(reportRepositoryProvider);
    final clinicRepo = ref.read(clinicRepositoryProvider);
    final doctorRepo = ref.read(doctorRepositoryProvider);

    final report = await reportRepo.findById(id);
    final clinic = await clinicRepo.getDefaultClinic();
    Doctor? doctor;
    if (report != null && report.doctorId != 0) {
      doctor = await doctorRepo.findById(report.doctorId);
    }

    if (mounted) {
      setState(() {
        _report = report;
        _clinic = clinic;
        _doctor = doctor;
        _isLoading = false;
      });
    }
  }

  Future<Uint8List> _buildPdf(PdfPageFormat format) async {
    final currentReport = _report;
    if (currentReport == null) return Uint8List(0);
    final pdfService = ref.read(pdfServiceProvider);
    return await pdfService.generateGamcaReport(currentReport, _clinic, _doctor);
  }

  Future<void> _saveToDisk() async {
    final currentReport = _report;
    if (currentReport == null) return;
    try {
      final bytes = await _buildPdf(PdfPageFormat.a4);
      final dir = await getApplicationDocumentsDirectory();
      final fileName = 'GAMCA_Report_${currentReport.serialNumber.replaceAll("/", "_")}.pdf';
      final file = File('${dir.path}/$fileName');
      await file.writeAsBytes(bytes);

      if (mounted && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Saved official report PDF directly to: ${file.path}'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: const Color(0xFF0F766E),
          ),
        );
      }
    } catch (e) {
      if (mounted && context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to save PDF: $e'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  Future<void> _updateStatus(ReportStatus newStatus) async {
    final currentReport = _report;
    if (currentReport == null) return;
    final reportRepo = ref.read(reportRepositoryProvider);
    final updated = currentReport.copyWith(status: newStatus);
    await reportRepo.update(updated);
    if (mounted) {
      setState(() {
        _report = updated;
      });
    }
    if (mounted && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Certificate status updated to ${newStatus.name.toUpperCase()}'),
          behavior: SnackBarBehavior.floating,
          backgroundColor: const Color(0xFF0F766E),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(body: Center(child: AppLoading(height: 400)));
    }

    final currentReport = _report;
    if (currentReport == null) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(32),
          child: AppEmptyState(
            icon: Icons.error_outline_rounded,
            title: 'Examination Report Not Found',
            message: 'Could not load report #${widget.reportId}. It may have been archived or removed from local storage.',
            actionLabel: 'Return to Report Archives',
            onAction: () => context.go(AppRoutes.reportHistory),
          ),
        ),
      );
    }

    final serial = currentReport.serialNumber;
    final candidateName = currentReport.patientInfo.name ?? 'Unnamed Candidate';
    final passport = currentReport.patientInfo.passportNumber ?? 'N/A';
    final isDark = context.isDark;

    return Shortcuts(
      shortcuts: AppShortcuts.shortcuts,
      child: Actions(
        actions: {
          PrintReportIntent: CallbackAction<PrintReportIntent>(onInvoke: (_) async {
            await Printing.layoutPdf(
              onLayout: (format) => _buildPdf(format),
              name: 'GAMCA_Report_${serial.replaceAll("/", "_")}.pdf',
            );
            await _updateStatus(ReportStatus.printed);
            return null;
          }),
        },
        child: Focus(
          autofocus: true,
          child: Scaffold(
            body: Column(
              children: [
                // Premium Gradient Toolbar Chrome
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: isDark
                          ? [const Color(0xFF134E4A), const Color(0xFF1E293B)]
                          : [const Color(0xFF0F766E), const Color(0xFF312E81)],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.2),
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
                            tooltip: 'Return to Editor or Archives',
                            onPressed: () => context.go(AppRoutes.reportHistory),
                          ),
                          const SizedBox(width: 12),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(Icons.picture_as_pdf_rounded, color: Colors.white, size: 22),
                          ),
                          const SizedBox(width: 14),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'OFFICIAL CERTIFICATE PREVIEW',
                                    style: context.textTheme.labelMedium?.copyWith(
                                      color: const Color(0xFF5EEAD4),
                                      fontWeight: FontWeight.w800,
                                      letterSpacing: 1.0,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  AppStatusBadge.fromReportStatus(currentReport.status, context: context),
                                ],
                              ),
                              const SizedBox(height: 2),
                              Text(
                                '$candidateName • Serial #$serial • Passport: $passport',
                                style: context.textTheme.titleMedium?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.white,
                              side: BorderSide(color: Colors.white.withValues(alpha: 0.4)),
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            ),
                            icon: const Icon(Icons.edit_note_rounded, size: 18),
                            label: const Text('Edit Details'),
                            onPressed: () => context.go('/reports/generate?id=${widget.reportId}'),
                          ),
                          const SizedBox(width: 12),
                          OutlinedButton.icon(
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.white,
                              side: BorderSide(color: Colors.white.withValues(alpha: 0.4)),
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            ),
                            icon: const Icon(Icons.download_rounded, size: 18),
                            label: const Text('Export PDF File'),
                            onPressed: _saveToDisk,
                          ),
                          const SizedBox(width: 12),
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: const Color(0xFF0F766E),
                              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
                              elevation: 4,
                            ),
                            icon: const Icon(Icons.print_rounded, size: 18),
                            label: const Text('Print Official Certificate (Ctrl+P)', style: TextStyle(fontWeight: FontWeight.bold)),
                            onPressed: () async {
                              await Printing.layoutPdf(
                                onLayout: (format) => _buildPdf(format),
                                name: 'GAMCA_Report_${serial.replaceAll("/", "_")}.pdf',
                              );
                              await _updateStatus(ReportStatus.printed);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Interactive PDF Canvas & Verification Toolbar
                Expanded(
                  child: Container(
                    color: isDark ? const Color(0xFF0B132B) : const Color(0xFFF1F5F9),
                    child: PdfPreview(
                      build: (format) => _buildPdf(format),
                      pdfFileName: 'GAMCA_Report_${serial.replaceAll("/", "_")}.pdf',
                      canChangeOrientation: false,
                      canChangePageFormat: false,
                      canDebug: false,
                      maxPageWidth: 780,
                      actions: [
                        PdfPreviewAction(
                          icon: const Icon(Icons.verified_user_rounded),
                          onPressed: (context, build, pageFormat) async => _updateStatus(ReportStatus.completed),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
