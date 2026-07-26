import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
  ReportTemplate? _template;
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

    final templates = await ref.read(templateRepositoryProvider).getAll();
    ReportTemplate? template;
    if (report != null) {
      final match = templates.cast<Template?>().firstWhere(
        (t) => t?.id?.toString() == report.templateId,
        orElse: () => templates.cast<Template?>().firstWhere((t) => t?.isDefault == true, orElse: () => templates.isNotEmpty ? templates.first : null),
      );
      if (match != null) {
        template = ReportTemplate.fromTemplate(match);
      }
    }

    if (mounted) {
      setState(() {
        _report = report;
        _clinic = clinic;
        _doctor = doctor;
        _template = template;
        _isLoading = false;
      });
    }
  }

  Future<Uint8List> _buildPdf(PdfPageFormat format) async {
    final currentReport = _report;
    if (currentReport == null) return Uint8List(0);
    final pdfService = ref.read(pdfServiceProvider);
    return await pdfService.generateGamcaReport(currentReport, _clinic, _doctor, template: _template);
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

  Future<void> _updateDecision(String decision) async {
    final currentReport = _report;
    if (currentReport == null) return;
    final reportRepo = ref.read(reportRepositoryProvider);
    final updated = currentReport.copyWith(remarks: decision);
    await reportRepo.update(updated);
    if (mounted) {
      setState(() {
        _report = updated;
      });
    }
    if (mounted && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Medical decision updated to: $decision'),
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

    const double sidebarWidth = 380.0;

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
                // Premium Glassmorphic / Gradient Top Action Bar
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: isDark
                          ? [const Color(0xFF0B1329), const Color(0xFF1E293B)]
                          : [const Color(0xFF0F766E), const Color(0xFF312E81)],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.15),
                        blurRadius: 12,
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
                            tooltip: 'Return to Report Archives',
                            onPressed: () => context.go(AppRoutes.reportHistory),
                          ),
                          const SizedBox(width: 12),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.12),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(Icons.picture_as_pdf_rounded, color: Colors.white, size: 20),
                          ),
                          const SizedBox(width: 14),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'OFFICIAL MEDICAL REPORT PREVIEW',
                                    style: context.textTheme.labelMedium?.copyWith(
                                      color: const Color(0xFF2DD4BF),
                                      fontWeight: FontWeight.w800,
                                      letterSpacing: 1.0,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  AppStatusBadge.fromReportStatus(currentReport.status, context: context),
                                ],
                              ),
                              const SizedBox(height: 2),
                              Text(
                                '$candidateName • Serial: $serial',
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
                              side: BorderSide(color: Colors.white.withValues(alpha: 0.3)),
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                            ),
                            icon: const Icon(Icons.edit_note_rounded, size: 18),
                            label: const Text('Edit Parameters'),
                            onPressed: () => context.go('/reports/generate?id=${widget.reportId}'),
                          ),
                          const SizedBox(width: 12),
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: const Color(0xFF0F766E),
                              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 14),
                              elevation: 3,
                            ),
                            icon: const Icon(Icons.print_rounded, size: 18),
                            label: const Text('Print Certificate', style: TextStyle(fontWeight: FontWeight.bold)),
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

                // Responsive Body Split Pane
                Expanded(
                  child: Container(
                    color: isDark ? const Color(0xFF0F172A) : const Color(0xFFF8FAFC),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        final isWide = constraints.maxWidth > 1000;
                        if (isWide) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // Left Sidebar Dossier Panel
                              Container(
                                width: sidebarWidth,
                                decoration: BoxDecoration(
                                  border: Border(
                                    right: BorderSide(
                                      color: isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0),
                                    ),
                                  ),
                                  color: isDark ? const Color(0xFF1E293B) : Colors.white,
                                ),
                                child: SingleChildScrollView(
                                  padding: const EdgeInsets.all(24),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      _buildDossierCard(context, currentReport, passport),
                                      const SizedBox(height: 20),
                                      _buildDecisionPanel(context, currentReport),
                                      const SizedBox(height: 20),
                                      _buildOperationsPanel(context),
                                      const SizedBox(height: 20),
                                      _buildDoctorCard(context),
                                    ],
                                  ),
                                ),
                              ),

                              // Right PDF Document Preview Canvas Area
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(28),
                                  color: isDark ? const Color(0xFF0F172A) : const Color(0xFFF1F5F9),
                                  child: Center(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withValues(alpha: isDark ? 0.4 : 0.12),
                                              blurRadius: 24,
                                              offset: const Offset(0, 10),
                                            ),
                                          ],
                                        ),
                                        child: PdfPreview(
                                          build: (format) => _buildPdf(format),
                                          pdfFileName: 'GAMCA_Report_${serial.replaceAll("/", "_")}.pdf',
                                          canChangeOrientation: false,
                                          canChangePageFormat: false,
                                          canDebug: false,
                                          maxPageWidth: 720,
                                          actions: [
                                            PdfPreviewAction(
                                              icon: const Icon(Icons.verified_user_rounded),
                                              onPressed: (context, build, pageFormat) async => _updateStatus(ReportStatus.completed),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else {
                          // Stacked layout for compact screens
                          return SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  _buildDossierCard(context, currentReport, passport),
                                  const SizedBox(height: 16),
                                  _buildDecisionPanel(context, currentReport),
                                  const SizedBox(height: 16),
                                  _buildOperationsPanel(context),
                                  const SizedBox(height: 24),
                                  Container(
                                    height: 700,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withValues(alpha: 0.1),
                                          blurRadius: 16,
                                          offset: const Offset(0, 4),
                                        ),
                                      ],
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: PdfPreview(
                                        build: (format) => _buildPdf(format),
                                        pdfFileName: 'GAMCA_Report_${serial.replaceAll("/", "_")}.pdf',
                                        canChangeOrientation: false,
                                        canChangePageFormat: false,
                                        canDebug: false,
                                        maxPageWidth: 720,
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
                          );
                        }
                      },
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

  Widget _buildDossierCard(BuildContext context, Report report, String passport) {
    final patient = report.patientInfo;
    final initial = (patient.name != null && patient.name!.isNotEmpty) ? patient.name!.substring(0, 1).toUpperCase() : '?';

    return AppCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: context.colorScheme.primary.withValues(alpha: 0.15),
                child: Text(
                  initial,
                  style: TextStyle(
                    color: context.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      patient.name ?? 'Unnamed Candidate',
                      style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Nationality: ${patient.nationality ?? "INDIAN"}',
                      style: context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          const Divider(height: 1),
          const SizedBox(height: 16),
          _buildDossierRow(context, Icons.credit_card_rounded, 'Passport Number', passport, trailing: IconButton(
            icon: const Icon(Icons.copy_rounded, size: 16),
            tooltip: 'Copy Passport Number',
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: () {
              Clipboard.setData(ClipboardData(text: passport));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Copied passport number to clipboard.'),
                  behavior: SnackBarBehavior.floating,
                  duration: Duration(seconds: 2),
                ),
              );
            },
          )),
          const SizedBox(height: 12),
          _buildDossierRow(context, Icons.cake_outlined, 'Candidate Age', '${patient.age ?? "Not Specified"} Years'),
          const SizedBox(height: 12),
          _buildDossierRow(context, Icons.tag_rounded, 'Report Serial #', report.serialNumber),
          const SizedBox(height: 12),
          _buildDossierRow(context, Icons.calendar_month_outlined, 'Exam Date', report.examDate.toDisplayDate()),
        ],
      ),
    );
  }

  Widget _buildDossierRow(BuildContext context, IconData icon, String label, String value, {Widget? trailing}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon, size: 18, color: context.colorScheme.primary),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: context.textTheme.bodySmall?.copyWith(fontSize: 10, color: context.colorScheme.onSurfaceVariant, fontWeight: FontWeight.w600)),
            Text(value, style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700)),
          ],
        ),
        if (trailing != null) ...[
          const Spacer(),
          trailing,
        ],
      ],
    );
  }

  Widget _buildDecisionPanel(BuildContext context, Report report) {
    final decision = (report.finalStatus ?? 'PENDING').toUpperCase();
    final isFit = decision.contains('FIT') && !decision.contains('UNFIT');
    final isUnfit = decision.contains('UNFIT');

    Color decisionColor = const Color(0xFFD97706); // Amber
    IconData decisionIcon = Icons.hourglass_empty_rounded;
    String statusTitle = 'PENDING MEDICAL DECISION';

    if (isFit) {
      decisionColor = const Color(0xFF16A34A); // Green
      decisionIcon = Icons.check_circle_rounded;
      statusTitle = 'FIT / CERTIFIED';
    } else if (isUnfit) {
      decisionColor = const Color(0xFFDC2626); // Red
      decisionIcon = Icons.cancel_rounded;
      statusTitle = 'UNFIT / REJECTED';
    }

    return AppCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Clinical Status & Decision',
            style: context.textTheme.labelMedium?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            decoration: BoxDecoration(
              color: decisionColor.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: decisionColor.withValues(alpha: 0.35), width: 1.5),
              boxShadow: [
                BoxShadow(
                  color: decisionColor.withValues(alpha: 0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Icon(decisionIcon, color: decisionColor, size: 28),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        statusTitle,
                        style: TextStyle(
                          color: decisionColor,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 0.5,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        isFit
                            ? 'Candidate meets GAMCA clearance guidelines.'
                            : isUnfit
                                ? 'Candidate is medically restricted.'
                                : 'Pending clinical verification checks.',
                        style: context.textTheme.bodySmall?.copyWith(fontSize: 11),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          Text(
            'Quick Actions: Mark Candidate As',
            style: context.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700, color: context.colorScheme.onSurfaceVariant),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: isFit ? null : () => _updateDecision('FIT'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF16A34A),
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: const Color(0xFF16A34A).withValues(alpha: 0.25),
                    disabledForegroundColor: Colors.white70,
                    elevation: isFit ? 0 : 2,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  icon: const Icon(Icons.check, size: 16),
                  label: const Text('FIT', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: isUnfit ? null : () => _updateDecision('UNFIT'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFDC2626),
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: const Color(0xFFDC2626).withValues(alpha: 0.25),
                    disabledForegroundColor: Colors.white70,
                    elevation: isUnfit ? 0 : 2,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  icon: const Icon(Icons.close, size: 16),
                  label: const Text('UNFIT', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOperationsPanel(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'File Operations',
            style: context.textTheme.labelMedium?.copyWith(
              color: context.colorScheme.onSurfaceVariant,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 14),
          ElevatedButton.icon(
            onPressed: () async {
              await Printing.layoutPdf(
                onLayout: (format) => _buildPdf(format),
                name: 'GAMCA_Report_${_report!.serialNumber.replaceAll("/", "_")}.pdf',
              );
              await _updateStatus(ReportStatus.printed);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: context.colorScheme.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              elevation: 2,
            ),
            icon: const Icon(Icons.print_rounded, size: 18),
            label: const Text('Print Report / Certificate', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 10),
          OutlinedButton.icon(
            onPressed: _saveToDisk,
            style: OutlinedButton.styleFrom(
              foregroundColor: context.colorScheme.primary,
              side: BorderSide(color: context.colorScheme.primary, width: 1.5),
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            icon: const Icon(Icons.file_download_outlined, size: 18),
            label: const Text('Export PDF File', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 10),
          OutlinedButton.icon(
            onPressed: () => context.go('/reports/generate?id=${widget.reportId}'),
            style: OutlinedButton.styleFrom(
              foregroundColor: context.colorScheme.onSurface,
              side: BorderSide(color: context.colorScheme.outline.withValues(alpha: 0.6), width: 1),
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            icon: const Icon(Icons.edit_note_rounded, size: 18),
            label: const Text('Back to Editor', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  Widget _buildDoctorCard(BuildContext context) {
    final docName = _doctor?.name ?? 'Dr. Abdhesh J Mahto';
    final docDesig = _doctor?.designation ?? 'Consultants Occupational Health Physician';

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerHighest.withValues(alpha: 0.25),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: context.colorScheme.outline.withValues(alpha: 0.35)),
      ),
      child: Row(
        children: [
          Icon(Icons.verified_user_rounded, color: context.colorScheme.primary, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sign-Off Physician',
                  style: context.textTheme.bodySmall?.copyWith(fontSize: 10, color: context.colorScheme.onSurfaceVariant, fontWeight: FontWeight.bold),
                ),
                Text(
                  docName,
                  style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  docDesig,
                  style: context.textTheme.bodySmall?.copyWith(fontSize: 10),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
