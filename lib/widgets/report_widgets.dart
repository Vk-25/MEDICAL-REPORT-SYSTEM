import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../core/models.dart';
import '../core/utils.dart';
import 'common_widgets.dart';
import 'form_widgets.dart';

/// Form section for Patient Details and Report Header info.
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

  @override
  Widget build(BuildContext context) {
    final patient = report.patientInfo;
    final bmi = (patient.weight != null && patient.height != null && patient.height! > 0)
        ? (patient.weight! / ((patient.height! / 100) * (patient.height! / 100))).toStringAsFixed(1)
        : 'N/A';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('1. Patient Information & Report Header', style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
            if (existingPatients.isNotEmpty)
              PopupMenuButton<Patient>(
                tooltip: 'Select Existing Patient',
                icon: Row(
                  children: [
                    Icon(Icons.person_search, color: context.colorScheme.primary),
                    const SizedBox(width: 6),
                    Text('Load Existing Patient', style: TextStyle(color: context.colorScheme.primary, fontWeight: FontWeight.w600)),
                  ],
                ),
                onSelected: onExistingPatientSelected,
                itemBuilder: (context) => existingPatients.map((p) {
                  return PopupMenuItem<Patient>(
                    value: p,
                    child: Text('${p.name} (${p.passportNumber}) - ${p.phone ?? ""}'),
                  );
                }).toList(),
              ),
          ],
        ),
        const SizedBox(height: 16),
        AppCard(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppPhotoPicker(
                    currentPhotoPath: patient.photoPath,
                    onPhotoSelected: (path) {
                      onChanged(report.copyWith(
                        patientInfo: patient.copyWith(photoPath: path),
                      ));
                    },
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: TextFormField(
                                initialValue: patient.name ?? '',
                                decoration: const InputDecoration(labelText: 'Full Name (as per Passport) *', prefixIcon: Icon(Icons.person_outline)),
                                onChanged: (val) => onChanged(report.copyWith(patientInfo: patient.copyWith(name: val))),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              flex: 1,
                              child: TextFormField(
                                initialValue: patient.passportNumber ?? '',
                                decoration: const InputDecoration(labelText: 'Passport Number *', prefixIcon: Icon(Icons.badge_outlined)),
                                textCapitalization: TextCapitalization.characters,
                                onChanged: (val) => onChanged(report.copyWith(patientInfo: patient.copyWith(passportNumber: val.toUpperCase()))),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
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
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: patient.height?.toString() ?? '',
                      decoration: const InputDecoration(labelText: 'Height (cm)', suffixText: 'cm'),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      onChanged: (val) => onChanged(report.copyWith(patientInfo: patient.copyWith(height: double.tryParse(val)))),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      initialValue: patient.weight?.toString() ?? '',
                      decoration: const InputDecoration(labelText: 'Weight (kg)', suffixText: 'kg'),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      onChanged: (val) => onChanged(report.copyWith(patientInfo: patient.copyWith(weight: double.tryParse(val)))),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      height: 52,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: context.colorScheme.surfaceContainerHighest.withValues(alpha: 0.4),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: context.colorScheme.outline),
                      ),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Calculated BMI:'),
                          Text(
                            bmi,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: (bmi != 'N/A' && (double.parse(bmi) < 18.5 || double.parse(bmi) > 29.9))
                                  ? context.colorScheme.error
                                  : context.colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      initialValue: AppConstants.bloodGroups.contains(patient.bloodGroup) ? patient.bloodGroup : null,
                      decoration: const InputDecoration(labelText: 'Blood Group'),
                      items: AppConstants.bloodGroups.map((b) => DropdownMenuItem(value: b, child: Text(b))).toList(),
                      onChanged: (val) => onChanged(report.copyWith(patientInfo: patient.copyWith(bloodGroup: val))),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
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

/// Form section for Physical Medical Examination.
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

  @override
  Widget build(BuildContext context) {
    final exam = report.medicalExam;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('2. Physical Medical Examination', style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
            OutlinedButton.icon(
              icon: const Icon(Icons.done_all, size: 18),
              label: const Text('Set All to Normal / NAD'),
              style: OutlinedButton.styleFrom(foregroundColor: const Color(0xFF2E7D32)),
              onPressed: onSetAllNormal,
            ),
          ],
        ),
        const SizedBox(height: 16),
        AppCard(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text('Vision & Sensory', style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
              const Divider(height: 24),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: exam.eyeVisionRight ?? '6/6',
                      decoration: const InputDecoration(labelText: 'Right Eye Vision'),
                      onChanged: (val) => onChanged(report.copyWith(medicalExam: exam.copyWith(eyeVisionRight: val))),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      initialValue: exam.eyeVisionLeft ?? '6/6',
                      decoration: const InputDecoration(labelText: 'Left Eye Vision'),
                      onChanged: (val) => onChanged(report.copyWith(medicalExam: exam.copyWith(eyeVisionLeft: val))),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      initialValue: exam.colorVision ?? 'NORMAL',
                      decoration: const InputDecoration(labelText: 'Color Vision'),
                      items: ['NORMAL', 'DEFECTIVE'].map((v) => DropdownMenuItem(value: v, child: Text(v))).toList(),
                      onChanged: (val) => onChanged(report.copyWith(medicalExam: exam.copyWith(colorVision: val))),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      initialValue: exam.earRight ?? 'NORMAL',
                      decoration: const InputDecoration(labelText: 'Right Ear'),
                      items: AppConstants.resultOptions.map((v) => DropdownMenuItem(value: v, child: Text(v))).toList(),
                      onChanged: (val) => onChanged(report.copyWith(medicalExam: exam.copyWith(earRight: val))),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      initialValue: exam.earLeft ?? 'NORMAL',
                      decoration: const InputDecoration(labelText: 'Left Ear'),
                      items: AppConstants.resultOptions.map((v) => DropdownMenuItem(value: v, child: Text(v))).toList(),
                      onChanged: (val) => onChanged(report.copyWith(medicalExam: exam.copyWith(earLeft: val))),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text('Systemic Examination', style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
              const Divider(height: 24),
              _buildExamGrid([
                _SystemicField('Cardiovascular (CVS)', exam.cardiovascular ?? 'NAD', (v) => onChanged(report.copyWith(medicalExam: exam.copyWith(cardiovascular: v)))),
                _SystemicField('Respiratory (Lungs)', exam.respiratory ?? 'NAD', (v) => onChanged(report.copyWith(medicalExam: exam.copyWith(respiratory: v)))),
                _SystemicField('Gastrointestinal (Abdomen)', exam.gastrointestinal ?? 'NAD', (v) => onChanged(report.copyWith(medicalExam: exam.copyWith(gastrointestinal: v)))),
                _SystemicField('Central Nervous System', exam.centralNervousSystem ?? 'NAD', (v) => onChanged(report.copyWith(medicalExam: exam.copyWith(centralNervousSystem: v)))),
                _SystemicField('Hernia', exam.hernia ?? 'ABSENT', (v) => onChanged(report.copyWith(medicalExam: exam.copyWith(hernia: v)))),
                _SystemicField('Varicose Veins', exam.varicoseVeins ?? 'ABSENT', (v) => onChanged(report.copyWith(medicalExam: exam.copyWith(varicoseVeins: v)))),
                _SystemicField('Extremities / Locomotor', exam.extremities ?? 'NORMAL', (v) => onChanged(report.copyWith(medicalExam: exam.copyWith(extremities: v)))),
                _SystemicField('Skin Examination', exam.skin ?? 'NORMAL', (v) => onChanged(report.copyWith(medicalExam: exam.copyWith(skin: v)))),
                _SystemicField('Deformities', exam.deformities ?? 'NIL', (v) => onChanged(report.copyWith(medicalExam: exam.copyWith(deformities: v)))),
                _SystemicField('Psychiatric Evaluation', exam.psychiatric ?? 'NORMAL', (v) => onChanged(report.copyWith(medicalExam: exam.copyWith(psychiatric: v)))),
              ]),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildExamGrid(List<_SystemicField> fields) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 3.2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: fields.length,
      itemBuilder: (context, index) {
        final f = fields[index];
        return DropdownButtonFormField<String>(
          initialValue: AppConstants.resultOptions.contains(f.value) ? f.value : 'NORMAL',
          decoration: InputDecoration(labelText: f.label),
          items: AppConstants.resultOptions.map((v) => DropdownMenuItem(value: v, child: Text(v))).toList(),
          onChanged: (val) => f.onChanged(val ?? 'NORMAL'),
        );
      },
    );
  }
}

class _SystemicField {
  final String label;
  final String value;
  final ValueChanged<String> onChanged;
  _SystemicField(this.label, this.value, this.onChanged);
}

/// Form section for Laboratory Investigations & Radiology.
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

  @override
  Widget build(BuildContext context) {
    final lab = report.labInvestigation;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('3. Laboratory Investigations & Radiology', style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
            OutlinedButton.icon(
              icon: const Icon(Icons.verified_outlined, size: 18),
              label: const Text('Set All Lab & Serology to Normal/Negative'),
              style: OutlinedButton.styleFrom(foregroundColor: const Color(0xFF2E7D32)),
              onPressed: onSetAllNormal,
            ),
          ],
        ),
        const SizedBox(height: 16),
        AppCard(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Urine & Stool Analysis', style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
              const Divider(height: 24),
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      initialValue: lab.urineProtein ?? 'NIL',
                      decoration: const InputDecoration(labelText: 'Urine Protein / Albumin'),
                      items: ['NIL', 'TRACE', '+1', '+2', '+3'].map((v) => DropdownMenuItem(value: v, child: Text(v))).toList(),
                      onChanged: (val) => onChanged(report.copyWith(labInvestigation: lab.copyWith(urineProtein: val))),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      initialValue: lab.urineSugar ?? 'NIL',
                      decoration: const InputDecoration(labelText: 'Urine Sugar / Glucose'),
                      items: ['NIL', 'TRACE', '+1', '+2', '+3'].map((v) => DropdownMenuItem(value: v, child: Text(v))).toList(),
                      onChanged: (val) => onChanged(report.copyWith(labInvestigation: lab.copyWith(urineSugar: val))),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      initialValue: lab.urineMicroscopic ?? 'NAD',
                      decoration: const InputDecoration(labelText: 'Urine Microscopic Exam'),
                      onChanged: (val) => onChanged(report.copyWith(labInvestigation: lab.copyWith(urineMicroscopic: val))),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      initialValue: lab.stoolHelminths ?? 'ABSENT',
                      decoration: const InputDecoration(labelText: 'Stool Helminths / Ova'),
                      items: ['ABSENT', 'PRESENT'].map((v) => DropdownMenuItem(value: v, child: Text(v))).toList(),
                      onChanged: (val) => onChanged(report.copyWith(labInvestigation: lab.copyWith(stoolHelminths: val))),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      initialValue: lab.stoolProtozoa ?? 'ABSENT',
                      decoration: const InputDecoration(labelText: 'Stool Protozoa / Cysts'),
                      items: ['ABSENT', 'PRESENT'].map((v) => DropdownMenuItem(value: v, child: Text(v))).toList(),
                      onChanged: (val) => onChanged(report.copyWith(labInvestigation: lab.copyWith(stoolProtozoa: val))),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text('Blood Routine & Biochemistry', style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
              const Divider(height: 24),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: lab.bloodHemoglobin?.toString() ?? '14.5',
                      decoration: const InputDecoration(labelText: 'Hemoglobin (g/dL)', suffixText: 'g/dL'),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      onChanged: (val) => onChanged(report.copyWith(labInvestigation: lab.copyWith(bloodHemoglobin: double.tryParse(val)))),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      initialValue: lab.bloodWbc?.toString() ?? '6800',
                      decoration: const InputDecoration(labelText: 'WBC Count (/cumm)', suffixText: '/cumm'),
                      onChanged: (val) => onChanged(report.copyWith(labInvestigation: lab.copyWith(bloodWbc: double.tryParse(val.replaceAll(RegExp(r'[^0-9.]'), ''))))),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      initialValue: lab.bloodGlucose?.toString() ?? '92.0',
                      decoration: const InputDecoration(labelText: 'Random Blood Sugar (mg/dL)', suffixText: 'mg/dL'),
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
                      decoration: const InputDecoration(labelText: 'SGOT / AST (U/L)', suffixText: 'U/L'),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      onChanged: (val) => onChanged(report.copyWith(labInvestigation: lab.copyWith(liverSgot: double.tryParse(val)))),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      initialValue: lab.liverSgpt?.toString() ?? '26.0',
                      decoration: const InputDecoration(labelText: 'SGPT / ALT (U/L)', suffixText: 'U/L'),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      onChanged: (val) => onChanged(report.copyWith(labInvestigation: lab.copyWith(liverSgpt: double.tryParse(val)))),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      initialValue: lab.kidneyCreatinine?.toString() ?? '0.9',
                      decoration: const InputDecoration(labelText: 'Serum Creatinine (mg/dL)', suffixText: 'mg/dL'),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      onChanged: (val) => onChanged(report.copyWith(labInvestigation: lab.copyWith(kidneyCreatinine: double.tryParse(val)))),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Text('Serology (ELISA) & Radiology', style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
              const Divider(height: 24),
              _buildElisaGrid([
                _ElisaField('HIV I & II (ELISA)', lab.hivElisa ?? 'NON-REACTIVE', (v) => onChanged(report.copyWith(labInvestigation: lab.copyWith(hivElisa: v)))),
                _ElisaField('HBsAg (Hepatitis B)', lab.hbsagElisa ?? 'NON-REACTIVE', (v) => onChanged(report.copyWith(labInvestigation: lab.copyWith(hbsagElisa: v)))),
                _ElisaField('Anti-HCV (Hepatitis C)', lab.hcvElisa ?? 'NON-REACTIVE', (v) => onChanged(report.copyWith(labInvestigation: lab.copyWith(hcvElisa: v)))),
                _ElisaField('VDRL / Syphilis', lab.vdrl ?? 'NON-REACTIVE', (v) => onChanged(report.copyWith(labInvestigation: lab.copyWith(vdrl: v)))),
                _ElisaField('Malaria Parasite', lab.malaria ?? 'NEGATIVE', (v) => onChanged(report.copyWith(labInvestigation: lab.copyWith(malaria: v)))),
                _ElisaField('Microfilaria', lab.microfilaria ?? 'NEGATIVE', (v) => onChanged(report.copyWith(labInvestigation: lab.copyWith(microfilaria: v)))),
              ]),
              const SizedBox(height: 16),
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

  Widget _buildElisaGrid(List<_ElisaField> fields) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 3.2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: fields.length,
      itemBuilder: (context, index) {
        final f = fields[index];
        return DropdownButtonFormField<String>(
          initialValue: AppConstants.elisaOptions.contains(f.value) ? f.value : 'NON-REACTIVE',
          decoration: InputDecoration(labelText: f.label),
          items: AppConstants.elisaOptions.map((v) => DropdownMenuItem(value: v, child: Text(v))).toList(),
          onChanged: (val) => f.onChanged(val ?? 'NON-REACTIVE'),
        );
      },
    );
  }
}

class _ElisaField {
  final String label;
  final String value;
  final ValueChanged<String> onChanged;
  _ElisaField(this.label, this.value, this.onChanged);
}

/// Form section for Final Status, Remarks, and Action Buttons.
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

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('4. Final Assessment, Remarks & Action Panel', style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 16),
        AppCard(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Medical Fitness Status Assessment *', style: context.textTheme.titleSmall),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: [
                            _buildStatusOption(context, 'FIT / NORMAL', ReportStatus.completed, const Color(0xFF2E7D32)),
                            _buildStatusOption(context, 'UNFIT / ABNORMAL', ReportStatus.pending, const Color(0xFFC62828)),
                            _buildStatusOption(context, 'DRAFT / PENDING', ReportStatus.draft, const Color(0xFF1565C0)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    flex: 3,
                    child: TextFormField(
                      initialValue: report.remarks ?? '',
                      decoration: const InputDecoration(
                        labelText: 'Doctor Remarks & Observations',
                        hintText: 'Enter any special notes, recommendations or follow-up advise...',
                      ),
                      maxLines: 2,
                      onChanged: (val) => onChanged(report.copyWith(remarks: val)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Divider(),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton.icon(
                    icon: const Icon(Icons.save_outlined),
                    label: const Text('Save Draft (Ctrl+S)'),
                    style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16)),
                    onPressed: onSaveDraft,
                  ),
                  const SizedBox(width: 16),
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
                  const SizedBox(width: 16),
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

  Widget _buildStatusOption(BuildContext context, String label, ReportStatus targetStatus, Color color) {
    final isSelected = report.status == targetStatus;
    return InkWell(
      onTap: () => onChanged(report.copyWith(status: targetStatus)),
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? color.withValues(alpha: 0.15) : context.colorScheme.surface,
          border: Border.all(color: isSelected ? color : context.colorScheme.outline, width: isSelected ? 2 : 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(isSelected ? Icons.check_circle : Icons.circle_outlined, color: color, size: 20),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(color: isSelected ? color : context.colorScheme.onSurface, fontWeight: FontWeight.bold, fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}
