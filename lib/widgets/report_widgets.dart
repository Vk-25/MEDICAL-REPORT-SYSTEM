import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../core/models.dart';
import '../core/utils.dart';
import 'common_widgets.dart';

// ============================================================================
// Shared section chrome — every section uses the same numbered-badge header
// and the same subsection-divider treatment so the four steps of the exam
// read as one continuous instrument, not four differently-styled forms.
// ============================================================================

class _SectionHeader extends StatelessWidget {
  final String number;
  final String title;
  final String subtitle;
  final Color accent;
  final IconData icon;
  final Widget? action;

  const _SectionHeader({
    required this.number,
    required this.title,
    required this.subtitle,
    required this.accent,
    required this.icon,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: accent.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(13),
            border: Border.all(color: accent.withValues(alpha: 0.35)),
          ),
          alignment: Alignment.center,
          child: Icon(icon, color: accent, size: 21),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'SECTION $number',
                style: context.textTheme.labelSmall?.copyWith(
                  color: accent,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.4,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                title,
                style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              Text(
                subtitle,
                style: context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        if (action != null) ...[const SizedBox(width: 12), action!],
      ],
    );
  }
}

class _SubHeading extends StatelessWidget {
  final IconData icon;
  final String text;
  const _SubHeading(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Icon(icon, size: 16, color: context.colorScheme.primary),
          const SizedBox(width: 8),
          Text(
            text.toUpperCase(),
            style: context.textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.w800,
              letterSpacing: 0.6,
              color: context.colorScheme.primary,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(child: Divider(color: context.colorScheme.outlineVariant)),
        ],
      ),
    );
  }
}

/// Responsive multi-column layout for the quick-select grids. Uses Wrap
/// (rather than a fixed-aspect-ratio GridView) so chip rows can vary in
/// height without clipping or overflow.
Widget _responsiveGrid(BuildContext context, List<Widget> items, {double minColumnWidth = 260}) {
  return LayoutBuilder(
    builder: (context, constraints) {
      final columns = (constraints.maxWidth / minColumnWidth).floor().clamp(1, 3);
      const spacing = 20.0;
      final itemWidth = (constraints.maxWidth - spacing * (columns - 1)) / columns;
      return Wrap(
        spacing: spacing,
        runSpacing: 22,
        children: items.map((w) => SizedBox(width: itemWidth, child: w)).toList(),
      );
    },
  );
}

/// A single-tap chip row for short, fixed option lists (exam findings, lab
/// flags, serology results). Replaces the old dropdown-per-field pattern:
/// every option is visible at once, the current value takes one tap to
/// change, and any answer other than the first ("baseline / expected")
/// option is flagged so an examiner can scan a whole panel for outliers
/// at a glance instead of opening each dropdown in turn.
class _QuickSelect extends StatelessWidget {
  final String label;
  final List<String> options;
  final String value;
  final ValueChanged<String> onChanged;

  const _QuickSelect({
    required this.label,
    required this.options,
    required this.value,
    required this.onChanged,
  });

  static const _normalColor = Color(0xFF15803D);
  static const _flagColor = Color(0xFFB91C1C);

  @override
  Widget build(BuildContext context) {
    final selected = options.contains(value) ? value : options.first;
    final isBaseline = selected == options.first;
    final isDark = context.isDark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: context.textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: context.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
            if (!isBaseline)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: _flagColor.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: _flagColor.withValues(alpha: 0.4)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.flag_rounded, size: 12, color: _flagColor),
                    SizedBox(width: 3),
                    Text(
                      'Flagged',
                      style: TextStyle(fontSize: 10, color: _flagColor, fontWeight: FontWeight.w800),
                    ),
                  ],
                ),
              ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF1E293B) : const Color(0xFFF1F5F9),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: isDark ? const Color(0xFF334155) : const Color(0xFFCBD5E1),
            ),
          ),
          child: Wrap(
            spacing: 4,
            runSpacing: 4,
            children: options.map((opt) {
              final isSelected = opt == selected;
              final optIsBaseline = opt == options.first;
              final activeColor = optIsBaseline ? _normalColor : _flagColor;

              return Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => onChanged(opt),
                  borderRadius: BorderRadius.circular(7),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected ? activeColor : Colors.transparent,
                      borderRadius: BorderRadius.circular(7),
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: activeColor.withValues(alpha: 0.35),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              )
                            ]
                          : null,
                    ),
                    child: Text(
                      opt,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
                        color: isSelected
                            ? Colors.white
                            : (isDark ? const Color(0xFF94A3B8) : const Color(0xFF475569)),
                        letterSpacing: 0.2,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}

