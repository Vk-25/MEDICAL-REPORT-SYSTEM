import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../core/models.dart';
import '../core/providers.dart';
import '../core/theme.dart';
import '../core/utils.dart';
import '../widgets/common_widgets.dart';
import '../widgets/report_widgets.dart';

/// Interactive Clinical Report Form & Examination Dashboard Page.
class ReportFormPage extends ConsumerStatefulWidget {
  final int? reportId;

  const ReportFormPage({super.key, this.reportId});

  @override
  ConsumerState<ReportFormPage> createState() => _ReportFormPageState();
}

class _ReportFormPageState extends ConsumerState<ReportFormPage> {
  Report _report = Report(
    serialNumber: '2026/0001',
    examDate: DateTime.now(),
  );
  bool _isLoading = true;
  String? _lastSavedTime;
  Timer? _autoSaveTimer;

  @override
  void initState() {
    super.initState();
    _initReport();
    _startAutoSave();
  }

  Future<void> _initReport() async {
    final reportRepo = ref.read(reportRepositoryProvider);
    if (widget.reportId != null) {
      final existing = await reportRepo.findById(widget.reportId!);
      if (existing != null) {
        if (mounted) {
          setState(() {
            _report = existing;
            _isLoading = false;
          });
        }
        return;
      }
    }

    // Generate new serial number
    final count = await reportRepo.count();
    final newSerial = Formatters.generateSerialNumber(count + 1);
    if (mounted) {
      setState(() {
        _report = Report(
          serialNumber: newSerial,
          examDate: DateTime.now(),
          status: ReportStatus.draft,
        );
        _isLoading = false;
      });
    }
  }

  void _startAutoSave() {
    _autoSaveTimer = Timer.periodic(const Duration(seconds: 45), (timer) async {
      if (!mounted || _isLoading) return;
      if (_report.patientInfo.name != null && _report.patientInfo.name!.trim().isNotEmpty) {
        await _saveReport(silent: true);
      }
    });
  }

  @override
  void dispose() {
    _autoSaveTimer?.cancel();
    super.dispose();
  }

  void _updateReport(Report newReport) {
    setState(() {
      _report = newReport;
    });
  }

