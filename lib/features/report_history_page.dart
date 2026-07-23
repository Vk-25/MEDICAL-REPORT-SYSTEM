import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../core/config.dart';
import '../core/models.dart';
import '../core/providers.dart';
import '../core/theme.dart';
import '../core/utils.dart';
import '../widgets/common_widgets.dart';

/// Comprehensive Report Archive, Audit History, and Batch Processing Page.
class ReportHistoryPage extends ConsumerStatefulWidget {
  const ReportHistoryPage({super.key});

  @override
  ConsumerState<ReportHistoryPage> createState() => _ReportHistoryPageState();
}

class _ReportHistoryPageState extends ConsumerState<ReportHistoryPage> {
  final TextEditingController _searchController = TextEditingController();
  ReportStatus? _selectedStatusFilter;
  String _selectedResultFilter = 'All';
  final Set<int> _selectedReportIds = {};

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Patient? _findPatient(List<Patient> patients, int patientId) {
    try {
      return patients.firstWhere((p) => p.id == patientId);
    } catch (_) {
      return null;
    }
  }

  Future<void> _deleteReport(Report report, String displayName) async {
    if (report.id == null) return;
    return AppDialog.showConfirmation(
      context: context,
      title: 'Archive / Delete Report',
      message: 'Are you sure you want to permanently delete examination report "${report.serialNumber}" for candidate "$displayName"? This action cannot be undone.',
      confirmLabel: 'Delete Report',
      isDestructive: true,
    ).then((confirmed) async {
      if (confirmed == true && mounted && report.id != null) {
        await ref.read(reportRepositoryProvider).delete(report.id!);
        setState(() => _selectedReportIds.remove(report.id!));
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Report "${report.serialNumber}" permanently removed from archives.'),
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      }
    });
  }