// ============================================================================
// 1. Patient Information & Report Header
// ============================================================================

class PatientInfoFormSection extends StatelessWidget {
  final Report report;
  final List<Patient> existingPatients;
  final List<Doctor> doctors;
  final List<Clinic> clinics;
  final ValueChanged<Report> onChanged;
  final ValueChanged<Patient?> onExistingPatientSelected;

  const PatientInfoFormSection({
    super.key,
    required this.report,
    required this.existingPatients,
    required this.doctors,
    required this.clinics,
    required this.onChanged,
    required this.onExistingPatientSelected,
  });

  static const _accent = Color(0xFF0F766E);

  @override
  Widget build(BuildContext context) {
    final patient = report.patientInfo;
    final bmi = (patient.weight != null && patient.height != null && patient.height! > 0)
        ? (patient.weight! / ((patient.height! / 100) * (patient.height! / 100))).toStringAsFixed(1)
        : 'N/A';
    final bmiOutOfRange = bmi != 'N/A' && (double.parse(bmi) < 18.5 || double.parse(bmi) > 29.9);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionHeader(
          number: '01',
          title: 'Candidate & Report Header',
          subtitle: 'Identity, demographics, contact and referring physician',
          accent: _accent,
          icon: Icons.badge_rounded,
          action: existingPatients.isEmpty
              ? null
              : PopupMenuButton<Patient>(
            tooltip: 'Select Existing Patient',
            itemBuilder: (context) => existingPatients.map((p) {
              return PopupMenuItem<Patient>(
                value: p,
                child: Text('${p.name} (${p.passportNumber}) - ${p.phone ?? ""}'),
              );
            }).toList(),
            onSelected: onExistingPatientSelected,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: _accent.withValues(alpha: 0.08),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: _accent.withValues(alpha: 0.35)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.person_search_rounded, size: 18, color: _accent),
                  const SizedBox(width: 8),
                  Text('Load Existing', style: TextStyle(color: _accent, fontWeight: FontWeight.w700, fontSize: 13)),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 18),
        AppCard(
          padding: const EdgeInsets.all(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SubHeading(Icons.perm_identity_rounded, 'Identity'),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: patient.name ?? '',
                      decoration: const InputDecoration(labelText: 'Full Name (as per Passport) *', prefixIcon: Icon(Icons.person_outline)),
                      onChanged: (val) => onChanged(report.copyWith(patientInfo: patient.copyWith(name: val))),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      initialValue: patient.passportNumber ?? '',
                      decoration: const InputDecoration(labelText: 'Passport Number *', prefixIcon: Icon(Icons.badge_outlined)),
                      textCapitalization: TextCapitalization.characters,
                      onChanged: (val) => onChanged(report.copyWith(patientInfo: patient.copyWith(passportNumber: val.toUpperCase()))),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              _SubHeading(Icons.groups_2_rounded, 'Demographics'),
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      initialValue: AppConstants.nationalities.contains(patient.nationality) ? patient.nationality : (patient.nationality != null ? 'Other' : null),
                      decoration: const InputDecoration(labelText: 'Nationality', prefixIcon: Icon(Icons.flag_outlined)),
                      items: AppConstants.nationalities.map((n) => DropdownMenuItem(value: n, child: Text(n))).toList(),
                      onChanged: (val) => onChanged(report.copyWith(patientInfo: patient.copyWith(nationality: val))),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      initialValue: AppConstants.genders.contains(patient.gender) ? patient.gender : null,
                      decoration: const InputDecoration(labelText: 'Gender', prefixIcon: Icon(Icons.wc)),
                      items: AppConstants.genders.map((g) => DropdownMenuItem(value: g, child: Text(g))).toList(),
                      onChanged: (val) => onChanged(report.copyWith(patientInfo: patient.copyWith(gender: val))),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      initialValue: patient.age?.toString() ?? '',
                      decoration: const InputDecoration(labelText: 'Age (Years)', prefixIcon: Icon(Icons.calendar_today_outlined)),
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      onChanged: (val) => onChanged(report.copyWith(patientInfo: patient.copyWith(age: int.tryParse(val)))),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      initialValue: AppConstants.bloodGroups.contains(patient.bloodGroup) ? patient.bloodGroup : null,
                      decoration: const InputDecoration(labelText: 'Blood Group', prefixIcon: Icon(Icons.bloodtype_outlined)),
                      items: AppConstants.bloodGroups.map((b) => DropdownMenuItem(value: b, child: Text(b))).toList(),
                      onChanged: (val) => onChanged(report.copyWith(patientInfo: patient.copyWith(bloodGroup: val))),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              _SubHeading(Icons.monitor_weight_outlined, 'Vitals'),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: patient.height?.toString() ?? '',
                      decoration: const InputDecoration(labelText: 'Height (cm)', suffixText: 'cm', prefixIcon: Icon(Icons.height_rounded)),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      onChanged: (val) => onChanged(report.copyWith(patientInfo: patient.copyWith(height: double.tryParse(val)))),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      initialValue: patient.weight?.toString() ?? '',
                      decoration: const InputDecoration(labelText: 'Weight (kg)', suffixText: 'kg', prefixIcon: Icon(Icons.monitor_weight_outlined)),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      onChanged: (val) => onChanged(report.copyWith(patientInfo: patient.copyWith(weight: double.tryParse(val)))),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      height: 56,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: (bmiOutOfRange ? context.colorScheme.error : _accent).withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: (bmiOutOfRange ? context.colorScheme.error : _accent).withValues(alpha: 0.35)),
                      ),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Calculated BMI', style: context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant)),
                          Text(
                            bmi,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                              color: bmiOutOfRange ? context.colorScheme.error : _accent,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              _SubHeading(Icons.contact_page_outlined, 'Contact & Referring Physician'),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: patient.phone ?? '',
                      decoration: const InputDecoration(labelText: 'Phone Number', prefixIcon: Icon(Icons.phone_outlined)),
                      keyboardType: TextInputType.phone,
                      onChanged: (val) => onChanged(report.copyWith(patientInfo: patient.copyWith(phone: val))),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      initialValue: patient.email ?? '',
                      decoration: const InputDecoration(labelText: 'Email Address', prefixIcon: Icon(Icons.email_outlined)),
                      keyboardType: TextInputType.emailAddress,
                      onChanged: (val) => onChanged(report.copyWith(patientInfo: patient.copyWith(email: val))),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: DropdownButtonFormField<int>(
                      initialValue: doctors.any((d) => d.id == report.doctorId) ? report.doctorId : (doctors.isNotEmpty ? doctors.first.id : null),
                      decoration: const InputDecoration(labelText: 'Examining Doctor *', prefixIcon: Icon(Icons.medical_services_outlined)),
                      items: doctors.map((d) => DropdownMenuItem(value: d.id, child: Text('${d.name} (${d.designation})'))).toList(),
                      onChanged: (val) => onChanged(report.copyWith(doctorId: val)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ============================================================================
// 2. Physical Medical Examination
// ============================================================================

class PhysicalExamFormSection extends StatelessWidget {
  final Report report;
  final ValueChanged<Report> onChanged;
  final VoidCallback onSetAllNormal;

  const PhysicalExamFormSection({
    super.key,
    required this.report,
    required this.onChanged,
    required this.onSetAllNormal,
  });

  static const _accent = Color(0xFF312E81);

  @override
  Widget build(BuildContext context) {
    final exam = report.medicalExam;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionHeader(
          number: '02',
          title: 'Physical Medical Examination',
          subtitle: 'Vision, sensory, ENT and systemic findings',
          accent: _accent,
          icon: Icons.accessibility_new_rounded,
          action: OutlinedButton.icon(
            icon: const Icon(Icons.done_all, size: 18),
            label: const Text('Set All Normal / NAD'),
            style: OutlinedButton.styleFrom(foregroundColor: const Color(0xFF2E7D32)),
            onPressed: onSetAllNormal,
          ),
        ),
        const SizedBox(height: 18),
        AppCard(
          padding: const EdgeInsets.all(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SubHeading(Icons.visibility_outlined, 'Vision & Sensory'),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: exam.eyeVisionRight ?? '6/6',
                      decoration: const InputDecoration(labelText: 'Right Eye Vision', prefixIcon: Icon(Icons.remove_red_eye_outlined)),
                      onChanged: (val) => onChanged(report.copyWith(medicalExam: exam.copyWith(eyeVisionRight: val))),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      initialValue: exam.eyeVisionLeft ?? '6/6',
                      decoration: const InputDecoration(labelText: 'Left Eye Vision', prefixIcon: Icon(Icons.remove_red_eye_outlined)),
                      onChanged: (val) => onChanged(report.copyWith(medicalExam: exam.copyWith(eyeVisionLeft: val))),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _QuickSelect(
                      label: 'Color Vision',
                      options: const ['NORMAL', 'DEFECTIVE'],
                      value: exam.colorVision ?? 'NORMAL',
                      onChanged: (val) => onChanged(report.copyWith(medicalExam: exam.copyWith(colorVision: val))),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              _SubHeading(Icons.hearing_outlined, 'Ears'),
              Row(
                children: [
                  Expanded(
                    child: _QuickSelect(
                      label: 'Right Ear',
                      options: AppConstants.resultOptions,
                      value: exam.earRight ?? 'NORMAL',
                      onChanged: (val) => onChanged(report.copyWith(medicalExam: exam.copyWith(earRight: val))),
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    child: _QuickSelect(
                      label: 'Left Ear',
                      options: AppConstants.resultOptions,
                      value: exam.earLeft ?? 'NORMAL',
                      onChanged: (val) => onChanged(report.copyWith(medicalExam: exam.copyWith(earLeft: val))),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              _SubHeading(Icons.monitor_heart_outlined, 'Systemic Examination'),
              _responsiveGrid(context, [
                _QuickSelect(
                  label: 'Cardiovascular (CVS)',
                  options: AppConstants.resultOptions,
                  value: exam.cardiovascular ?? 'NAD',
                  onChanged: (v) => onChanged(report.copyWith(medicalExam: exam.copyWith(cardiovascular: v))),
                ),
                _QuickSelect(
                  label: 'Respiratory (Lungs)',
                  options: AppConstants.resultOptions,
                  value: exam.respiratory ?? 'NAD',
                  onChanged: (v) => onChanged(report.copyWith(medicalExam: exam.copyWith(respiratory: v))),
                ),
                _QuickSelect(
                  label: 'Gastrointestinal (Abdomen)',
                  options: AppConstants.resultOptions,
                  value: exam.gastrointestinal ?? 'NAD',
                  onChanged: (v) => onChanged(report.copyWith(medicalExam: exam.copyWith(gastrointestinal: v))),
                ),
                _QuickSelect(
                  label: 'Central Nervous System',
                  options: AppConstants.resultOptions,
                  value: exam.centralNervousSystem ?? 'NAD',
                  onChanged: (v) => onChanged(report.copyWith(medicalExam: exam.copyWith(centralNervousSystem: v))),
                ),
                _QuickSelect(
                  label: 'Hernia',
                  options: AppConstants.resultOptions,
                  value: exam.hernia ?? 'ABSENT',
                  onChanged: (v) => onChanged(report.copyWith(medicalExam: exam.copyWith(hernia: v))),
                ),
                _QuickSelect(
                  label: 'Varicose Veins',
                  options: AppConstants.resultOptions,
                  value: exam.varicoseVeins ?? 'ABSENT',
                  onChanged: (v) => onChanged(report.copyWith(medicalExam: exam.copyWith(varicoseVeins: v))),
                ),
                _QuickSelect(
                  label: 'Extremities / Locomotor',
                  options: AppConstants.resultOptions,
                  value: exam.extremities ?? 'NORMAL',
                  onChanged: (v) => onChanged(report.copyWith(medicalExam: exam.copyWith(extremities: v))),
                ),
                _QuickSelect(
                  label: 'Skin Examination',
                  options: AppConstants.resultOptions,
                  value: exam.skin ?? 'NORMAL',
                  onChanged: (v) => onChanged(report.copyWith(medicalExam: exam.copyWith(skin: v))),
                ),
                _QuickSelect(
                  label: 'Deformities',
                  options: AppConstants.resultOptions,
                  value: exam.deformities ?? 'NIL',
                  onChanged: (v) => onChanged(report.copyWith(medicalExam: exam.copyWith(deformities: v))),
                ),
                _QuickSelect(
                  label: 'Psychiatric Evaluation',
                  options: AppConstants.resultOptions,
                  value: exam.psychiatric ?? 'NORMAL',
                  onChanged: (v) => onChanged(report.copyWith(medicalExam: exam.copyWith(psychiatric: v))),
                ),
              ]),
            ],
          ),
        ),
      ],
    );
  }
}

// ============================================================================
// 3. Laboratory Investigations & Radiology
// ============================================================================

class LabInvestigationsFormSection extends StatelessWidget {
  final Report report;
  final ValueChanged<Report> onChanged;
  final VoidCallback onSetAllNormal;

  const LabInvestigationsFormSection({
    super.key,
    required this.report,
    required this.onChanged,
    required this.onSetAllNormal,
  });

  static const _accent = Color(0xFFB45309);

  @override
  Widget build(BuildContext context) {
    final lab = report.labInvestigation;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionHeader(
          number: '03',
          title: 'Laboratory Investigations & Radiology',
          subtitle: 'Urine, stool, blood chemistry, serology and chest X-ray',
          accent: _accent,
          icon: Icons.biotech_rounded,
          action: OutlinedButton.icon(
            icon: const Icon(Icons.verified_outlined, size: 18),
            label: const Text('Set All Normal / Negative'),
            style: OutlinedButton.styleFrom(foregroundColor: const Color(0xFF2E7D32)),
            onPressed: onSetAllNormal,
          ),
        ),
        const SizedBox(height: 18),
        AppCard(
          padding: const EdgeInsets.all(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SubHeading(Icons.science_outlined, 'Urine & Stool Analysis'),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _QuickSelect(
                      label: 'Urine Protein / Albumin',
                      options: const ['NIL', 'TRACE', '+1', '+2', '+3'],
                      value: lab.urineProtein ?? 'NIL',
                      onChanged: (val) => onChanged(report.copyWith(labInvestigation: lab.copyWith(urineProtein: val))),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: _QuickSelect(
                      label: 'Urine Sugar / Glucose',
                      options: const ['NIL', 'TRACE', '+1', '+2', '+3'],
                      value: lab.urineSugar ?? 'NIL',
                      onChanged: (val) => onChanged(report.copyWith(labInvestigation: lab.copyWith(urineSugar: val))),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: TextFormField(
                      initialValue: lab.urineMicroscopic ?? 'NAD',
                      decoration: const InputDecoration(labelText: 'Urine Microscopic Exam'),
                      onChanged: (val) => onChanged(report.copyWith(labInvestigation: lab.copyWith(urineMicroscopic: val))),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: _QuickSelect(
                      label: 'Stool Helminths / Ova',
                      options: const ['ABSENT', 'PRESENT'],
                      value: lab.stoolHelminths ?? 'ABSENT',
                      onChanged: (val) => onChanged(report.copyWith(labInvestigation: lab.copyWith(stoolHelminths: val))),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: _QuickSelect(
                      label: 'Stool Protozoa / Cysts',
                      options: const ['ABSENT', 'PRESENT'],
                      value: lab.stoolProtozoa ?? 'ABSENT',
                      onChanged: (val) => onChanged(report.copyWith(labInvestigation: lab.copyWith(stoolProtozoa: val))),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 26),
              _SubHeading(Icons.opacity_outlined, 'Blood Routine & Biochemistry'),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: lab.bloodHemoglobin?.toString() ?? '14.5',
                      decoration: const InputDecoration(labelText: 'Hemoglobin', suffixText: 'g/dL'),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      onChanged: (val) => onChanged(report.copyWith(labInvestigation: lab.copyWith(bloodHemoglobin: double.tryParse(val)))),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      initialValue: lab.bloodWbc?.toString() ?? '6800',
                      decoration: const InputDecoration(labelText: 'WBC Count', suffixText: '/cumm'),
                      onChanged: (val) => onChanged(report.copyWith(labInvestigation: lab.copyWith(bloodWbc: double.tryParse(val.replaceAll(RegExp(r'[^0-9.]'), ''))))),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      initialValue: lab.bloodGlucose?.toString() ?? '92.0',
                      decoration: const InputDecoration(labelText: 'Random Blood Sugar', suffixText: 'mg/dL'),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      onChanged: (val) => onChanged(report.copyWith(labInvestigation: lab.copyWith(bloodGlucose: double.tryParse(val)))),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: lab.liverSgot?.toString() ?? '24.0',
                      decoration: const InputDecoration(labelText: 'SGOT / AST', suffixText: 'U/L'),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      onChanged: (val) => onChanged(report.copyWith(labInvestigation: lab.copyWith(liverSgot: double.tryParse(val)))),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      initialValue: lab.liverSgpt?.toString() ?? '26.0',
                      decoration: const InputDecoration(labelText: 'SGPT / ALT', suffixText: 'U/L'),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      onChanged: (val) => onChanged(report.copyWith(labInvestigation: lab.copyWith(liverSgpt: double.tryParse(val)))),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      initialValue: lab.kidneyCreatinine?.toString() ?? '0.9',
                      decoration: const InputDecoration(labelText: 'Serum Creatinine', suffixText: 'mg/dL'),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      onChanged: (val) => onChanged(report.copyWith(labInvestigation: lab.copyWith(kidneyCreatinine: double.tryParse(val)))),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 26),
              _SubHeading(Icons.coronavirus_outlined, 'Serology (ELISA) & Radiology'),
              _responsiveGrid(context, [
                _QuickSelect(
                  label: 'HIV I & II (ELISA)',
                  options: AppConstants.elisaOptions,
                  value: lab.hivElisa ?? 'NON-REACTIVE',
                  onChanged: (v) => onChanged(report.copyWith(labInvestigation: lab.copyWith(hivElisa: v))),
                ),
                _QuickSelect(
                  label: 'HBsAg (Hepatitis B)',
                  options: AppConstants.elisaOptions,
                  value: lab.hbsagElisa ?? 'NON-REACTIVE',
                  onChanged: (v) => onChanged(report.copyWith(labInvestigation: lab.copyWith(hbsagElisa: v))),
                ),
                _QuickSelect(
                  label: 'Anti-HCV (Hepatitis C)',
                  options: AppConstants.elisaOptions,
                  value: lab.hcvElisa ?? 'NON-REACTIVE',
                  onChanged: (v) => onChanged(report.copyWith(labInvestigation: lab.copyWith(hcvElisa: v))),
                ),
                _QuickSelect(
                  label: 'VDRL / Syphilis',
                  options: AppConstants.elisaOptions,
                  value: lab.vdrl ?? 'NON-REACTIVE',
                  onChanged: (v) => onChanged(report.copyWith(labInvestigation: lab.copyWith(vdrl: v))),
                ),
                _QuickSelect(
                  label: 'Malaria Parasite',
                  options: AppConstants.elisaOptions,
                  value: lab.malaria ?? 'NEGATIVE',
                  onChanged: (v) => onChanged(report.copyWith(labInvestigation: lab.copyWith(malaria: v))),
                ),
                _QuickSelect(
                  label: 'Microfilaria',
                  options: AppConstants.elisaOptions,
                  value: lab.microfilaria ?? 'NEGATIVE',
                  onChanged: (v) => onChanged(report.copyWith(labInvestigation: lab.copyWith(microfilaria: v))),
                ),
              ]),
              const SizedBox(height: 22),
              DropdownButtonFormField<String>(
                initialValue: lab.chestXray ?? 'NORMAL / NO ACTIVE PNEUMONIA OR TB',
                decoration: const InputDecoration(labelText: 'Chest X-Ray (PA View) *', prefixIcon: Icon(Icons.fact_check_outlined)),
                items: [
                  'NORMAL / NO ACTIVE PNEUMONIA OR TB',
                  'NORMAL / CLEAR LUNG FIELDS',
                  'ABNORMAL - SUSPECTED TB LESION',
                  'ABNORMAL - CARDIOMEGALY SEEN',
                ].map((x) => DropdownMenuItem(value: x, child: Text(x))).toList(),
                onChanged: (val) => onChanged(report.copyWith(labInvestigation: lab.copyWith(chestXray: val))),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ============================================================================
// 4. Final Status, Remarks & Action Panel
// ============================================================================

class RemarksAndActionsSection extends StatelessWidget {
  final Report report;
  final ValueChanged<Report> onChanged;
  final VoidCallback onSaveDraft;
  final VoidCallback onSaveAndPreview;
  final VoidCallback onPrintDirect;

  const RemarksAndActionsSection({
    super.key,
    required this.report,
    required this.onChanged,
    required this.onSaveDraft,
    required this.onSaveAndPreview,
    required this.onPrintDirect,
  });

  static const _accent = Color(0xFF9D174D);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionHeader(
          number: '04',
          title: 'Final Assessment & Remarks',
          subtitle: 'Fitness determination, physician notes and report actions',
          accent: _accent,
          icon: Icons.fact_check_rounded,
        ),
        const SizedBox(height: 18),
        AppCard(
          padding: const EdgeInsets.all(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Medical Fitness Status Assessment *', style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700)),
              const SizedBox(height: 12),
              _responsiveGrid(
                context,
                [
                  _buildStatusCard(context, 'FIT / NORMAL', 'Candidate meets all occupational fitness criteria', Icons.check_circle_rounded, ReportStatus.completed, const Color(0xFF2E7D32)),
                  _buildStatusCard(context, 'UNFIT / ABNORMAL', 'One or more findings require disqualification', Icons.cancel_rounded, ReportStatus.pending, const Color(0xFFC62828)),
                  _buildStatusCard(context, 'DRAFT / PENDING', 'Examination incomplete or awaiting further review', Icons.hourglass_top_rounded, ReportStatus.draft, const Color(0xFF1565C0)),
                ],
                minColumnWidth: 220,
              ),
              const SizedBox(height: 22),
              TextFormField(
                initialValue: report.remarks ?? '',
                decoration: const InputDecoration(
                  labelText: 'Doctor Remarks & Observations',
                  hintText: 'Enter any special notes, recommendations or follow-up advise...',
                  prefixIcon: Icon(Icons.edit_note_rounded),
                  alignLabelWithHint: true,
                ),
                maxLines: 3,
                onChanged: (val) => onChanged(report.copyWith(remarks: val)),
              ),
              const SizedBox(height: 22),
              const Divider(),
              const SizedBox(height: 16),
              Wrap(
                alignment: WrapAlignment.end,
                spacing: 16,
                runSpacing: 12,
                children: [
                  OutlinedButton.icon(
                    icon: const Icon(Icons.save_outlined),
                    label: const Text('Save Draft (Ctrl+S)'),
                    style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16)),
                    onPressed: onSaveDraft,
                  ),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.picture_as_pdf),
                    label: const Text('Generate & Preview PDF'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                      backgroundColor: context.colorScheme.primary,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: onSaveAndPreview,
                  ),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.print),
                    label: const Text('Save & Print (Ctrl+P)'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
                      backgroundColor: const Color(0xFF2E7D32),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: onPrintDirect,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatusCard(BuildContext context, String label, String description, IconData icon, ReportStatus targetStatus, Color color) {
    final isSelected = report.status == targetStatus;
    final isDark = context.isDark;

    return InkWell(
      onTap: () => onChanged(report.copyWith(status: targetStatus)),
      borderRadius: BorderRadius.circular(12),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? color : (isDark ? const Color(0xFF1E293B) : const Color(0xFFF8FAFC)),
          border: Border.all(color: isSelected ? color : context.colorScheme.outline.withValues(alpha: 0.5), width: isSelected ? 2 : 1),
          borderRadius: BorderRadius.circular(12),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: color.withValues(alpha: 0.35),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: isSelected ? Colors.white : color, size: 22),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    label,
                    style: TextStyle(
                      color: isSelected ? Colors.white : context.colorScheme.onSurface,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                    ),
                  ),
                ),
                if (isSelected)
                  const Icon(Icons.check_circle_rounded, color: Colors.white, size: 18),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                color: isSelected ? Colors.white.withValues(alpha: 0.9) : context.colorScheme.onSurfaceVariant,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}