  Future<int> _saveReport({ReportStatus? status, bool silent = false}) async {
    final reportRepo = ref.read(reportRepositoryProvider);
    final toSave = status != null ? _report.copyWith(status: status) : _report;

    int savedId;
    if (toSave.id == null || toSave.id == 0) {
      savedId = await reportRepo.create(toSave);
      _report = toSave.copyWith(id: savedId);
    } else {
      await reportRepo.update(toSave);
      savedId = toSave.id!;
      _report = toSave;
    }

    if (mounted) {
      setState(() {
        _lastSavedTime = DateTime.now().toDisplayDateTime();
      });
      if (!silent) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Examination report successfully saved as ${_report.status.name.toUpperCase()} (#${_report.serialNumber})'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: const Color(0xFF0F766E),
          ),
        );
      }
    }
    return savedId;
  }

  void _onExistingPatientSelected(Patient? p) {
    if (p == null) return;
    setState(() {
      _report = _report.copyWith(
        patientId: p.id,
        patientInfo: _report.patientInfo.copyWith(
          name: p.name,
          passportNumber: p.passportNumber,
          nationality: p.nationality,
          age: p.age,
          gender: p.gender,
          height: p.height,
          weight: p.weight,
          bloodGroup: p.bloodGroup,
          phone: p.phone,
          email: p.email,
          photoPath: p.photoPath,
        ),
      );
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Loaded clinical candidate data for ${p.name} (${p.passportNumber})'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _setAllPhysicalNormal() {
    setState(() {
      _report = _report.copyWith(
        medicalExam: _report.medicalExam.copyWith(
          eyeVisionRight: '6/6',
          eyeVisionLeft: '6/6',
          colorVision: 'NORMAL',
          earRight: 'NORMAL',
          earLeft: 'NORMAL',
          cardiovascular: 'NAD',
          respiratory: 'NAD',
          gastrointestinal: 'NAD',
          centralNervousSystem: 'NAD',
          hernia: 'ABSENT',
          varicoseVeins: 'ABSENT',
          extremities: 'NORMAL',
          skin: 'NORMAL',
          deformities: 'NIL',
          psychiatric: 'NORMAL',
        ),
      );
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('All physical examination systems set to NORMAL / NAD.'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _setAllLabNormal() {
    setState(() {
      _report = _report.copyWith(
        labInvestigation: _report.labInvestigation.copyWith(
          urineProtein: 'NIL',
          urineSugar: 'NIL',
          urineMicroscopic: 'NAD',
          stoolHelminths: 'ABSENT',
          stoolProtozoa: 'ABSENT',
          hivElisa: 'NON-REACTIVE',
          hbsagElisa: 'NON-REACTIVE',
          hcvElisa: 'NON-REACTIVE',
          vdrl: 'NON-REACTIVE',
          malaria: 'NEGATIVE',
          microfilaria: 'NEGATIVE',
          chestXray: 'NORMAL / NO ACTIVE PNEUMONIA OR TB',
        ),
      );
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('All laboratory and serology investigations set to NEGATIVE / NORMAL.'),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(body: Center(child: AppLoading(height: 400)));
    }

    final patientsAsync = ref.watch(patientListProvider);
    final doctorsAsync = ref.watch(doctorListProvider);
    final clinicsAsync = ref.watch(clinicListProvider);

    final existingPatients = patientsAsync.valueOrNull ?? [];
    final doctors = doctorsAsync.valueOrNull ?? [];
    final clinics = clinicsAsync.valueOrNull ?? [];

    final remarksSection = RemarksAndActionsSection(
      report: _report,
      onChanged: _updateReport,
      onSaveDraft: () => _saveReport(status: ReportStatus.draft),
      onSaveAndPreview: () async {
        final id = await _saveReport(status: ReportStatus.completed);
        if (mounted && context.mounted) context.go('/reports/preview/$id');
      },
      onPrintDirect: () async {
        final id = await _saveReport(status: ReportStatus.printed);
        if (mounted && context.mounted) context.go('/reports/preview/$id');
      },
    );

    return Shortcuts(
      shortcuts: AppShortcuts.shortcuts,
      child: Actions(
        actions: {
          SaveReportIntent: CallbackAction<SaveReportIntent>(onInvoke: (_) => _saveReport(status: ReportStatus.draft)),
          PrintReportIntent: CallbackAction<PrintReportIntent>(onInvoke: (_) async {
            final id = await _saveReport(status: ReportStatus.completed);
            if (mounted && context.mounted) context.go('/reports/preview/$id');
            return null;
          }),
        },
        child: Focus(
          autofocus: true,
          child: Scaffold(
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top Clinical Header Bar
                  _buildHeaderCard(context),
                  const SizedBox(height: 24),

                  // All Sections Stream
                  PatientInfoFormSection(
                    report: _report,
                    existingPatients: existingPatients,
                    doctors: doctors,
                    clinics: clinics,
                    onChanged: _updateReport,
                    onExistingPatientSelected: _onExistingPatientSelected,
                  ),
                  const SizedBox(height: 28),
                  PhysicalExamFormSection(
                    report: _report,
                    onChanged: _updateReport,
                    onSetAllNormal: _setAllPhysicalNormal,
                  ),
                  const SizedBox(height: 28),
                  LabInvestigationsFormSection(
                    report: _report,
                    onChanged: _updateReport,
                    onSetAllNormal: _setAllLabNormal,
                  ),
                  const SizedBox(height: 28),
                  remarksSection,
                  const SizedBox(height: 48),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderCard(BuildContext context) {
    final candidateName = _report.patientInfo.name;
    final hasCandidate = candidateName != null && candidateName.trim().isNotEmpty;
    final displayName = hasCandidate ? candidateName.trim() : 'New Candidate Examination';
    final isDark = context.isDark;
    final isReadyToFinalize = hasCandidate &&
        _report.patientInfo.passportNumber != null &&
        _report.patientInfo.passportNumber!.trim().isNotEmpty;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isDark
              ? [const Color(0xFF134E4A), const Color(0xFF1E293B)]
              : [const Color(0xFF0F766E), const Color(0xFF312E81)],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F766E).withValues(alpha: 0.25),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 20,
        runSpacing: 16,
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 260),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Icon(Icons.assignment_ind_rounded, color: Colors.white, size: 30),
                ),
                const SizedBox(width: 18),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Wrap(
                      spacing: 10,
                      runSpacing: 8,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            'GAMCA / OCCUPATIONAL SERIAL #${_report.serialNumber}',
                            style: context.textTheme.labelLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 0.8,
                            ),
                          ),
                        ),
                        AppStatusBadge.fromReportStatus(_report.status, context: context),
                        if (!isReadyToFinalize)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF59E0B).withValues(alpha: 0.25),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: const Color(0xFFFBBF24).withValues(alpha: 0.6)),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.info_outline_rounded, size: 13, color: Color(0xFFFDE68A)),
                                const SizedBox(width: 4),
                                Text(
                                  'Name & passport required',
                                  style: context.textTheme.labelSmall?.copyWith(color: const Color(0xFFFDE68A), fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      displayName,
                      style: context.textTheme.headlineSmall?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (_report.patientInfo.passportNumber != null && _report.patientInfo.passportNumber!.isNotEmpty) ...[
                          const Icon(Icons.badge_outlined, size: 14, color: Colors.white70),
                          const SizedBox(width: 4),
                          Text(
                            'Passport: ${_report.patientInfo.passportNumber} • ',
                            style: context.textTheme.bodySmall?.copyWith(color: Colors.white70, fontWeight: FontWeight.w600),
                          ),
                        ],
                        const Icon(Icons.cloud_done_rounded, size: 14, color: Color(0xFF5EEAD4)),
                        const SizedBox(width: 4),
                        Text(
                          _lastSavedTime != null ? 'Auto-saved at $_lastSavedTime' : 'System auto-save active (every 45s)',
                          style: context.textTheme.bodySmall?.copyWith(color: const Color(0xFF5EEAD4), fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: BorderSide(color: Colors.white.withValues(alpha: 0.4)),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                ),
                icon: const Icon(Icons.refresh_rounded, size: 18),
                label: const Text('Reset Form'),
                onPressed: () async {
                  final confirm = await AppDialog.showConfirmation(
                    context: context,
                    title: 'Reset Report Form',
                    message: 'Are you sure you want to clear all entered data and reset this form to default blank parameters?',
                    confirmLabel: 'Reset Form',
                    isDestructive: true,
                  );
                  if (confirm == true) {
                    _initReport();
                  }
                },
              ),
              const SizedBox(width: 12),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: const Color(0xFF0F766E),
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  elevation: 2,
                ),
                icon: const Icon(Icons.print_rounded, size: 18),
                label: const Text('Save & Preview PDF (Ctrl+P)', style: TextStyle(fontWeight: FontWeight.bold)),
                onPressed: () async {
                  if (Validators.required(_report.patientInfo.name) != null ||
                      Validators.required(_report.patientInfo.passportNumber) != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter Candidate Full Name and Passport Number before generating PDF preview.'),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: AppColors.error,
                      ),
                    );
                    return;
                  }
                  final id = await _saveReport(status: _report.status == ReportStatus.draft ? ReportStatus.completed : _report.status);
                  if (mounted && context.mounted) context.go('/reports/preview/$id');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}