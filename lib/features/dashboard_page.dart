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

/// Enterprise Occupational Health Dashboard with clinical metrics, quick workflows, and recent examinations.
class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reportsAsync = ref.watch(reportListProvider);
    final patientsAsync = ref.watch(patientListProvider);

    return reportsAsync.when(
      loading: () => const Padding(
        padding: EdgeInsets.all(32),
        child: AppLoading(height: 300),
      ),
      error: (err, stack) => Padding(
        padding: const EdgeInsets.all(32),
        child: AppEmptyState(
          icon: Icons.error_outline_rounded,
          title: 'Error Loading Dashboard Data',
          message: err.toString(),
          actionLabel: 'Retry',
          onAction: () => ref.refresh(reportListProvider),
        ),
      ),
      data: (reports) {
        return patientsAsync.when(
          loading: () => const Padding(
            padding: EdgeInsets.all(32),
            child: AppLoading(height: 300),
          ),
          error: (err, stack) => Padding(
            padding: const EdgeInsets.all(32),
            child: AppEmptyState(
              icon: Icons.error_outline_rounded,
              title: 'Error Loading Patient Metrics',
              message: err.toString(),
            ),
          ),
          data: (patients) {
            final totalPatients = patients.length;
            final totalReports = reports.length;
            final completedReports = reports.where((r) => r.status == ReportStatus.completed || r.status == ReportStatus.printed).length;
            final fitReports = reports.where((r) => (r.finalStatus ?? '').toUpperCase().contains('FIT') || (r.finalStatus ?? '').toUpperCase().contains('NORMAL')).length;
            final unfitReports = reports.where((r) => (r.finalStatus ?? '').toUpperCase().contains('UNFIT')).length;
            final pendingReports = reports.where((r) => r.status == ReportStatus.pending || r.status == ReportStatus.draft).length;

            final recentReports = List<MedicalReport>.from(reports)
              ..sort((a, b) => b.examinationDate.compareTo(a.examinationDate));
            final topRecent = recentReports.take(8).toList();

            return SingleChildScrollView(
              padding: const EdgeInsets.all(28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _WelcomeBanner(
                    totalReports: totalReports,
                    pendingReports: pendingReports,
                    onNewReport: () => context.go(AppRoutes.reportGenerate),
                  ),
                  const SizedBox(height: 28),

                  // KPI Section
                  const SectionHeader(
                    title: 'Clinical Operations Overview',
                    subtitle: 'Real-time throughput metrics across all occupational examinations',
                  ),
                  _buildKpiGrid(
                    context,
                    totalPatients: totalPatients,
                    completedReports: completedReports,
                    fitReports: fitReports,
                    unfitReports: unfitReports,
                    pendingReports: pendingReports,
                  ),
                  const SizedBox(height: 32),

                  // Quick Actions Row
                  const SectionHeader(
                    title: 'Quick Clinical Workflows',
                    subtitle: 'Initiate core medical tasks with single-click shortcuts',
                  ),
                  _QuickActionsRow(
                    onNewReport: () => context.go(AppRoutes.reportGenerate),
                    onAddPatient: () => context.go(AppRoutes.patients),
                    onBackup: () => context.go(AppRoutes.backup),
                    onTemplates: () => context.go(AppRoutes.templates),
                  ),
                  const SizedBox(height: 32),

                  // Recent Reports Table
                  SectionHeader(
                    title: 'Recent Medical Examinations',
                    subtitle: 'Latest candidate assessments and clinical certifications',
                    action: TextButton.icon(
                      onPressed: () => context.go(AppRoutes.reportHistory),
                      icon: const Icon(Icons.arrow_forward_rounded, size: 16),
                      label: const Text('View Full Archive'),
                    ),
                  ),
                  _RecentReportsCard(reports: topRecent, patients: patients),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildKpiGrid(
    BuildContext context, {
    required int totalPatients,
    required int completedReports,
    required int fitReports,
    required int unfitReports,
    required int pendingReports,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth > 1200
            ? 5
            : constraints.maxWidth > 800
                ? 3
                : 2;

        return GridView.count(
          crossAxisCount: crossAxisCount,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: constraints.maxWidth > 1200 ? 1.6 : 1.5,
          children: [
            KPICard(
              title: 'Total Candidates',
              value: totalPatients.toString(),
              subtitle: 'Registered in directory',
              icon: Icons.people_alt_rounded,
              color: const Color(0xFF0F766E),
            ),
            KPICard(
              title: 'Completed Reports',
              value: completedReports.toString(),
              subtitle: 'Certified examinations',
              icon: Icons.assignment_turned_in_rounded,
              color: const Color(0xFF4F46E5),
            ),
            KPICard(
              title: 'Fit Candidates',
              value: fitReports.toString(),
              subtitle: 'Medically cleared',
              icon: Icons.check_circle_rounded,
              color: const Color(0xFF16A34A),
            ),
            KPICard(
              title: 'Unfit Cases',
              value: unfitReports.toString(),
              subtitle: 'Requires medical review',
              icon: Icons.warning_rounded,
              color: const Color(0xFFDC2626),
            ),
            KPICard(
              title: 'Pending & Drafts',
              value: pendingReports.toString(),
              subtitle: 'Awaiting completion',
              icon: Icons.hourglass_empty_rounded,
              color: const Color(0xFFD97706),
            ),
          ],
        );
      },
    );
  }
}

class _WelcomeBanner extends StatelessWidget {
  final int totalReports;
  final int pendingReports;
  final VoidCallback onNewReport;

  const _WelcomeBanner({
    required this.totalReports,
    required this.pendingReports,
    required this.onNewReport,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDark;
    final hour = DateTime.now().hour;
    final greeting = hour < 12 ? 'Good Morning' : hour < 17 ? 'Good Afternoon' : 'Good Evening';
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: isDark
              ? [const Color(0xFF0F172A), const Color(0xFF134E4A)]
              : [const Color(0xFF0F766E), const Color(0xFF312E81)],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F766E).withValues(alpha: 0.25),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white.withValues(alpha: 0.25)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.stars_rounded, color: Color(0xFF5EEAD4), size: 16),
                      const SizedBox(width: 6),
                      Text(
                        'GAMCA & GCC ACCREDITED PORTAL',
                        style: context.textTheme.labelLarge?.copyWith(
                          color: Colors.white,
                          fontSize: 11,
                          letterSpacing: 1.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  greeting,
                  style: context.textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'System health is optimal. You have $pendingReports examinations pending final sign-off across $totalReports total recorded visits today.',
                  style: context.textTheme.bodyMedium?.copyWith(
                    color: Colors.white.withValues(alpha: 0.85),
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    ElevatedButton.icon(
                      onPressed: onNewReport,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2DD4BF),
                        foregroundColor: const Color(0xFF042F2E),
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                      ),
                      icon: const Icon(Icons.add_rounded, size: 20),
                      label: const Text('New Examination Report', style: TextStyle(fontWeight: FontWeight.w700)),
                    ),
                    const SizedBox(width: 14),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.calendar_today_rounded, size: 16, color: Colors.white),
                          const SizedBox(width: 8),
                          Text(
                            DateFormat('EEEE, MMMM d, yyyy').format(DateTime.now()),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (MediaQuery.of(context).size.width > 1000) ...[
            const SizedBox(width: 40),
            Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.08),
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white.withValues(alpha: 0.15), width: 2),
              ),
              child: const Center(
                child: Icon(
                  Icons.medical_services_outlined,
                  size: 56,
                  color: Color(0xFF5EEAD4),
                ),
              ),
            ),
            const SizedBox(width: 20),
          ],
        ],
      ),
    );
  }
}

