import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../core/config.dart';
import '../core/models.dart';
import '../core/providers.dart';
import '../core/theme.dart';
import '../core/utils.dart';
import '../widgets/common_widgets.dart';

/// Patient Directory & Candidate Management Page.
class PatientsPage extends ConsumerStatefulWidget {
  const PatientsPage({super.key});

  @override
  ConsumerState<PatientsPage> createState() => _PatientsPageState();
}

class _PatientsPageState extends ConsumerState<PatientsPage> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedGenderFilter = 'All';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _showPatientDialog(BuildContext context, {Patient? patient}) {
    showDialog(
      context: context,
      builder: (context) => _PatientFormDialog(patient: patient),
    );
  }

  Future<void> _deletePatient(Patient patient) {
    return AppDialog.showConfirmation(
      context: context,
      title: 'Delete Candidate Record',
      message: 'Are you sure you want to permanently delete "${patient.fullName}" (Passport: ${patient.passportNumber})? This action will remove candidate directory entry. Existing reports tied to this candidate will remain archived.',
      confirmLabel: 'Delete Candidate',
      isDestructive: true,
    ).then((confirmed) async {
      if (confirmed == true && mounted && patient.id != null) {
        await ref.read(patientRepositoryProvider).delete(patient.id!);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Removed "${patient.fullName}" from candidate directory.'),
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final patientsAsync = ref.watch(patientListProvider);
    final topSearchQuery = ref.watch(searchQueryProvider);

    return Scaffold(
      body: patientsAsync.when(
        loading: () => const Padding(padding: EdgeInsets.all(32), child: AppLoading(height: 400)),
        error: (err, stack) => Padding(
          padding: const EdgeInsets.all(32),
          child: AppEmptyState(
            icon: Icons.error_outline_rounded,
            title: 'Error Loading Patient Directory',
            message: err.toString(),
            actionLabel: 'Refresh Directory',
            onAction: () => ref.refresh(patientListProvider),
          ),
        ),
        data: (patients) {
          // Filter patients by search text & gender filter
          final query = (_searchController.text.isNotEmpty ? _searchController.text : topSearchQuery).toLowerCase().trim();
          final filtered = patients.where((p) {
            final matchesSearch = query.isEmpty ||
                p.fullName.toLowerCase().contains(query) ||
                p.passportNumber.toLowerCase().contains(query) ||
                p.nationality.toLowerCase().contains(query) ||
                (p.phone ?? '').toLowerCase().contains(query);
            final matchesGender = _selectedGenderFilter == 'All' || p.gender.trim().toUpperCase() == _selectedGenderFilter.toUpperCase();
            return matchesSearch && matchesGender;
          }).toList();

          return SingleChildScrollView(
            padding: const EdgeInsets.all(28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionHeader(
                  title: 'Candidate Directory & Records',
                  subtitle: 'Manage registered GAMCA examination candidates and passport profiles (${patients.length} total)',
                  action: ElevatedButton.icon(
                    onPressed: () => _showPatientDialog(context),
                    icon: const Icon(Icons.person_add_rounded, size: 18),
                    label: const Text('Register New Candidate'),
                  ),
                ),

                // Search and Filter Toolbar Card
                AppCard(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: TextField(
                          controller: _searchController,
                          decoration: InputDecoration(
                            hintText: 'Search by full name, passport number, nationality, phone...',
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
                        child: DropdownButtonFormField<String>(
                          value: _selectedGenderFilter,
                          decoration: const InputDecoration(
                            labelText: 'Gender Filter',
                            contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                          ),
                          items: const [
                            DropdownMenuItem(value: 'All', child: Text('All Genders')),
                            DropdownMenuItem(value: 'MALE', child: Text('Male')),
                            DropdownMenuItem(value: 'FEMALE', child: Text('Female')),
                            DropdownMenuItem(value: 'OTHER', child: Text('Other')),
                          ],
                          onChanged: (val) {
                            if (val != null) setState(() => _selectedGenderFilter = val);
                          },
                        ),
                      ),
                      const SizedBox(width: 16),
                      OutlinedButton.icon(
                        onPressed: () {
                          setState(() {
                            _searchController.clear();
                            _selectedGenderFilter = 'All';
                          });
                          ref.read(searchQueryProvider.notifier).state = '';
                        },
                        icon: const Icon(Icons.refresh_rounded, size: 18),
                        label: const Text('Reset'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Patient Directory Table Card
                if (filtered.isEmpty)
                  AppCard(
                    child: AppEmptyState(
                      icon: Icons.people_outline_rounded,
                      title: query.isNotEmpty || _selectedGenderFilter != 'All' ? 'No Matching Candidates Found' : 'Directory is Empty',
                      message: query.isNotEmpty || _selectedGenderFilter != 'All'
                          ? 'No candidates match your search filters "$query" (${_selectedGenderFilter}). Try resetting filters or verifying the passport number.'
                          : 'You have not registered any examination candidates yet. Click "Register New Candidate" above to get started.',
                      actionLabel: query.isNotEmpty || _selectedGenderFilter != 'All' ? 'Reset Filters' : 'Register New Candidate',
                      onAction: query.isNotEmpty || _selectedGenderFilter != 'All'
                          ? () {
                              setState(() {
                                _searchController.clear();
                                _selectedGenderFilter = 'All';
                              });
                            }
                          : () => _showPatientDialog(context),
                    ),
                  )
                else
                  _buildPatientTable(context, filtered),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPatientTable(BuildContext context, List<Patient> patients) {
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
                  dataRowMinHeight: 68,
                  dataRowMaxHeight: 68,
                  horizontalMargin: 24,
                  columnSpacing: 32,
                  columns: [
                    DataColumn(label: Text('CANDIDATE NAME & GENDER', style: context.textTheme.labelLarge?.copyWith(fontSize: 11, letterSpacing: 0.8))),
                    DataColumn(label: Text('PASSPORT NUMBER', style: context.textTheme.labelLarge?.copyWith(fontSize: 11, letterSpacing: 0.8))),
                    DataColumn(label: Text('NATIONALITY', style: context.textTheme.labelLarge?.copyWith(fontSize: 11, letterSpacing: 0.8))),
                    DataColumn(label: Text('AGE / DOB', style: context.textTheme.labelLarge?.copyWith(fontSize: 11, letterSpacing: 0.8))),
                    DataColumn(label: Text('CONTACT PHONE', style: context.textTheme.labelLarge?.copyWith(fontSize: 11, letterSpacing: 0.8))),
                    DataColumn(label: Text('ACTIONS', style: context.textTheme.labelLarge?.copyWith(fontSize: 11, letterSpacing: 0.8))),
                  ],
                  rows: patients.map((patient) {
                    final initial = patient.fullName.isNotEmpty ? patient.fullName.substring(0, 1).toUpperCase() : '?';
                    final isMale = patient.gender.toUpperCase().startsWith('M');

                    return DataRow(
                      cells: [
                        DataCell(
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 18,
                                backgroundColor: isMale
                                    ? const Color(0xFF0284C7).withValues(alpha: 0.15)
                                    : const Color(0xFF9333EA).withValues(alpha: 0.15),
                                child: Text(
                                  initial,
                                  style: TextStyle(
                                    color: isMale ? const Color(0xFF0284C7) : const Color(0xFF9333EA),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 14),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    patient.fullName,
                                    style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w700),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        isMale ? Icons.male_rounded : Icons.female_rounded,
                                        size: 14,
                                        color: context.colorScheme.onSurfaceVariant,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        patient.gender.toUpperCase(),
                                        style: context.textTheme.bodySmall?.copyWith(fontSize: 11),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        DataCell(
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                            decoration: BoxDecoration(
                              color: context.colorScheme.surface,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: context.colorScheme.outline.withValues(alpha: 0.6)),
                            ),
                            child: Text(
                              patient.passportNumber,
                              style: context.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w700,
                                fontFamily: 'monospace',
                                color: context.colorScheme.primary,
                              ),
                            ),
                          ),
                        ),
                        DataCell(
                          Text(
                            patient.nationality.isEmpty ? 'Not Specified' : patient.nationality,
                            style: context.textTheme.bodyMedium,
                          ),
                        ),
                        DataCell(
                          Text(
                            '${patient.age} Yrs',
                            style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                          ),
                        ),
                        DataCell(
                          Text(
                            patient.phone != null && patient.phone!.isNotEmpty ? patient.phone! : 'N/A',
                            style: context.textTheme.bodyMedium?.copyWith(
                              color: patient.phone != null ? context.colorScheme.onSurface : context.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ),
                        DataCell(
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {
                                  // Start examination for this patient
                                  context.go('${AppRoutes.reportGenerate}?patientId=${patient.id}');
                                },
                                style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(0, 36),
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                ),
                                icon: const Icon(Icons.post_add_rounded, size: 16),
                                label: const Text('New Exam', style: TextStyle(fontSize: 12)),
                              ),
                              const SizedBox(width: 8),
                              IconButton(
                                icon: const Icon(Icons.edit_outlined, size: 18),
                                tooltip: 'Edit Candidate Details',
                                onPressed: () => _showPatientDialog(context, patient: patient),
                              ),
                              IconButton(
                                icon: Icon(Icons.delete_outline_rounded, size: 18, color: context.colorScheme.error),
                                tooltip: 'Delete Candidate',
                                onPressed: () => _deletePatient(patient),
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

class _PatientFormDialog extends ConsumerStatefulWidget {
  final Patient? patient;

  const _PatientFormDialog({this.patient});

  @override
  ConsumerState<_PatientFormDialog> createState() => _PatientFormDialogState();
}

class _PatientFormDialogState extends ConsumerState<_PatientFormDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _passportController;
  late final TextEditingController _ageController;
  late final TextEditingController _nationalityController;
  late final TextEditingController _phoneController;
  late String _gender;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.patient?.fullName ?? '');
    _passportController = TextEditingController(text: widget.patient?.passportNumber ?? '');
    _ageController = TextEditingController(text: widget.patient?.age.toString() ?? '');
    _nationalityController = TextEditingController(text: widget.patient?.nationality ?? 'INDIAN');
    _phoneController = TextEditingController(text: widget.patient?.phone ?? '');
    _gender = widget.patient?.gender ?? 'MALE';
  }

  @override
  void dispose() {
    _nameController.dispose();
    _passportController.dispose();
    _ageController.dispose();
    _nationalityController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    final ageVal = int.tryParse(_ageController.text.trim()) ?? 25;
    final patient = Patient(
      id: widget.patient?.id,
      name: _nameController.text.trim(),
      passportNumber: _passportController.text.trim().toUpperCase(),
      age: ageVal,
      gender: _gender,
      nationality: _nationalityController.text.trim().toUpperCase(),
      bloodGroup: widget.patient?.bloodGroup ?? 'O+',
      height: widget.patient?.height ?? 170.0,
      weight: widget.patient?.weight ?? 70.0,
      phone: _phoneController.text.trim(),
      createdAt: widget.patient?.createdAt ?? DateTime.now(),
      updatedAt: DateTime.now(),
    );

    await ref.read(patientRepositoryProvider).save(patient);
    if (mounted) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(widget.patient == null
              ? 'Candidate "${patient.fullName}" registered successfully.'
              : 'Updated details for "${patient.fullName}".'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.patient != null;

    return AlertDialog(
      titlePadding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
      actionsPadding: const EdgeInsets.all(24),
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: context.colorScheme.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(isEdit ? Icons.manage_accounts_rounded : Icons.person_add_alt_1_rounded, color: context.colorScheme.primary),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isEdit ? 'Edit Candidate Profile' : 'Register New Candidate',
                  style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  isEdit ? 'Update passport and demographic details' : 'Enter official identification for GAMCA certification',
                  style: context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant),
                ),
              ],
            ),
          ),
        ],
      ),
      content: SizedBox(
        width: 600,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Personal & Passport Information', style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700)),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: 'Full Name (As per Passport) *',
                          prefixIcon: Icon(Icons.person_outline_rounded, size: 20),
                        ),
                        validator: (v) => v == null || v.trim().isEmpty ? 'Required' : null,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        controller: _passportController,
                        decoration: const InputDecoration(
                          labelText: 'Passport Number *',
                          prefixIcon: Icon(Icons.credit_card_rounded, size: 20),
                        ),
                        textCapitalization: TextCapitalization.characters,
                        validator: (v) => v == null || v.trim().isEmpty ? 'Required' : null,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text('Demographic & Contact Details', style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700)),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: _gender,
                        decoration: const InputDecoration(
                          labelText: 'Gender *',
                          prefixIcon: Icon(Icons.wc_rounded, size: 20),
                        ),
                        items: const [
                          DropdownMenuItem(value: 'MALE', child: Text('Male')),
                          DropdownMenuItem(value: 'FEMALE', child: Text('Female')),
                          DropdownMenuItem(value: 'OTHER', child: Text('Other')),
                        ],
                        onChanged: (val) {
                          if (val != null) setState(() => _gender = val);
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        controller: _ageController,
                        decoration: const InputDecoration(
                          labelText: 'Age (Years) *',
                          prefixIcon: Icon(Icons.calendar_today_rounded, size: 20),
                        ),
                        keyboardType: TextInputType.number,
                        validator: (v) {
                          if (v == null || v.trim().isEmpty) return 'Required';
                          if (int.tryParse(v.trim()) == null) return 'Must be valid number';
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: TextFormField(
                        controller: _nationalityController,
                        decoration: const InputDecoration(
                          labelText: 'Nationality *',
                          prefixIcon: Icon(Icons.flag_outlined, size: 20),
                        ),
                        textCapitalization: TextCapitalization.characters,
                        validator: (v) => v == null || v.trim().isEmpty ? 'Required' : null,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _phoneController,
                  decoration: const InputDecoration(
                    labelText: 'Contact Phone / WhatsApp (Optional)',
                    prefixIcon: Icon(Icons.phone_outlined, size: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        OutlinedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        ElevatedButton.icon(
          onPressed: _save,
          icon: const Icon(Icons.check_circle_outline_rounded, size: 18),
          label: Text(isEdit ? 'Update Profile' : 'Register Candidate'),
        ),
      ],
    );
  }
}
