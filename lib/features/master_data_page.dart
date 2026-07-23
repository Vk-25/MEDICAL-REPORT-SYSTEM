import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../core/models.dart';
import '../core/providers.dart';
import '../core/theme.dart';
import '../core/utils.dart';
import '../widgets/common_widgets.dart';

/// Master Data & Catalog Administration Page.
class MasterDataPage extends ConsumerStatefulWidget {
  const MasterDataPage({super.key});

  @override
  ConsumerState<MasterDataPage> createState() => _MasterDataPageState();
}

class _MasterDataPageState extends ConsumerState<MasterDataPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  // --- String Item Management (Medical History & Physical Params) ---
  void _showAddStringItemDialog(BuildContext context, MasterDataSetup current, bool isMedicalHistory, {String? oldItem}) {
    final controller = TextEditingController(text: oldItem ?? '');
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          titlePadding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
          contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
          actionsPadding: const EdgeInsets.all(24),
          title: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(color: context.colorScheme.primary.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(12)),
                child: Icon(isMedicalHistory ? Icons.history_edu_rounded : Icons.biotech_rounded, color: context.colorScheme.primary),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(oldItem == null ? (isMedicalHistory ? 'Add Medical History Question' : 'Add Physical Exam Parameter') : 'Edit Catalog Parameter', style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                    Text(isMedicalHistory ? 'Appears in candidate questionnaire' : 'Appears under system evaluation list', style: context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant)),
                  ],
                ),
              ),
            ],
          ),
          content: SizedBox(
            width: 480,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: isMedicalHistory ? 'History Question / Condition *' : 'Parameter Name *',
                hintText: isMedicalHistory ? 'e.g., Bronchial Asthma' : 'e.g., Color Vision / Ishihara',
                prefixIcon: const Icon(Icons.label_outline_rounded, size: 20),
              ),
              autofocus: true,
              textCapitalization: TextCapitalization.words,
            ),
          ),
          actions: [
            OutlinedButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancel')),
            ElevatedButton.icon(
              onPressed: () async {
                final text = controller.text.trim();
                if (text.isEmpty) return;

                List<String> updatedList;
                if (isMedicalHistory) {
                  updatedList = List.from(current.medicalHistoryOptions);
                  if (oldItem != null) {
                    final idx = updatedList.indexOf(oldItem);
                    if (idx != -1) updatedList[idx] = text;
                  } else if (!updatedList.contains(text)) {
                    updatedList.add(text);
                  }
                  await ref.read(masterDataRepositoryProvider).save(current.copyWith(medicalHistoryOptions: updatedList));
                } else {
                  updatedList = List.from(current.physicalExamParameters);
                  if (oldItem != null) {
                    final idx = updatedList.indexOf(oldItem);
                    if (idx != -1) updatedList[idx] = text;
                  } else if (!updatedList.contains(text)) {
                    updatedList.add(text);
                  }
                  await ref.read(masterDataRepositoryProvider).save(current.copyWith(physicalExamParameters: updatedList));
                }
                if (mounted) Navigator.of(context).pop();
              },
              icon: const Icon(Icons.check_rounded, size: 18),
              label: Text(oldItem == null ? 'Add Parameter' : 'Save Changes'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _deleteStringItem(MasterDataSetup current, bool isMedicalHistory, String item) async {
    final confirmed = await AppDialog.showConfirmation(
      context: context,
      title: 'Remove Catalog Parameter',
      message: 'Are you sure you want to remove "$item" from the master setup list? Existing reports featuring this item will preserve their saved answers.',
      confirmLabel: 'Remove Item',
      isDestructive: true,
    );

    if (confirmed == true && mounted) {
      if (isMedicalHistory) {
        final list = List<String>.from(current.medicalHistoryOptions)..remove(item);
        await ref.read(masterDataRepositoryProvider).save(current.copyWith(medicalHistoryOptions: list));
      } else {
        final list = List<String>.from(current.physicalExamParameters)..remove(item);
        await ref.read(masterDataRepositoryProvider).save(current.copyWith(physicalExamParameters: list));
      }
    }
  }

  // --- Laboratory Test Definition Management ---
  void _showLabTestDialog(BuildContext context, MasterDataSetup current, {LabTestDefinition? oldTest}) {
    showDialog(
      context: context,
      builder: (context) => _LabTestFormDialog(current: current, oldTest: oldTest),
    );
  }

  Future<void> _deleteLabTest(MasterDataSetup current, LabTestDefinition test) async {
    final confirmed = await AppDialog.showConfirmation(
      context: context,
      title: 'Delete Laboratory Test Definition',
      message: 'Are you sure you want to remove "${test.name}" (${test.category}) from the master laboratory test catalog?',
      confirmLabel: 'Delete Test',
      isDestructive: true,
    );

    if (confirmed == true && mounted) {
      final list = List<LabTestDefinition>.from(current.labTests)..removeWhere((t) => t.id == test.id);
      await ref.read(masterDataRepositoryProvider).save(current.copyWith(labTests: list));
    }
  }

  Future<void> _resetToDefaults() async {
    final confirmed = await AppDialog.showConfirmation(
      context: context,
      title: 'Reset Master Data Catalogs to Defaults',
      message: 'Restore standard GAMCA medical history conditions, physical exam checks, and laboratory test definitions? Your custom added items will be replaced by the official defaults.',
      confirmLabel: 'Reset to GAMCA Defaults',
      isDestructive: true,
    );

    if (confirmed == true && mounted) {
      final defaults = MasterDataSetup.defaults();
      final currentList = await ref.read(masterDataRepositoryProvider).getAll();
      if (currentList.isNotEmpty) {
        await ref.read(masterDataRepositoryProvider).save(defaults.copyWith(id: currentList.first.id));
      } else {
        await ref.read(masterDataRepositoryProvider).save(defaults);
      }
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Restored official GAMCA medical master data catalogs.'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Color(0xFF0F766E),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final masterDataAsync = ref.watch(masterDataListProvider);

    return Scaffold(
      body: masterDataAsync.when(
        loading: () => const Padding(padding: EdgeInsets.all(32), child: AppLoading(height: 400)),
        error: (err, stack) => Padding(
          padding: const EdgeInsets.all(32),
          child: AppEmptyState(
            icon: Icons.error_outline_rounded,
            title: 'Error Loading Master Setup',
            message: err.toString(),
            actionLabel: 'Reload Catalog',
            onAction: () => ref.refresh(masterDataListProvider),
          ),
        ),
        data: (list) {
          final current = list.isNotEmpty ? list.first : MasterDataSetup.defaults();
          final query = _searchController.text.trim().toLowerCase();

          return SingleChildScrollView(
            padding: const EdgeInsets.all(28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionHeader(
                  title: 'Master Data Setup & Clinical Catalog',
                  subtitle: 'Configure standard questionnaire options, physical checks, and reference lab tests used across all examinations',
                  action: OutlinedButton.icon(
                    onPressed: _resetToDefaults,
                    icon: const Icon(Icons.restore_rounded, size: 18),
                    label: const Text('Reset to GAMCA Defaults'),
                  ),
                ),

                // Custom Styled Tab & Search Header
                AppCard(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 48,
                              decoration: BoxDecoration(
                                color: context.isDark ? const Color(0xFF0F172A) : const Color(0xFFF1F5F9),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: TabBar(
                                controller: _tabController,
                                indicator: BoxDecoration(
                                  color: context.colorScheme.primary,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: context.colorScheme.primary.withValues(alpha: 0.3),
                                      blurRadius: 8,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                labelColor: Colors.white,
                                unselectedLabelColor: context.colorScheme.onSurfaceVariant,
                                labelStyle: context.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700),
                                unselectedLabelStyle: context.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
                                dividerColor: Colors.transparent,
                                tabs: [
                                  Tab(text: 'Medical History (${current.medicalHistoryOptions.length})'),
                                  Tab(text: 'Physical Exam (${current.physicalExamParameters.length})'),
                                  Tab(text: 'Laboratory Tests (${current.labTests.length})'),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: _searchController,
                              decoration: InputDecoration(
                                hintText: 'Filter catalog entries in active tab...',
                                prefixIcon: const Icon(Icons.search_rounded, size: 20),
                                suffixIcon: _searchController.text.isNotEmpty
                                    ? IconButton(
                                        icon: const Icon(Icons.clear_rounded, size: 18),
                                        onPressed: () => setState(() => _searchController.clear()),
                                      )
                                    : null,
                                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              ),
                              onChanged: (_) => setState(() {}),
                            ),
                          ),
                          const SizedBox(width: 16),
                          ElevatedButton.icon(
                            onPressed: () {
                              if (_tabController.index == 0) {
                                _showAddStringItemDialog(context, current, true);
                              } else if (_tabController.index == 1) {
                                _showAddStringItemDialog(context, current, false);
                              } else {
                                _showLabTestDialog(context, current);
                              }
                            },
                            icon: const Icon(Icons.add_circle_outline_rounded, size: 18),
                            label: Text(_tabController.index == 2 ? 'Add Laboratory Test' : 'Add Catalog Parameter'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Active Tab Table View
                if (_tabController.index == 0)
                  _buildStringTable(context, current, true, current.medicalHistoryOptions.where((s) => query.isEmpty || s.toLowerCase().contains(query)).toList())
                else if (_tabController.index == 1)
                  _buildStringTable(context, current, false, current.physicalExamParameters.where((s) => query.isEmpty || s.toLowerCase().contains(query)).toList())
                else
                  _buildLabTable(context, current, current.labTests.where((t) => query.isEmpty || t.name.toLowerCase().contains(query) || t.category.toLowerCase().contains(query)).toList()),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildStringTable(BuildContext context, MasterDataSetup current, bool isMedicalHistory, List<String> items) {
    final ext = Theme.of(context).extension<AppThemeExtension>() ?? AppThemeExtension.light;

    if (items.isEmpty) {
      return AppCard(
        child: AppEmptyState(
          icon: isMedicalHistory ? Icons.history_edu_rounded : Icons.biotech_rounded,
          title: 'No Matching Catalog Parameters',
          message: 'No parameters match your search query. Try clearing search filters or adding a new parameter.',
          actionLabel: isMedicalHistory ? 'Add History Question' : 'Add Physical Parameter',
          onAction: () => _showAddStringItemDialog(context, current, isMedicalHistory),
        ),
      );
    }

    return AppCard(
      padding: EdgeInsets.zero,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            headingRowColor: WidgetStateProperty.all(ext.tableHeaderBg),
            dataRowMinHeight: 60,
            dataRowMaxHeight: 60,
            horizontalMargin: 24,
            columnSpacing: 48,
            columns: [
              DataColumn(label: Text('#', style: context.textTheme.labelLarge?.copyWith(fontSize: 11, letterSpacing: 0.8))),
              DataColumn(label: Text(isMedicalHistory ? 'CLINICAL HISTORY CONDITION / QUESTION' : 'PHYSICAL EVALUATION PARAMETER', style: context.textTheme.labelLarge?.copyWith(fontSize: 11, letterSpacing: 0.8))),
              DataColumn(label: Text('DEFAULT QUESTIONNAIRE TYPE', style: context.textTheme.labelLarge?.copyWith(fontSize: 11, letterSpacing: 0.8))),
              DataColumn(label: Text('ACTIONS', style: context.textTheme.labelLarge?.copyWith(fontSize: 11, letterSpacing: 0.8))),
            ],
            rows: items.asMap().entries.map((entry) {
              final idx = entry.key + 1;
              final item = entry.value;

              return DataRow(
                cells: [
                  DataCell(Text(idx.toString(), style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700, color: context.colorScheme.onSurfaceVariant))),
                  DataCell(
                    Row(
                      children: [
                        Icon(isMedicalHistory ? Icons.check_box_outline_blank_rounded : Icons.fact_check_outlined, size: 18, color: context.colorScheme.primary),
                        const SizedBox(width: 12),
                        Text(item, style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),
                  DataCell(
                    AppStatusBadge(
                      label: isMedicalHistory ? 'YES / NO TOGGLE' : 'NORMAL / ABNORMAL / TEXT',
                      backgroundColor: context.isDark ? const Color(0xFF1E293B) : const Color(0xFFF1F5F9),
                      textColor: context.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  DataCell(
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit_outlined, size: 18),
                          tooltip: 'Edit Parameter Title',
                          onPressed: () => _showAddStringItemDialog(context, current, isMedicalHistory, oldItem: item),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete_outline_rounded, size: 18, color: context.colorScheme.error),
                          tooltip: 'Remove Parameter',
                          onPressed: () => _deleteStringItem(current, isMedicalHistory, item),
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

  Widget _buildLabTable(BuildContext context, MasterDataSetup current, List<LabTestDefinition> tests) {
    final ext = Theme.of(context).extension<AppThemeExtension>() ?? AppThemeExtension.light;

    if (tests.isEmpty) {
      return AppCard(
        child: AppEmptyState(
          icon: Icons.science_outlined,
          title: 'No Matching Laboratory Tests',
          message: 'No tests match your current category/search query. Click "Add Laboratory Test" to define a new investigation.',
          actionLabel: 'Add Laboratory Test',
          onAction: () => _showLabTestDialog(context, current),
        ),
      );
    }

    return AppCard(
      padding: EdgeInsets.zero,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            headingRowColor: WidgetStateProperty.all(ext.tableHeaderBg),
            dataRowMinHeight: 64,
            dataRowMaxHeight: 64,
            horizontalMargin: 24,
            columnSpacing: 32,
            columns: [
              DataColumn(label: Text('LAB CATEGORY', style: context.textTheme.labelLarge?.copyWith(fontSize: 11, letterSpacing: 0.8))),
              DataColumn(label: Text('TEST / ANALYTE NAME', style: context.textTheme.labelLarge?.copyWith(fontSize: 11, letterSpacing: 0.8))),
              DataColumn(label: Text('REFERENCE RANGE / CUTOFF', style: context.textTheme.labelLarge?.copyWith(fontSize: 11, letterSpacing: 0.8))),
              DataColumn(label: Text('DEFAULT UNITS', style: context.textTheme.labelLarge?.copyWith(fontSize: 11, letterSpacing: 0.8))),
              DataColumn(label: Text('STATUS', style: context.textTheme.labelLarge?.copyWith(fontSize: 11, letterSpacing: 0.8))),
              DataColumn(label: Text('ACTIONS', style: context.textTheme.labelLarge?.copyWith(fontSize: 11, letterSpacing: 0.8))),
            ],
            rows: tests.map((test) {
              Color badgeBg = ext.badgeTealBg;
              Color badgeText = ext.badgeTealText;
              if (test.category.toUpperCase().contains('BLOOD') || test.category.toUpperCase().contains('HEMATO')) {
                badgeBg = ext.statusUnfitBg;
                badgeText = ext.statusUnfitText;
              } else if (test.category.toUpperCase().contains('URINE')) {
                badgeBg = ext.badgeAmberBg;
                badgeText = ext.badgeAmberText;
              } else if (test.category.toUpperCase().contains('SERO') || test.category.toUpperCase().contains('VIRO')) {
                badgeBg = ext.badgePurpleBg;
                badgeText = ext.badgePurpleText;
              }

              return DataRow(
                cells: [
                  DataCell(AppStatusBadge(label: test.category.toUpperCase(), backgroundColor: badgeBg, textColor: badgeText)),
                  DataCell(
                    Text(test.name, style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700)),
                  ),
                  DataCell(
                    Text(test.referenceRange.isNotEmpty ? test.referenceRange : 'Qualitative / Negative', style: context.textTheme.bodyMedium?.copyWith(fontFamily: 'monospace')),
                  ),
                  DataCell(
                    Text(test.defaultUnit.isNotEmpty ? test.defaultUnit : '-', style: context.textTheme.bodyMedium),
                  ),
                  DataCell(
                    AppStatusBadge(
                      label: test.isMandatory ? 'MANDATORY GAMCA' : 'OPTIONAL TEST',
                      backgroundColor: test.isMandatory ? ext.statusFitBg : ext.statusDraftBg,
                      textColor: test.isMandatory ? ext.statusFitText : ext.statusDraftText,
                    ),
                  ),
                  DataCell(
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit_outlined, size: 18),
                          tooltip: 'Edit Laboratory Test',
                          onPressed: () => _showLabTestDialog(context, current, oldTest: test),
                        ),
                        IconButton(
                          icon: Icon(Icons.delete_outline_rounded, size: 18, color: context.colorScheme.error),
                          tooltip: 'Delete Test Definition',
                          onPressed: () => _deleteLabTest(current, test),
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

class _LabTestFormDialog extends ConsumerStatefulWidget {
  final MasterDataSetup current;
  final LabTestDefinition? oldTest;

  const _LabTestFormDialog({required this.current, this.oldTest});

  @override
  ConsumerState<_LabTestFormDialog> createState() => _LabTestFormDialogState();
}

class _LabTestFormDialogState extends ConsumerState<_LabTestFormDialog> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _categoryController;
  late TextEditingController _rangeController;
  late TextEditingController _unitController;
  late bool _isMandatory;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.oldTest?.name ?? '');
    _categoryController = TextEditingController(text: widget.oldTest?.category ?? 'BLOOD TESTS');
    _rangeController = TextEditingController(text: widget.oldTest?.referenceRange ?? '');
    _unitController = TextEditingController(text: widget.oldTest?.defaultUnit ?? '');
    _isMandatory = widget.oldTest?.isMandatory ?? true;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _categoryController.dispose();
    _rangeController.dispose();
    _unitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.oldTest != null;

    return AlertDialog(
      titlePadding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
      actionsPadding: const EdgeInsets.all(24),
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: context.colorScheme.primary.withValues(alpha: 0.1), borderRadius: BorderRadius.circular(12)),
            child: Icon(isEdit ? Icons.science_rounded : Icons.biotech_rounded, color: context.colorScheme.primary),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(isEdit ? 'Edit Laboratory Test' : 'Add Laboratory Test Definition', style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                Text('Define clinical reference ranges and mandatory requirements for examinations', style: context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant)),
              ],
            ),
          ),
        ],
      ),
      content: SizedBox(
        width: 560,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: 'Test / Analyte Name *',
                          prefixIcon: Icon(Icons.science_outlined, size: 20),
                          hintText: 'e.g., Hemoglobin / HBsAg',
                        ),
                        validator: (v) => v == null || v.trim().isEmpty ? 'Required' : null,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        controller: _categoryController,
                        decoration: const InputDecoration(
                          labelText: 'Category *',
                          prefixIcon: Icon(Icons.folder_special_outlined, size: 20),
                          hintText: 'e.g., SEROLOGY',
                        ),
                        textCapitalization: TextCapitalization.characters,
                        validator: (v) => v == null || v.trim().isEmpty ? 'Required' : null,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        controller: _rangeController,
                        decoration: const InputDecoration(
                          labelText: 'Normal Reference Range / Value',
                          prefixIcon: Icon(Icons.compare_arrows_rounded, size: 20),
                          hintText: 'e.g., 13.0 - 17.0 or Negative',
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        controller: _unitController,
                        decoration: const InputDecoration(
                          labelText: 'Default Units',
                          prefixIcon: Icon(Icons.straighten_rounded, size: 20),
                          hintText: 'e.g., g/dL',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                CheckboxListTile(
                  title: Text('Mandatory GAMCA Test Requirement', style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700)),
                  subtitle: Text('If checked, this test is required before a candidate can be certified FIT.', style: context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant)),
                  value: _isMandatory,
                  onChanged: (val) {
                    if (val != null) setState(() => _isMandatory = val);
                  },
                  contentPadding: EdgeInsets.zero,
                  controlAffinity: ListTileControlAffinity.leading,
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        OutlinedButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancel')),
        ElevatedButton.icon(
          onPressed: () async {
            if (!_formKey.currentState!.validate()) return;
            final parts = _rangeController.text.trim().split('-');
            final minVal = parts.isNotEmpty ? double.tryParse(parts.first.trim()) ?? 0.0 : 0.0;
            final maxVal = parts.length > 1 ? double.tryParse(parts[1].trim()) ?? minVal : minVal;
            final newTest = LabTestDefinition(
              id: widget.oldTest?.id,
              name: _nameController.text.trim(),
              category: _categoryController.text.trim().toUpperCase(),
              unit: _unitController.text.trim(),
              referenceMin: minVal,
              referenceMax: maxVal,
            );

            final list = List<LabTestDefinition>.from(widget.current.labTests);
            if (widget.oldTest != null) {
              final idx = list.indexWhere((t) => t.id == widget.oldTest!.id);
              if (idx != -1) list[idx] = newTest;
            } else {
              list.add(newTest);
            }

            await ref.read(masterDataRepositoryProvider).save(widget.current.copyWith(labTests: list));
            if (mounted) Navigator.of(context).pop();
          },
          icon: const Icon(Icons.check_circle_outline_rounded, size: 18),
          label: Text(isEdit ? 'Save Changes' : 'Add Test Definition'),
        ),
      ],
    );
  }
}