class _QuickActionsRow extends StatelessWidget {
  final VoidCallback onNewReport;
  final VoidCallback onAddPatient;
  final VoidCallback onBackup;
  final VoidCallback onTemplates;

  const _QuickActionsRow({
    required this.onNewReport,
    required this.onAddPatient,
    required this.onBackup,
    required this.onTemplates,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth > 1000
            ? 4
            : constraints.maxWidth > 600
                ? 2
                : 1;

        return GridView.count(
          crossAxisCount: crossAxisCount,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: constraints.maxWidth > 1000 ? 2.5 : 2.2,
          children: [
            _QuickActionCard(
              title: 'Start New Examination',
              subtitle: 'Generate GAMCA certificate',
              icon: Icons.post_add_rounded,
              color: const Color(0xFF0F766E),
              onTap: onNewReport,
            ),
            _QuickActionCard(
              title: 'Register Candidate',
              subtitle: 'Add to patient directory',
              icon: Icons.person_add_alt_1_rounded,
              color: const Color(0xFF4F46E5),
              onTap: onAddPatient,
            ),
            _QuickActionCard(
              title: 'Database Snapshot',
              subtitle: 'Create encrypted backup',
              icon: Icons.backup_rounded,
              color: const Color(0xFF0284C7),
              onTap: onBackup,
            ),
            _QuickActionCard(
              title: 'Layout & Templates',
              subtitle: 'Customize clinical forms',
              icon: Icons.dashboard_customize_rounded,
              color: const Color(0xFF9333EA),
              onTap: onTemplates,
            ),
          ],
        );
      },
    );
  }
}

class _QuickActionCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _QuickActionCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  State<_QuickActionCard> createState() => _QuickActionCardState();
}