  Future<void> _batchDeleteSelected(List<Report> allReports) async {
    if (_selectedReportIds.isEmpty) return;
    final count = _selectedReportIds.length;

    final confirmed = await AppDialog.showConfirmation(
      context: context,
      title: 'Batch Delete Examination Reports',
      message: 'Are you sure you want to permanently delete $count selected examination reports? This action will remove all associated clinical data and cannot be undone.',
      confirmLabel: 'Delete $count Reports',
      isDestructive: true,
    );

    if (confirmed == true && mounted) {
      for (final id in _selectedReportIds) {
        await ref.read(reportRepositoryProvider).delete(id);
      }
      setState(() => _selectedReportIds.clear());
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Successfully deleted $count reports from system archives.'),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  Future<void> _batchMarkCompleted(List<Report> allReports) async {
    if (_selectedReportIds.isEmpty) return;
    final count = _selectedReportIds.length;

    for (final id in _selectedReportIds) {
      try {
        final r = allReports.firstWhere((item) => item.id == id);
        final updated = r.copyWith(status: ReportStatus.completed);
        await ref.read(reportRepositoryProvider).save(updated);
      } catch (_) {}
    }

    setState(() => _selectedReportIds.clear());
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Marked $count selected reports as COMPLETED.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final reportsAsync = ref.watch(reportListProvider);
    final patientsAsync = ref.watch(patientListProvider);
    final topSearchQuery = ref.watch(searchQueryProvider);

    return Scaffold(
      body: reportsAsync.when(
        loading: () => const Padding(padding: EdgeInsets.all(32), child: AppLoading(height: 400)),
        error: (err, stack) => Padding(
          padding: const EdgeInsets.all(32),
          child: AppEmptyState(
            icon: Icons.error_outline_rounded,
            title: 'Error Loading Report Archives',
            message: err.toString(),
            actionLabel: 'Refresh Archives',
            onAction: () => ref.refresh(reportListProvider),
          ),
        ),
        data: (reports) {
          return patientsAsync.when(
            loading: () => const Padding(padding: EdgeInsets.all(32), child: AppLoading(height: 400)),
            error: (err, stack) => Padding(
              padding: const EdgeInsets.all(32),
              child: AppEmptyState(
                icon: Icons.error_outline_rounded,
                title: 'Error Loading Patient Directory for Archives',
                message: err.toString(),
              ),
            ),
            data: (patients) {
              // Filter reports
              final query = (_searchController.text.isNotEmpty ? _searchController.text : topSearchQuery).toLowerCase().trim();
              final filtered = reports.where((r) {
                final patient = _findPatient(patients, r.patientId);
                final name = patient?.name ?? r.patientName ?? '';
                final passport = patient?.passportNumber ?? r.passportNumber ?? '';

                final matchesSearch = query.isEmpty ||
                    r.serialNumber.toLowerCase().contains(query) ||
                    name.toLowerCase().contains(query) ||
                    passport.toLowerCase().contains(query) ||
                    (r.finalStatus ?? '').toLowerCase().contains(query);

                final matchesStatus = _selectedStatusFilter == null || r.status == _selectedStatusFilter;

                final resultUpper = (r.finalStatus ?? '').toUpperCase().trim();
                final matchesResult = _selectedResultFilter == 'All' ||
                    (_selectedResultFilter == 'FIT' && (resultUpper.contains('FIT') || resultUpper.contains('NORMAL'))) ||
                    (_selectedResultFilter == 'UNFIT' && resultUpper.contains('UNFIT')) ||
                    (_selectedResultFilter == 'PENDING' && (resultUpper.isEmpty || resultUpper == 'PENDING'));

                return matchesSearch && matchesStatus && matchesResult;
              }).toList();

              // Sort by examination date descending
              filtered.sort((a, b) => b.examinationDate.compareTo(a.examinationDate));

              return SingleChildScrollView(
                padding: const EdgeInsets.all(28),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SectionHeader(
                      title: 'Medical Report Archives & Audit Log',
                      subtitle: 'Search, filter, export, and batch process all candidate clinical reports (${reports.length} total)',
                      action: ElevatedButton.icon(
                        onPressed: () => context.go(AppRoutes.reportGenerate),
                        icon: const Icon(Icons.add_circle_outline_rounded, size: 18),
                        label: const Text('New Examination'),
                      ),
                    ),

                    // Search & Filter Toolbar
                    AppCard(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: TextField(
                              controller: _searchController,
                              decoration: InputDecoration(
                                hintText: 'Search by serial #, candidate name, passport number, result...',
                                prefixIcon: const Icon(Icons.search_rounded, size: 20),
                                suffixIcon: _searchController.text.isNotEmpty
                                    ? IconButton(
                                        icon: const Icon(Icons.clear_rounded, size: 18),
                                        onPressed: () => setState(() => _searchController.clear()),
                                      )
                                    : null,
                              ),
                              onChanged: (_) => setState(() {}),
                            ),
                          ),
                          const SizedBox(width: 16),
                          SizedBox(
                            width: 180,
                            child: DropdownButtonFormField<ReportStatus?>(
                              isExpanded: true,
                              value: _selectedStatusFilter,
                              decoration: const InputDecoration(
                                labelText: 'Report Status',
                                contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                              ),
                              items: const [
                                DropdownMenuItem(value: null, child: Text('All Statuses')),
                                DropdownMenuItem(value: ReportStatus.draft, child: Text('Draft')),
                                DropdownMenuItem(value: ReportStatus.pending, child: Text('Pending')),
                                DropdownMenuItem(value: ReportStatus.completed, child: Text('Completed')),
                                DropdownMenuItem(value: ReportStatus.printed, child: Text('Printed')),
                              ],
                              onChanged: (val) => setState(() => _selectedStatusFilter = val),
                            ),
                          ),
                          const SizedBox(width: 16),
                          SizedBox(
                            width: 170,
                            child: DropdownButtonFormField<String>(
                              isExpanded: true,
                              value: _selectedResultFilter,
                              decoration: const InputDecoration(
                                labelText: 'Medical Fit Result',
                                contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                              ),
                              items: const [
                                DropdownMenuItem(value: 'All', child: Text('All Results')),
                                DropdownMenuItem(value: 'FIT', child: Text('Fit / Normal')),
                                DropdownMenuItem(value: 'UNFIT', child: Text('Unfit / Abnormal')),
                                DropdownMenuItem(value: 'PENDING', child: Text('Pending Result')),
                              ],
                              onChanged: (val) {
                                if (val != null) setState(() => _selectedResultFilter = val);
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                          OutlinedButton.icon(
                            onPressed: () {
                              setState(() {
                                _searchController.clear();
                                _selectedStatusFilter = null;
                                _selectedResultFilter = 'All';
                              });
                              ref.read(searchQueryProvider.notifier).state = '';
                            },
                            icon: const Icon(Icons.refresh_rounded, size: 18),
                            label: const Text('Reset'),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Batch Action Bar
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      child: _selectedReportIds.isNotEmpty
                          ? _buildBatchActionBar(context, filtered)
                          : const SizedBox.shrink(),
                    ),
                    if (_selectedReportIds.isNotEmpty) const SizedBox(height: 16),

                    // Report Table
                    if (filtered.isEmpty)
                      AppCard(
                        child: AppEmptyState(
                          icon: Icons.folder_open_rounded,
                          title: query.isNotEmpty || _selectedStatusFilter != null || _selectedResultFilter != 'All' ? 'No Matching Reports Found' : 'Archive is Empty',
                          message: query.isNotEmpty || _selectedStatusFilter != null || _selectedResultFilter != 'All'
                              ? 'No medical reports match your current filter criteria. Try clearing filters.'
                              : 'You have not generated any clinical reports yet. Click "New Examination" above to create your first report.',
                          actionLabel: query.isNotEmpty || _selectedStatusFilter != null || _selectedResultFilter != 'All' ? 'Clear Filters' : 'New Examination',
                          onAction: query.isNotEmpty || _selectedStatusFilter != null || _selectedResultFilter != 'All'
                              ? () {
                                  setState(() {
                                    _searchController.clear();
                                    _selectedStatusFilter = null;
                                    _selectedResultFilter = 'All';
                                  });
                                }
                              : () => context.go(AppRoutes.reportGenerate),
                        ),
                      )
                    else
                      _buildReportsTable(context, filtered, patients),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildBatchActionBar(BuildContext context, List<Report> allReports) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: context.isDark
              ? [const Color(0xFF134E4A), const Color(0xFF1E293B)]
              : [const Color(0xFF0F766E), const Color(0xFF312E81)],
        ),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F766E).withValues(alpha: 0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.check_box_rounded, color: Colors.white, size: 18),
                const SizedBox(width: 6),
                Text(
                  '${_selectedReportIds.length} Selected',
                  style: context.textTheme.labelLarge?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Text(
            'Batch Operations:',
            style: context.textTheme.bodyMedium?.copyWith(color: Colors.white.withValues(alpha: 0.85), fontWeight: FontWeight.w600),
          ),
          const Spacer(),
          OutlinedButton.icon(
            onPressed: () => _batchMarkCompleted(allReports),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: BorderSide(color: Colors.white.withValues(alpha: 0.4)),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            ),
            icon: const Icon(Icons.check_circle_outline_rounded, size: 18),
            label: const Text('Mark as Completed'),
          ),
          const SizedBox(width: 12),
          ElevatedButton.icon(
            onPressed: () => _batchDeleteSelected(allReports),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFDC2626),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            ),
            icon: const Icon(Icons.delete_sweep_rounded, size: 18),
            label: const Text('Delete Selected'),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.close_rounded, color: Colors.white),
            tooltip: 'Clear Selection',
            onPressed: () => setState(() => _selectedReportIds.clear()),
          ),
        ],
      ),
    );
  }

  Widget _buildReportsTable(BuildContext context, List<Report> reports, List<Patient> patients) {
    final ext = Theme.of(context).extension<AppThemeExtension>() ?? AppThemeExtension.light;
    final allSelected = reports.isNotEmpty && _selectedReportIds.length == reports.where((r) => r.id != null).length;

    return AppCard(
      padding: EdgeInsets.zero,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            headingRowColor: WidgetStateProperty.all(ext.tableHeaderBg),
            dataRowMinHeight: 68,
            dataRowMaxHeight: 68,
            horizontalMargin: 24,
            columnSpacing: 28,
            onSelectAll: (val) {
              setState(() {
                if (val == true) {
                  _selectedReportIds.addAll(reports.where((r) => r.id != null).map((r) => r.id!));
                } else {
                  _selectedReportIds.clear();
                }
              });
            },
            columns: [
              DataColumn(
                label: Checkbox(
                  value: allSelected,
                  onChanged: (val) {
                    setState(() {
                      if (val == true) {
                        _selectedReportIds.addAll(reports.where((r) => r.id != null).map((r) => r.id!));
                      } else {
                        _selectedReportIds.clear();
                      }
                    });
                  },
                ),
              ),
              DataColumn(label: Text('SERIAL #', style: context.textTheme.labelLarge?.copyWith(fontSize: 11, letterSpacing: 0.8))),
              DataColumn(label: Text('CANDIDATE / PATIENT', style: context.textTheme.labelLarge?.copyWith(fontSize: 11, letterSpacing: 0.8))),
              DataColumn(label: Text('PASSPORT', style: context.textTheme.labelLarge?.copyWith(fontSize: 11, letterSpacing: 0.8))),
              DataColumn(label: Text('EXAMINATION DATE', style: context.textTheme.labelLarge?.copyWith(fontSize: 11, letterSpacing: 0.8))),
              DataColumn(label: Text('REPORT STATUS', style: context.textTheme.labelLarge?.copyWith(fontSize: 11, letterSpacing: 0.8))),
              DataColumn(label: Text('CLINICAL RESULT', style: context.textTheme.labelLarge?.copyWith(fontSize: 11, letterSpacing: 0.8))),
              DataColumn(label: Text('ACTIONS', style: context.textTheme.labelLarge?.copyWith(fontSize: 11, letterSpacing: 0.8))),
            ],
            rows: reports.map((report) {
              final patient = _findPatient(patients, report.patientId);
              final name = patient?.name ?? report.patientName ?? 'Unknown Candidate';
              final passport = patient?.passportNumber ?? report.passportNumber ?? 'N/A';
              final initial = name.isNotEmpty ? name.substring(0, 1).toUpperCase() : '?';
              final isSelected = report.id != null && _selectedReportIds.contains(report.id);

              return DataRow(
                selected: isSelected,
                onSelectChanged: (val) {
                  setState(() {
                    if (val == true && report.id != null) {
                      _selectedReportIds.add(report.id!);
                    } else if (report.id != null) {
                      _selectedReportIds.remove(report.id);
                    }
                  });
                },
                cells: [
                  DataCell(
                    Checkbox(
                      value: isSelected,
                      onChanged: (val) {
                        setState(() {
                          if (val == true && report.id != null) {
                            _selectedReportIds.add(report.id!);
                          } else if (report.id != null) {
                            _selectedReportIds.remove(report.id);
                          }
                        });
                      },
                    ),
                  ),
                  DataCell(
                    Text(
                      report.serialNumber,
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: context.colorScheme.primary,
                      ),
                    ),
                  ),
                  DataCell(
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 17,
                          backgroundColor: context.colorScheme.primary.withValues(alpha: 0.15),
                          child: Text(
                            initial,
                            style: TextStyle(
                              color: context.colorScheme.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(name, style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700)),
                            if (patient?.nationality != null)
                              Text(patient!.nationality, style: context.textTheme.bodySmall?.copyWith(fontSize: 11)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  DataCell(
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: context.colorScheme.surface,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: context.colorScheme.outline.withValues(alpha: 0.6)),
                      ),
                      child: Text(
                        passport,
                        style: context.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700, fontFamily: 'monospace'),
                      ),
                    ),
                  ),
                  DataCell(
                    Text(
                      DateFormat('dd MMM yyyy').format(report.examinationDate),
                      style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                  DataCell(AppStatusBadge.fromReportStatus(report.status, context: context)),
                  DataCell(AppStatusBadge.fromResult(report.finalStatus, context: context)),
                  DataCell(
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.visibility_outlined, size: 20),
                          tooltip: 'Preview & Print PDF Certificate',
                          onPressed: () => context.go('/reports/preview/${report.id}'),
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit_outlined, size: 20),
                          tooltip: 'Edit Examination Details',
                          onPressed: () => context.go('/reports/generate?id=${report.id}'),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete_outline_rounded, size: 20, color: context.colorScheme.error),
                          tooltip: 'Delete Report Archive',
                          onPressed: () => _deleteReport(report, name),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
