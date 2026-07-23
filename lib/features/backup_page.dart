import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as p;
import '../services/backup_service.dart';
import '../core/providers.dart';
import '../core/theme.dart';
import '../core/utils.dart';
import '../widgets/common_widgets.dart';

/// Database Snapshot, System Health, and Restore Center Page.
class BackupPage extends ConsumerStatefulWidget {
  const BackupPage({super.key});

  @override
  ConsumerState<BackupPage> createState() => _BackupPageState();
}

class _BackupPageState extends ConsumerState<BackupPage> {
  final BackupService _backupService = const BackupService();
  List<FileSystemEntity> _backups = [];
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadBackups();
  }

  Future<void> _loadBackups() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    try {
      final list = await _backupService.getAvailableBackups();
      if (mounted) {
        setState(() {
          _backups = list;
          _isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _errorMessage = e.toString();
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _createBackup() async {
    setState(() => _isLoading = true);
    try {
      final isar = ref.read(isarDatabaseProvider).instance;
      final file = await _backupService.createBackup(isar);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Successfully created backup: ${p.basename(file.path)}'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: const Color(0xFF0F766E),
          ),
        );
        await _loadBackups();
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to create backup: $e'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  Future<void> _restoreFromFile(File file) async {
    final confirmed = await AppDialog.showConfirmation(
      context: context,
      title: 'Restore System Snapshot',
      message: 'Are you sure you want to restore from "${p.basename(file.path)}"? This will replace current clinical records and candidate entries with the snapshot data. Ensure no active examinations are being written.',
      confirmLabel: 'Restore Snapshot',
      isDestructive: true,
    );

    if (confirmed == true && mounted) {
      setState(() => _isLoading = true);
      try {
        final isar = ref.read(isarDatabaseProvider).instance;
        await _backupService.restoreBackup(isar, file);
        if (mounted) {
          if (mounted) {
            await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('Restart Required'),
                content: const Text('Database restored. Please restart the application to load the restored data.'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          }
        }
      } catch (e) {
        if (mounted) {
          setState(() => _isLoading = false);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Restore operation failed: $e'),
              behavior: SnackBarBehavior.floating,
              backgroundColor: AppColors.error,
            ),
          );
        }
      }
    }
  }

  Future<void> _pickExternalFile() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['isar'],
      );
      if (result != null && result.files.single.path != null && mounted) {
        final file = File(result.files.single.path!);
        await _restoreFromFile(file);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error selecting external file: $e'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  Future<void> _deleteBackup(File file) async {
    final confirmed = await AppDialog.showConfirmation(
      context: context,
      title: 'Delete Backup Snapshot',
      message: 'Delete "${p.basename(file.path)}" permanently from local storage?',
      confirmLabel: 'Delete File',
      isDestructive: true,
    );

    if (confirmed == true && mounted) {
      try {
        if (await file.exists()) {
          await file.delete();
        }
        await _loadBackups();
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Could not delete file: $e'),
              behavior: SnackBarBehavior.floating,
              backgroundColor: AppColors.error,
            ),
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Padding(padding: EdgeInsets.all(32), child: AppLoading(height: 400))
          : SingleChildScrollView(
              padding: const EdgeInsets.all(28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionHeader(
                    title: 'Database Snapshot & Health Center',
                    subtitle: 'Manage local Isar storage, generate Isar Database Snapshots, and perform disaster recovery',
                    action: OutlinedButton.icon(
                      onPressed: _loadBackups,
                      icon: const Icon(Icons.refresh_rounded, size: 18),
                      label: const Text('Refresh Storage Status'),
                    ),
                  ),

                  // Health KPI Row
                  _buildHealthRow(context),
                  const SizedBox(height: 28),

                  // Action Row
                  const SectionHeader(
                    title: 'Snapshot Operations',
                    subtitle: 'Execute immediate backups or import external Isar Database Snapshots',
                  ),
                  _buildActionRow(context),
                  const SizedBox(height: 32),

                  // Backup Log Table
                  SectionHeader(
                    title: 'Local Snapshot Archives (${_backups.length})',
                    subtitle: 'Historical database snapshots stored on local disk',
                    action: TextButton.icon(
                      onPressed: _pickExternalFile,
                      icon: const Icon(Icons.folder_open_rounded, size: 18),
                      label: const Text('Import External Snapshot File'),
                    ),
                  ),
                  if (_errorMessage != null)
                    AppCard(
                      child: AppEmptyState(
                        icon: Icons.error_outline_rounded,
                        title: 'Error Reading Storage Directory',
                        message: _errorMessage!,
                        actionLabel: 'Retry',
                        onAction: _loadBackups,
                      ),
                    )
                  else if (_backups.isEmpty)
                    AppCard(
                      child: AppEmptyState(
                        icon: Icons.health_and_safety_outlined,
                        title: 'No Snapshot Archives Found',
                        message: 'You have not created any local snapshots yet. Click "Generate Snapshot Now" to backup your system database.',
                        actionLabel: 'Generate Snapshot Now',
                        onAction: _createBackup,
                      ),
                    )
                  else
                    _buildBackupTable(context),
                ],
              ),
            ),
    );
  }

  Widget _buildHealthRow(BuildContext context) {
    String lastSnapshotTime = 'No snapshots recorded';
    if (_backups.isNotEmpty) {
      try {
        final lastFile = _backups.first as File;
        final stat = lastFile.statSync();
        lastSnapshotTime = DateFormat('dd MMM yyyy, hh:mm a').format(stat.modified);
      } catch (_) {}
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth > 1000
            ? 3
            : constraints.maxWidth > 600
                ? 2
                : 1;

        return GridView.count(
          crossAxisCount: crossAxisCount,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: constraints.maxWidth > 1000 ? 2.3 : 2.0,
          children: [
            const KPICard(
              title: 'Isar Storage Engine',
              value: 'ACTIVE / HEALTHY',
              subtitle: 'Local embedded NoSQL database',
              icon: Icons.storage_rounded,
              color: Color(0xFF0F766E),
            ),
            KPICard(
              title: 'Available Snapshots',
              value: _backups.length.toString(),
              subtitle: 'Archived on local filesystem',
              icon: Icons.backup_table_rounded,
              color: const Color(0xFF4F46E5),
            ),
            KPICard(
              title: 'Last Recorded Backup',
              value: _backups.isNotEmpty ? '${_backups.length} Files' : 'None',
              subtitle: lastSnapshotTime,
              icon: Icons.schedule_rounded,
              color: const Color(0xFF0284C7),
            ),
          ],
        );
      },
    );
  }
  Widget _buildActionRow(BuildContext context) {
    final createCard = AppCard(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF0F766E).withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.cloud_upload_rounded, color: Color(0xFF0F766E), size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Create System Snapshot', style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                    Text('Export full clinical database to Isar archive', style: context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'Creates a complete snapshot of all candidate profiles, clinical examinations, master data catalogs, and system preferences.',
            style: context.textTheme.bodyMedium?.copyWith(height: 1.4),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: _createBackup,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0F766E),
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 46),
            ),
            icon: const Icon(Icons.backup_rounded, size: 18),
            label: const Text('Generate Snapshot Now'),
          ),
        ],
      ),
    );

    final restoreCard = AppCard(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFF4F46E5).withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.restore_page_rounded, color: Color(0xFF4F46E5), size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Restore Database Snapshot', style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                    Text('Import external or historical backup file', style: context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant)),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Icon(Icons.warning_amber_rounded, size: 16, color: Color(0xFFD97706)),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  'Overwrites current operational database. Ensure all active reports are saved prior to restoration.',
                  style: context.textTheme.bodySmall?.copyWith(color: const Color(0xFFD97706), fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          OutlinedButton.icon(
            onPressed: _pickExternalFile,
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xFF4F46E5),
              side: const BorderSide(color: Color(0xFF4F46E5), width: 1.5),
              minimumSize: const Size(double.infinity, 46),
            ),
            icon: const Icon(Icons.folder_open_rounded, size: 18),
            label: const Text('Select Snapshot File to Restore'),
          ),
        ],
      ),
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth > 850;
        if (isWide) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: createCard),
              const SizedBox(width: 20),
              Expanded(child: restoreCard),
            ],
          );
        } else {
          return Column(
            children: [
              createCard,
              const SizedBox(height: 20),
              restoreCard,
            ],
          );
        }
      },
    );
  }

  Widget _buildBackupTable(BuildContext context) {
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
                  columnSpacing: 36,
                  columns: [
                    DataColumn(label: Text('SNAPSHOT FILENAME', style: context.textTheme.labelLarge?.copyWith(fontSize: 11, letterSpacing: 0.8))),
                    DataColumn(label: Text('CREATED DATE & TIME', style: context.textTheme.labelLarge?.copyWith(fontSize: 11, letterSpacing: 0.8))),
                    DataColumn(label: Text('FILE SIZE', style: context.textTheme.labelLarge?.copyWith(fontSize: 11, letterSpacing: 0.8))),
                    DataColumn(label: Text('INTEGRITY STATUS', style: context.textTheme.labelLarge?.copyWith(fontSize: 11, letterSpacing: 0.8))),
                    DataColumn(label: Text('ACTIONS', style: context.textTheme.labelLarge?.copyWith(fontSize: 11, letterSpacing: 0.8))),
                  ],
                  rows: _backups.map((entity) {
                    final file = entity as File;
                    final filename = p.basename(file.path);
                    FileStat? stat;
                    try {
                      stat = file.statSync();
                    } catch (_) {}

                    final dateStr = stat != null ? DateFormat('dd MMM yyyy, hh:mm a').format(stat.modified) : 'Unknown';
                    final sizeKb = stat != null ? (stat.size / 1024).toStringAsFixed(1) : '0';

                    return DataRow(
                      cells: [
                        DataCell(
                          Row(
                            children: [
                              const Icon(Icons.description_rounded, size: 20, color: Color(0xFF0F766E)),
                              const SizedBox(width: 12),
                              Text(
                                filename,
                                style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700, fontFamily: 'monospace'),
                              ),
                            ],
                          ),
                        ),
                        DataCell(Text(dateStr, style: context.textTheme.bodyMedium)),
                        DataCell(Text('$sizeKb KB', style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600))),
                        DataCell(
                          const AppStatusBadge(
                            label: 'ISAR SNAPSHOT',
                            backgroundColor: Color(0xFFDCFCE7),
                            textColor: Color(0xFF15803D),
                            icon: Icons.verified_rounded,
                          ),
                        ),
                        DataCell(
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ElevatedButton.icon(
                                onPressed: () => _restoreFromFile(file),
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(0, 36),
                                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                                ),
                                icon: const Icon(Icons.restore_rounded, size: 16),
                                label: const Text('Restore', style: TextStyle(fontSize: 12)),
                              ),
                              const SizedBox(width: 8),
                              IconButton(
                                icon: Icon(Icons.delete_outline_rounded, size: 18, color: context.colorScheme.error),
                                tooltip: 'Delete Snapshot File',
                                onPressed: () => _deleteBackup(file),
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