class _QuickActionCardState extends State<_QuickActionCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDark;
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1E293B) : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: _isHovered ? widget.color : (isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0)),
            width: _isHovered ? 1.5 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: _isHovered ? widget.color.withValues(alpha: 0.15) : Colors.black.withValues(alpha: isDark ? 0.2 : 0.03),
              blurRadius: _isHovered ? 14 : 8,
              offset: Offset(0, _isHovered ? 4 : 2),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onTap,
            borderRadius: BorderRadius.circular(14),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: widget.color.withValues(alpha: isDark ? 0.2 : 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(widget.icon, color: widget.color, size: 24),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: context.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: context.colorScheme.onSurface,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          widget.subtitle,
                          style: context.textTheme.bodySmall?.copyWith(
                            color: context.colorScheme.onSurfaceVariant,
                            fontSize: 11,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.chevron_right_rounded,
                    color: _isHovered ? widget.color : context.colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _RecentReportsCard extends StatelessWidget {
  final List<MedicalReport> reports;
  final List<Patient> patients;

  const _RecentReportsCard({required this.reports, required this.patients});

  Patient? _findPatient(int patientId) {
    try {
      return patients.firstWhere((p) => p.id == patientId);
    } catch (_) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (reports.isEmpty) {
      return AppCard(
        child: AppEmptyState(
          icon: Icons.folder_open_rounded,
          title: 'No Examination Records Found',
          message: 'You have not generated any medical examination reports yet. Click "New Examination" to start your first candidate screening.',
          actionLabel: 'New Examination',
          onAction: () => context.go(AppRoutes.reportGenerate),
        ),
      );
    }

    final ext = Theme.of(context).extension<AppThemeExtension>() ?? AppThemeExtension.light;

    return AppCard(
      padding: EdgeInsets.zero,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: constraints.maxWidth),
                child: DataTable(
                  headingRowColor: WidgetStateProperty.all(ext.tableHeaderBg),
                  dataRowMinHeight: 64,
                  dataRowMaxHeight: 64,
                  horizontalMargin: 24,
                  columnSpacing: 28,
                  columns: [
                    DataColumn(label: Text('SERIAL #', style: context.textTheme.labelLarge?.copyWith(fontSize: 11, letterSpacing: 0.8))),
                    DataColumn(label: Text('CANDIDATE / PATIENT', style: context.textTheme.labelLarge?.copyWith(fontSize: 11, letterSpacing: 0.8))),
                    DataColumn(label: Text('PASSPORT', style: context.textTheme.labelLarge?.copyWith(fontSize: 11, letterSpacing: 0.8))),
                    DataColumn(label: Text('EXAM DATE', style: context.textTheme.labelLarge?.copyWith(fontSize: 11, letterSpacing: 0.8))),
                    DataColumn(label: Text('STATUS', style: context.textTheme.labelLarge?.copyWith(fontSize: 11, letterSpacing: 0.8))),
                    DataColumn(label: Text('CLINICAL FIT', style: context.textTheme.labelLarge?.copyWith(fontSize: 11, letterSpacing: 0.8))),
                    DataColumn(label: Text('ACTIONS', style: context.textTheme.labelLarge?.copyWith(fontSize: 11, letterSpacing: 0.8))),
                  ],
                  rows: reports.map((report) {
                    final patient = _findPatient(report.patientId);
                    final name = patient?.fullName ?? report.patientName ?? 'Unknown Candidate';
                    final passport = patient?.passportNumber ?? report.passportNumber ?? 'N/A';
                    final initial = name.isNotEmpty ? name.substring(0, 1).toUpperCase() : '?';

                    return DataRow(
                      cells: [
                        DataCell(
                          Text(
                            report.serialNumber,
                            style: context.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: context.colorScheme.primary,
                            ),
                          ),
                        ),
                        DataCell(
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 16,
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
                                  Text(
                                    name,
                                    style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                                  ),
                                  if (patient?.nationality != null)
                                    Text(
                                      patient!.nationality,
                                      style: context.textTheme.bodySmall?.copyWith(fontSize: 11),
                                    ),
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
                              style: context.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600, fontFamily: 'monospace'),
                            ),
                          ),
                        ),
                        DataCell(
                          Text(
                            DateFormat('dd MMM yyyy').format(report.examinationDate),
                            style: context.textTheme.bodyMedium,
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
                                tooltip: 'Preview & Print PDF',
                                onPressed: () => context.go('/reports/preview/${report.id}'),
                              ),
                              IconButton(
                                icon: const Icon(Icons.edit_outlined, size: 20),
                                tooltip: 'Edit Examination Details',
                                onPressed: () => context.go('/reports/generate?id=${report.id}'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
