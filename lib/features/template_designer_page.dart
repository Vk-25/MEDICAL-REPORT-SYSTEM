import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:printing/printing.dart';
import 'package:uuid/uuid.dart';
import '../core/models.dart';
import '../core/providers.dart';
import '../core/utils.dart';
import '../widgets/common_widgets.dart';

class _TableItem {
  final String labelKey;
  final String labelDefault;
  final String value;
  final bool isHeader;
  final ValueChanged<String>? onValueChange;

  const _TableItem({
    required this.labelKey,
    required this.labelDefault,
    this.value = '',
    this.isHeader = false,
    this.onValueChange,
  });
}

class TemplateDesignerPage extends ConsumerStatefulWidget {
  final String templateId;
  const TemplateDesignerPage({super.key, required this.templateId});

  @override
  ConsumerState<TemplateDesignerPage> createState() => _TemplateDesignerPageState();
}

class _TemplateDesignerPageState extends ConsumerState<TemplateDesignerPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = true;
  late ReportTemplate _template;
  Report? _sampleReport;
  Clinic? _clinic;
  Doctor? _doctor;

  int _activePreviewTab = 0; // 0 for Edit Canvas, 1 for PDF Output
  int _hoveredSectionIndex = -1;

  final List<Map<String, String>> _colorPalette = [
    {'name': 'Teal (Default)', 'value': '#0F766E'},
    {'name': 'Slate Grey', 'value': '#475569'},
    {'name': 'Indigo Blue', 'value': '#312E81'},
    {'name': 'Ocean Blue', 'value': '#0369A1'},
    {'name': 'Forest Green', 'value': '#14532D'},
    {'name': 'Deep Crimson', 'value': '#991B1B'},
    {'name': 'Dark Charcoal', 'value': '#1E293B'},
    {'name': 'Pure Black', 'value': '#000000'},
  ];

  @override
  void initState() {
    super.initState();
    _loadTemplate();
  }

  Future<void> _loadTemplate() async {
    final repo = ref.read(templateRepositoryProvider);
    final clinicRepo = ref.read(clinicRepositoryProvider);
    final doctorRepo = ref.read(doctorRepositoryProvider);
    final reportRepo = ref.read(reportRepositoryProvider);

    _clinic = await clinicRepo.getDefaultClinic();
    final docs = await doctorRepo.getActiveDoctors();
    _doctor = docs.isNotEmpty ? docs.first : null;

    final recentReports = await reportRepo.findAll();
    _sampleReport = recentReports.isNotEmpty ? recentReports.first : _getMockReport();

    if (widget.templateId == 'new') {
      _template = ReportTemplate(
        id: const Uuid().v4(),
        name: 'New Custom Template',
        layoutType: ReportLayoutType.standard,
        headerTitle: 'MEDICAL EXAMINATION REPORT',
        clinicName: _clinic?.name ?? 'SHANTI CLINIC',
        clinicAddress: _clinic?.address ?? 'Gorwa, Vadodara, Gujarat',
        clinicPhone: _clinic?.phone ?? '9327680307',
        isDefault: false,
        createdAt: DateTime.now(),
      );
    } else {
      final t = await repo.findById(int.tryParse(widget.templateId) ?? 0);
      if (t != null) {
        _template = ReportTemplate.fromTemplate(t);
      } else {
        _template = ReportTemplate(
          id: widget.templateId,
          name: 'Custom Template',
          layoutType: ReportLayoutType.standard,
          headerTitle: 'MEDICAL EXAMINATION REPORT',
          clinicName: 'SHANTI CLINIC',
          clinicAddress: '',
          clinicPhone: '',
          isDefault: false,
          createdAt: DateTime.now(),
        );
      }
    }

    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Report _getMockReport() {
    return Report(
      serialNumber: '2066',
      examDate: DateTime.now(),
      status: ReportStatus.completed,
      remarks: 'FIT',
      patientInfo: const PatientInfo(
        name: 'MAKWANA VIKASHKUMAR RAJESHBHAI',
        age: 36,
        gender: 'Male',
        height: 165,
        weight: 74,
        passportNumber: 'W 9144648',
        nationality: 'Indian',
        bloodGroup: 'B (+) Positive',
        position: 'General Fitter ( Mechanical )',
        visaNumber: 'V123456789',
        issueDate: null,
        placeOfIssue: 'Ahmedabad, Gujarat',
      ),
      medicalExam: const MedicalExam(
        eyeRight: '6/6',
        eyeLeft: '6/6',
        eyeRemarks: 'NORMAL',
        earRight: 'NAD',
        earLeft: 'NAD',
        cardiovascular: 'NAD',
        bloodPressure: '130/82 mmHg',
        heart: 'NAD',
        chestXRay: 'CLEAR',
        tuberculosis: 'ABSENT',
        abdomen: 'NAD',
        hernia: 'NIL',
        varicoseVeins: 'NIL',
        extremities: 'NAD',
        deformities: 'NAD',
        skin: 'NAD',
        clinicalRemarks: 'NIL',
      ),
      labInvestigation: const LabInvestigation(
        urineSugar: 'ABSENT',
        urineAlbumin: 'ABSENT',
        urineBilharziasis: 'ABSENT',
        stoolOva: 'NIL',
        stoolCyst: 'NIL',
        stoolBlood: 'ABSENT',
        stoolHelminthes: 'NIL',
        stoolGiardia: '0',
        stoolBilharziasis: 'NIL',
        stoolSalmonella: 'NIL',
        bloodHemoglobin: 15.5,
        bloodTlc: 9430,
        bloodWbc: 50,
        bloodEsr: 10,
        bloodSgpt: 38,
        bloodUrea: 36,
        bloodUricAcid: 4.5,
        bloodMalaria: 'NIL',
        bloodMicroFilaria: 'NIL',
        serologyPp2bs: 97,
        serologyFbs: 86,
        serologyLft: 'NORMAL',
        serologyCreatinine: 1.02,
        serologyPlateletCount: 299410,
        lipidCholesterol: 189,
        lipidTry: 164,
        lipidHdl: 72,
        lipidLdl: 165,
        lipidG6pd: '12.60%',
        elisaHiv: 'Negative',
        elisaHbsAg: 'Non - Reacti',
        elisaAntiHcv: 'Non - Reacti',
        elisaVdrl: 'Negative',
        elisaTpha: 'Negative',
      ),
    );
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    final repo = ref.read(templateRepositoryProvider);
    await repo.save(_template.toTemplate());
    ref.invalidate(templateListProvider);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Successfully saved Layout Design "${_template.name}".'),
          behavior: SnackBarBehavior.floating,
          backgroundColor: const Color(0xFF0F766E),
        ),
      );
      context.go('/templates');
    }
  }

  void _updateTemplate(ReportTemplate updated) {
    setState(() {
      _template = updated;
    });
  }

  void _updateLabel(String key, String val) {
    final updated = Map<String, String>.from(_template.customLabels);
    updated[key] = val;
    _updateTemplate(_template.copyWith(customLabels: updated));
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(body: Center(child: AppLoading(height: 400)));
    }

    final isDark = context.isDark;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Report Section Layout Designer', style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            Text('Customize template position, borders, colors, and font sizes', style: context.textTheme.bodySmall),
          ],
        ),
        actions: [
          OutlinedButton(
            onPressed: () => context.go('/templates'),
            child: const Text('Cancel'),
          ),
          const SizedBox(width: 12),
          ElevatedButton.icon(
            onPressed: _save,
            icon: const Icon(Icons.save_rounded, size: 18),
            label: const Text('Save Template Design'),
          ),
          const SizedBox(width: 24),
        ],
      ),
      body: Form(
        key: _formKey,
        child: Row(
          children: [
            // Left Customizer Sidebar Panel
            Container(
              width: 440,
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: context.colorScheme.outline)),
                color: isDark ? const Color(0xFF1E293B) : Colors.white,
              ),
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  _buildIdentitySection(),
                  const SizedBox(height: 14),
                  _buildColorsSection(),
                  const SizedBox(height: 14),
                  _buildBordersSection(),
                  const SizedBox(height: 14),
                  _buildTypographySection(),
                  const SizedBox(height: 14),
                  _buildSectionOrderSection(),
                  const SizedBox(height: 14),
                  _buildTableColumnsSection(),
                  const SizedBox(height: 14),
                  _buildClinicalBlocksSection(),
                  const SizedBox(height: 32),
                ],
              ),
            ),

            // Right Workspace / Preview Panel
            Expanded(
              child: Container(
                color: isDark ? const Color(0xFF0F172A) : const Color(0xFFF1F5F9),
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Tab Bar / Segmented Controls
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: isDark ? const Color(0xFF1E293B) : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: context.colorScheme.outline),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.remove_red_eye_outlined, color: context.colorScheme.primary, size: 18),
                          const SizedBox(width: 10),
                          Text(
                            _activePreviewTab == 0 ? 'LIVE EDITABLE WYSIWYG CANVAS' : 'COMPILED PRINT PDF PREVIEW',
                            style: context.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold, letterSpacing: 0.5),
                          ),
                          const Spacer(),
                          Container(
                            decoration: BoxDecoration(
                              color: isDark ? const Color(0xFF0F172A) : Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            padding: const EdgeInsets.all(3),
                            child: Row(
                              children: [
                                _buildTabButton(0, 'Edit Canvas', Icons.edit_note_rounded),
                                _buildTabButton(1, 'PDF Output', Icons.picture_as_pdf_rounded),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(color: context.colorScheme.outline),
                            color: isDark ? const Color(0xFF0F172A) : const Color(0xFFF1F5F9),
                          ),
                          child: _activePreviewTab == 0
                              ? SingleChildScrollView(
                                  padding: const EdgeInsets.symmetric(vertical: 24),
                                  child: Center(
                                    child: _buildInteractiveCanvas(context),
                                  ),
                                )
                              : PdfPreview(
                                  build: (format) => ref.read(pdfServiceProvider).generateGamcaReport(
                                        _sampleReport!,
                                        _clinic,
                                        _doctor,
                                        template: _template,
                                      ),
                                  canChangeOrientation: false,
                                  canChangePageFormat: false,
                                  canDebug: false,
                                  maxPageWidth: 700,
                                  actions: const [],
                                ),
                        ),
                      ),
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

  Widget _buildTabButton(int index, String label, IconData icon) {
    final isSelected = _activePreviewTab == index;
    final isDark = context.isDark;
    return GestureDetector(
      onTap: () => setState(() => _activePreviewTab = index),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? context.colorScheme.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(4),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: context.colorScheme.primary.withValues(alpha: 0.3),
                    blurRadius: 4,
                    offset: const Offset(0, 1),
                  )
                ]
              : null,
        ),
        child: Row(
          children: [
            Icon(icon, size: 14, color: isSelected ? Colors.white : (isDark ? Colors.grey.shade400 : Colors.grey.shade700)),
            const SizedBox(width: 6),
            Text(
              label,
              style: TextStyle(
                fontSize: 11.5,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : (isDark ? Colors.grey.shade400 : Colors.grey.shade700),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInteractiveCanvas(BuildContext context) {
    const double pageWidth = 640.0;
    final List<Widget> canvasSections = [];
    final order = _template.sectionOrder;

    for (int idx = 0; idx < order.length; idx++) {
      final sectionName = order[idx];
      Widget sectionWidget;
      String displayName;

      if (sectionName == 'header') {
        sectionWidget = _buildInteractiveHeader();
        displayName = 'Clinic Letterhead / Banner';
      } else if (sectionName == 'info') {
        sectionWidget = _buildInteractiveInfo();
        displayName = 'Candidate Information Block';
      } else if (sectionName == 'table') {
        sectionWidget = _buildInteractiveClinicalTable();
        displayName = 'Clinical & Lab Results Table';
      } else {
        sectionWidget = _buildInteractiveFooter();
        displayName = 'Doctor Sign-off / Footer';
      }

      canvasSections.add(
        _wrapWithSectionControls(idx, sectionName, displayName, sectionWidget),
      );

      if (idx < order.length - 1) {
        canvasSections.add(SizedBox(height: _template.sectionSpacing * 3.5));
      }
    }

    return Container(
      width: pageWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: canvasSections,
      ),
    );
  }

  Widget _wrapWithSectionControls(int index, String sectionName, String displayName, Widget child) {
    final order = _template.sectionOrder;
    return MouseRegion(
      onEnter: (_) => setState(() => _hoveredSectionIndex = index),
      onExit: (_) => setState(() => _hoveredSectionIndex = -1),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: _hoveredSectionIndex == index ? Colors.teal.withOpacity(0.4) : Colors.transparent,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            child: child,
          ),
          if (_hoveredSectionIndex == index)
            Positioned(
              top: -24,
              left: 4,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.teal,
                  borderRadius: BorderRadius.circular(4),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      displayName,
                      style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    const SizedBox(width: 8),
                    if (index > 0)
                      GestureDetector(
                        onTap: () {
                          final list = List<String>.from(order);
                          final temp = list[index];
                          list[index] = list[index - 1];
                          list[index - 1] = temp;
                          _updateTemplate(_template.copyWith(sectionOrder: list));
                        },
                        child: const Icon(Icons.arrow_upward_rounded, size: 12, color: Colors.white),
                      ),
                    if (index > 0 && index < order.length - 1) const SizedBox(width: 4),
                    if (index < order.length - 1)
                      GestureDetector(
                        onTap: () {
                          final list = List<String>.from(order);
                          final temp = list[index];
                          list[index] = list[index + 1];
                          list[index + 1] = temp;
                          _updateTemplate(_template.copyWith(sectionOrder: list));
                        },
                        child: const Icon(Icons.arrow_downward_rounded, size: 12, color: Colors.white),
                      ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildInteractiveHeader() {
    final primaryColor = Color(int.parse('FF${_template.primaryColorHex.replaceAll("#", "")}', radix: 16));
    const textColor = Colors.black;

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 1, child: Container()),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  _EditableText(
                    text: _template.clinicName.isNotEmpty ? _template.clinicName.toUpperCase() : 'SHANTI CLINIC',
                    style: TextStyle(fontSize: _template.headerFontSize - 4, fontWeight: FontWeight.bold, color: primaryColor),
                    onChanged: (val) => _updateTemplate(_template.copyWith(clinicName: val.trim().toUpperCase())),
                    isCenter: true,
                  ),
                  _EditableText(
                    text: _template.getLabel('clinic_sub_1', 'OCCUPATIONAL HEALTH CENTER'),
                    style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: textColor),
                    onChanged: (val) => _updateLabel('clinic_sub_1', val),
                    isCenter: true,
                  ),
                  _EditableText(
                    text: _template.getLabel('clinic_sub_2', '(A UNIT OF SHANTI CHARITABLE TRUST)'),
                    style: const TextStyle(fontSize: 8.5, fontWeight: FontWeight.bold, color: textColor),
                    onChanged: (val) => _updateLabel('clinic_sub_2', val),
                    isCenter: true,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _EditableText(
                    text: _template.getLabel('reg_no_1', 'Reg. No. - 11453'),
                    style: const TextStyle(fontSize: 7.5, color: textColor),
                    onChanged: (val) => _updateLabel('reg_no_1', val),
                  ),
                  _EditableText(
                    text: _template.getLabel('reg_no_2', 'Reg. No. - B-27/879'),
                    style: const TextStyle(fontSize: 7.5, color: textColor),
                    onChanged: (val) => _updateLabel('reg_no_2', val),
                  ),
                  _EditableText(
                    text: _template.getLabel('trust_no', 'Trus No : F/3162/Vadodara'),
                    style: const TextStyle(fontSize: 7.5, color: textColor),
                    onChanged: (val) => _updateLabel('trust_no', val),
                  ),
                  _EditableText(
                    text: _template.getLabel('reg_no_vadodara', 'Reg. No : Guj/3477/Vadodara'),
                    style: const TextStyle(fontSize: 7.5, color: textColor),
                    onChanged: (val) => _updateLabel('reg_no_vadodara', val),
                  ),
                  _EditableText(
                    text: _template.getLabel('clinic_phone', 'Mob. : ${_template.clinicPhone.isNotEmpty ? _template.clinicPhone : "9327680307"}'),
                    style: const TextStyle(fontSize: 7.5, color: textColor),
                    onChanged: (val) {
                      final cleaned = val.replaceAll('Mob. : ', '').trim();
                      _updateTemplate(_template.copyWith(clinicPhone: cleaned));
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Center(
          child: _EditableText(
            text: _template.getLabel('doctor_name', 'Dr. Abdhesh J Mhto'),
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: textColor),
            onChanged: (val) => _updateLabel('doctor_name', val),
            isCenter: true,
          ),
        ),
        Center(
          child: _EditableText(
            text: _template.getLabel('doc_quals_1', '(M.B.B.S., M.D., (H&H Megnt.), M.B.A. P.G.C.I.H.(Ind. Health))'),
            style: const TextStyle(fontSize: 7.5, color: textColor),
            onChanged: (val) => _updateLabel('doc_quals_1', val),
            isCenter: true,
          ),
        ),
        Center(
          child: _EditableText(
            text: _template.getLabel('doc_quals_2', 'A.F.I.H. (Ind. Health), M.R.S.H (LONDON), F.R.H.S (UK)'),
            style: const TextStyle(fontSize: 7.5, color: textColor),
            onChanged: (val) => _updateLabel('doc_quals_2', val),
            isCenter: true,
          ),
        ),
        Center(
          child: _EditableText(
            text: _template.getLabel('doc_quals_3', 'Consultants Occupational Health Physician & Diabetology'),
            style: const TextStyle(fontSize: 7.5, color: textColor),
            onChanged: (val) => _updateLabel('doc_quals_3', val),
            isCenter: true,
          ),
        ),
        Center(
          child: _EditableText(
            text: _template.getLabel('doc_quals_4', 'T.B., Typhoid, B.P., Diabetic, Malaria, Asthma, Chest infection, Sexual Disease Specialist'),
            style: const TextStyle(fontSize: 7.5, color: textColor),
            onChanged: (val) => _updateLabel('doc_quals_4', val),
            isCenter: true,
          ),
        ),
        Center(
          child: _EditableText(
            text: _template.clinicAddress.isNotEmpty ? _template.clinicAddress : 'F/102, Jalanand Township, Panchvati Refinery Road, Gorwa, Vadodara - 390 016 Gujarat.',
            style: const TextStyle(fontSize: 7.5, color: textColor),
            onChanged: (val) => _updateTemplate(_template.copyWith(clinicAddress: val.trim())),
            isCenter: true,
          ),
        ),
        Center(
          child: _EditableText(
            text: _template.getLabel('email_id', 'E-mail ID :- shanticlinicohc26@gmail.com, dr.abdhesh.mahto@gmail.com'),
            style: const TextStyle(fontSize: 7.5, color: textColor),
            onChanged: (val) => _updateLabel('email_id', val),
            isCenter: true,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 3),
          decoration: BoxDecoration(
            border: _template.showOuterBorder ? Border.all(width: _template.borderWidth, color: Colors.black) : null,
            color: Color(int.parse('FF${_template.headerBgColorHex.replaceAll("#", "")}', radix: 16)),
          ),
          child: Center(
            child: _EditableText(
              text: _template.headerTitle.isNotEmpty ? _template.headerTitle : 'MEDICAL REPORT',
              style: TextStyle(fontSize: _template.titleFontSize, fontWeight: FontWeight.bold, color: textColor),
              onChanged: (val) => _updateTemplate(_template.copyWith(headerTitle: val.trim().toUpperCase())),
              isCenter: true,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInteractiveInfo() {
    const textColor = Colors.black;
    final labelStyle = TextStyle(fontSize: _template.bodyFontSize + 1, color: textColor);
    final valueStyle = TextStyle(fontSize: _template.bodyFontSize + 1, fontWeight: FontWeight.bold, color: textColor);

    Widget infoCell(String label, String value, ValueChanged<String> onChanged) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 1.5, horizontal: 4),
        child: Row(
          children: [
            SizedBox(
              width: 90,
              child: Text(label, style: labelStyle),
            ),
            Expanded(
              child: _EditableText(
                text: value,
                style: valueStyle,
                onChanged: onChanged,
              ),
            ),
          ],
        ),
      );
    }

    final borderSide = _template.showInnerBorders ? BorderSide(width: _template.borderWidth, color: Colors.black) : BorderSide.none;

    return Container(
      decoration: BoxDecoration(
        border: _template.showOuterBorder ? Border.all(width: _template.borderWidth, color: Colors.black) : null,
      ),
      child: Table(
        columnWidths: const {
          0: FlexColumnWidth(1),
          1: FlexColumnWidth(1),
        },
        border: TableBorder(
          verticalInside: borderSide,
          horizontalInside: borderSide,
        ),
        children: [
          TableRow(children: [
            Padding(
              padding: const EdgeInsets.all(4),
              child: Text('Exam Date :- ${_sampleReport!.examDate.toDisplayDate()}', style: valueStyle),
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: _EditableText(
                text: _template.getLabel('serial_no_full', 'Serial Number :- ${_sampleReport!.serialNumber}'),
                style: valueStyle,
                onChanged: (val) {
                  final cleaned = val.replaceAll('Serial Number :- ', '').trim();
                  _updateLabel('serial_no_full', 'Serial Number :- $cleaned');
                  setState(() {
                    _sampleReport = _sampleReport!.copyWith(serialNumber: cleaned);
                  });
                },
              ),
            ),
          ]),
          TableRow(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                infoCell('Name', _sampleReport!.patientInfo.name ?? '', (val) {
                  setState(() {
                    _sampleReport = _sampleReport!.copyWith(
                      patientInfo: _sampleReport!.patientInfo.copyWith(name: val.trim()),
                    );
                  });
                }),
                infoCell('Height', '${_sampleReport!.patientInfo.height?.toStringAsFixed(0) ?? "165"} Cm', (val) {
                  setState(() {
                    final h = double.tryParse(val.replaceAll(' Cm', '')) ?? 165.0;
                    _sampleReport = _sampleReport!.copyWith(
                      patientInfo: _sampleReport!.patientInfo.copyWith(height: h),
                    );
                  });
                }),
                infoCell('Weight', '${_sampleReport!.patientInfo.weight?.toStringAsFixed(0) ?? "74"} Kg', (val) {
                  setState(() {
                    final w = double.tryParse(val.replaceAll(' Kg', '')) ?? 74.0;
                    _sampleReport = _sampleReport!.copyWith(
                      patientInfo: _sampleReport!.patientInfo.copyWith(weight: w),
                    );
                  });
                }),
                infoCell('Age', '${_sampleReport!.patientInfo.age ?? "36"} Years', (val) {
                  setState(() {
                    final a = int.tryParse(val.replaceAll(' Years', '')) ?? 36;
                    _sampleReport = _sampleReport!.copyWith(
                      patientInfo: _sampleReport!.patientInfo.copyWith(age: a),
                    );
                  });
                }),
                infoCell('Blood Group', _sampleReport!.patientInfo.bloodGroup ?? '', (val) {
                  setState(() {
                    _sampleReport = _sampleReport!.copyWith(
                      patientInfo: _sampleReport!.patientInfo.copyWith(bloodGroup: val.trim()),
                    );
                  });
                }),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                infoCell('Passport No', _sampleReport!.patientInfo.passportNumber ?? '', (val) {
                  setState(() {
                    _sampleReport = _sampleReport!.copyWith(
                      patientInfo: _sampleReport!.patientInfo.copyWith(passportNumber: val.trim()),
                    );
                  });
                }),
                infoCell('Place of Issue', _sampleReport!.patientInfo.placeOfIssue ?? '', (val) {
                  setState(() {
                    _sampleReport = _sampleReport!.copyWith(
                      patientInfo: _sampleReport!.patientInfo.copyWith(placeOfIssue: val.trim()),
                    );
                  });
                }),
                infoCell('Nationality', _sampleReport!.patientInfo.nationality ?? '', (val) {
                  setState(() {
                    _sampleReport = _sampleReport!.copyWith(
                      patientInfo: _sampleReport!.patientInfo.copyWith(nationality: val.trim()),
                    );
                  });
                }),
                infoCell('Position applied for', _sampleReport!.patientInfo.position ?? '', (val) {
                  setState(() {
                    _sampleReport = _sampleReport!.copyWith(
                      patientInfo: _sampleReport!.patientInfo.copyWith(position: val.trim()),
                    );
                  });
                }),
                infoCell('Visa No', _sampleReport!.patientInfo.visaNumber ?? '', (val) {
                  setState(() {
                    _sampleReport = _sampleReport!.copyWith(
                      patientInfo: _sampleReport!.patientInfo.copyWith(visaNumber: val.trim()),
                    );
                  });
                }),
              ],
            ),
          ]),
        ],
      ),
    );
  }

  Widget _buildInteractiveClinicalTable() {
    final exam = _sampleReport!.medicalExam;
    final lab = _sampleReport!.labInvestigation;
    
    final primaryColor = Color(int.parse('FF${_template.primaryColorHex.replaceAll("#", "")}', radix: 16));
    const textColor = Colors.black;
    final tableHeaderFont = TextStyle(fontSize: _template.tableHeaderFontSize + 1, fontWeight: FontWeight.bold, color: textColor);
    final tableBodyFont = TextStyle(fontSize: _template.tableBodyFontSize + 1, color: textColor);

    const double tableWidth = 592.0;
    final borderSide = _template.showInnerBorders ? BorderSide(width: _template.borderWidth, color: Colors.black) : BorderSide.none;

    final blockItems = {
      'eye_ear_urine': {
        'left': [
          _TableItem(labelKey: 'eye_title', labelDefault: 'EYE', isHeader: true),
          _TableItem(
            labelKey: 'eye_right_label', 
            labelDefault: '  R. EYE', 
            value: exam.eyeRight ?? 'NORMAL',
            onValueChange: (val) => setState(() => _sampleReport = _sampleReport!.copyWith(medicalExam: exam.copyWith(eyeRight: val))),
          ),
          _TableItem(
            labelKey: 'eye_left_label', 
            labelDefault: '  L. EYE', 
            value: exam.eyeLeft ?? 'NORMAL',
            onValueChange: (val) => setState(() => _sampleReport = _sampleReport!.copyWith(medicalExam: exam.copyWith(eyeLeft: val))),
          ),
          _TableItem(labelKey: 'ear_title', labelDefault: 'EAR', isHeader: true),
          _TableItem(
            labelKey: 'ear_right_label', 
            labelDefault: '  R. EAR', 
            value: exam.earRight ?? 'NAD',
            onValueChange: (val) => setState(() => _sampleReport = _sampleReport!.copyWith(medicalExam: exam.copyWith(earRight: val))),
          ),
          _TableItem(
            labelKey: 'ear_left_label', 
            labelDefault: '  L. EAR', 
            value: exam.earLeft ?? 'NAD',
            onValueChange: (val) => setState(() => _sampleReport = _sampleReport!.copyWith(medicalExam: exam.copyWith(earLeft: val))),
          ),
        ],
        'right': [
          _TableItem(labelKey: 'urine_title', labelDefault: 'URINE', isHeader: true),
          _TableItem(
            labelKey: 'urine_sugar_label', 
            labelDefault: '  SUGAR', 
            value: lab.urineSugar ?? 'ABSENT',
            onValueChange: (val) => setState(() => _sampleReport = _sampleReport!.copyWith(labInvestigation: lab.copyWith(urineSugar: val))),
          ),
          _TableItem(
            labelKey: 'urine_albumin_label', 
            labelDefault: '  ALBUMIN', 
            value: lab.urineAlbumin ?? 'ABSENT',
            onValueChange: (val) => setState(() => _sampleReport = _sampleReport!.copyWith(labInvestigation: lab.copyWith(urineAlbumin: val))),
          ),
          _TableItem(
            labelKey: 'urine_bilharziasis_label', 
            labelDefault: '  BILHARZIASIS IF ENDEMIC', 
            value: lab.urineBilharziasis ?? 'ABSENT',
            onValueChange: (val) => setState(() => _sampleReport = _sampleReport!.copyWith(labInvestigation: lab.copyWith(urineBilharziasis: val))),
          ),
        ]
      },
      'systemic_stool': {
        'left': [
          _TableItem(labelKey: 'systemic_title', labelDefault: 'SYSTEMIC EXAM', isHeader: true),
          _TableItem(
            labelKey: 'sys_cvs_label', 
            labelDefault: '  CARDIO-VASCULAR', 
            value: exam.cardiovascular ?? 'NAD',
            onValueChange: (val) => setState(() => _sampleReport = _sampleReport!.copyWith(medicalExam: exam.copyWith(cardiovascular: val))),
          ),
          _TableItem(
            labelKey: 'sys_bp_label', 
            labelDefault: '  B. P.', 
            value: exam.bloodPressure ?? '130/82 mmHg',
            onValueChange: (val) => setState(() => _sampleReport = _sampleReport!.copyWith(medicalExam: exam.copyWith(bloodPressure: val))),
          ),
          _TableItem(
            labelKey: 'sys_heart_label', 
            labelDefault: '  HEART', 
            value: exam.heart ?? 'NAD',
            onValueChange: (val) => setState(() => _sampleReport = _sampleReport!.copyWith(medicalExam: exam.copyWith(heart: val))),
          ),
          _TableItem(labelKey: 'resp_title', labelDefault: 'RESPIRATORY SYSTEM', isHeader: true),
          _TableItem(
            labelKey: 'resp_lungs_label', 
            labelDefault: '  LUNGS-CHEST X-RAY', 
            value: exam.chestXRay ?? 'CLEAR',
            onValueChange: (val) => setState(() => _sampleReport = _sampleReport!.copyWith(medicalExam: exam.copyWith(chestXRay: val))),
          ),
          _TableItem(
            labelKey: 'resp_tb_label', 
            labelDefault: '  TUBERCULOSIS', 
            value: exam.tuberculosis ?? 'ABSENT',
            onValueChange: (val) => setState(() => _sampleReport = _sampleReport!.copyWith(medicalExam: exam.copyWith(tuberculosis: val))),
          ),
        ],
        'right': [
          _TableItem(labelKey: 'stool_title', labelDefault: 'STOOL          ROUTINE', isHeader: true),
          _TableItem(
            labelKey: 'stool_ova_label', 
            labelDefault: '1. OVA', 
            value: lab.stoolOva ?? 'NIL',
            onValueChange: (val) => setState(() => _sampleReport = _sampleReport!.copyWith(labInvestigation: lab.copyWith(stoolOva: val))),
          ),
          _TableItem(
            labelKey: 'stool_cyst_label', 
            labelDefault: '2. CYST', 
            value: lab.stoolCyst ?? 'NIL',
            onValueChange: (val) => setState(() => _sampleReport = _sampleReport!.copyWith(labInvestigation: lab.copyWith(stoolCyst: val))),
          ),
          _TableItem(
            labelKey: 'stool_blood_label', 
            labelDefault: '3. BLOOD', 
            value: lab.stoolBlood ?? 'ABSENT',
            onValueChange: (val) => setState(() => _sampleReport = _sampleReport!.copyWith(labInvestigation: lab.copyWith(stoolBlood: val))),
          ),
          _TableItem(
            labelKey: 'stool_helm_label', 
            labelDefault: '4. HELMINTHES', 
            value: lab.stoolHelminthes ?? 'NIL',
            onValueChange: (val) => setState(() => _sampleReport = _sampleReport!.copyWith(labInvestigation: lab.copyWith(stoolHelminthes: val))),
          ),
          _TableItem(
            labelKey: 'stool_giardia_label', 
            labelDefault: '5. GIARDIA%', 
            value: lab.stoolGiardia ?? '0',
            onValueChange: (val) => setState(() => _sampleReport = _sampleReport!.copyWith(labInvestigation: lab.copyWith(stoolGiardia: val))),
          ),
          _TableItem(
            labelKey: 'stool_bilh_label', 
            labelDefault: '6. BILHARZIASIS (IF ENDEMIC) CULT', 
            value: lab.stoolBilharziasis ?? 'NIL',
            onValueChange: (val) => setState(() => _sampleReport = _sampleReport!.copyWith(labInvestigation: lab.copyWith(stoolBilharziasis: val))),
          ),
          _TableItem(
            labelKey: 'stool_salm_label', 
            labelDefault: '7. SALMONELLA', 
            value: lab.stoolSalmonella ?? 'NIL',
            onValueChange: (val) => setState(() => _sampleReport = _sampleReport!.copyWith(labInvestigation: lab.copyWith(stoolSalmonella: val))),
          ),
          _TableItem(
            labelKey: 'stool_shig_label', 
            labelDefault: '  SHIGELLA', 
            value: lab.stoolShigella ?? '0',
            onValueChange: (val) => setState(() => _sampleReport = _sampleReport!.copyWith(labInvestigation: lab.copyWith(stoolShigella: val))),
          ),
          _TableItem(
            labelKey: 'stool_chol_label', 
            labelDefault: '  V CHOLERA (IF ENDEMIC)', 
            value: lab.stoolCholera ?? '0',
            onValueChange: (val) => setState(() => _sampleReport = _sampleReport!.copyWith(labInvestigation: lab.copyWith(stoolCholera: val))),
          ),
        ]
      },
      'gastro_blood': {
        'left': [
          _TableItem(labelKey: 'gastro_title', labelDefault: 'GASTRO INTESTINAL', isHeader: true),
          _TableItem(
            labelKey: 'gastro_abd_label', 
            labelDefault: '  ABDOMEN', 
            value: exam.abdomen ?? 'NAD',
            onValueChange: (val) => setState(() => _sampleReport = _sampleReport!.copyWith(medicalExam: exam.copyWith(abdomen: val))),
          ),
        ],
        'right': [
          _TableItem(labelKey: 'blood_title', labelDefault: 'BLOOD', isHeader: true),
          _TableItem(
            labelKey: 'blood_hb_label', 
            labelDefault: '  HEMOGLOBIN', 
            value: lab.bloodHemoglobin?.toString() ?? '15.5',
            onValueChange: (val) => setState(() => _sampleReport = _sampleReport!.copyWith(labInvestigation: lab.copyWith(bloodHemoglobin: double.tryParse(val)))),
          ),
          _TableItem(
            labelKey: 'blood_tlc_label', 
            labelDefault: '  1. TLC', 
            value: lab.bloodTlc?.toString() ?? '9430',
            onValueChange: (val) => setState(() => _sampleReport = _sampleReport!.copyWith(labInvestigation: lab.copyWith(bloodTlc: double.tryParse(val)))),
          ),
          _TableItem(
            labelKey: 'blood_wbc_label', 
            labelDefault: '  2. W B C', 
            value: lab.bloodWbc?.toString() ?? '50 / 54 / 01 / 01 / 000',
            onValueChange: (val) => setState(() => _sampleReport = _sampleReport!.copyWith(labInvestigation: lab.copyWith(bloodWbc: double.tryParse(val)))),
          ),
          _TableItem(
            labelKey: 'blood_esr_label', 
            labelDefault: '  3. E S R', 
            value: lab.bloodEsr?.toString() ?? '10',
            onValueChange: (val) => setState(() => _sampleReport = _sampleReport!.copyWith(labInvestigation: lab.copyWith(bloodEsr: double.tryParse(val)))),
          ),
          _TableItem(
            labelKey: 'blood_sgpt_label', 
            labelDefault: '  4. S G P T', 
            value: lab.bloodSgpt?.toString() ?? '38',
            onValueChange: (val) => setState(() => _sampleReport = _sampleReport!.copyWith(labInvestigation: lab.copyWith(bloodSgpt: double.tryParse(val)))),
          ),
          _TableItem(
            labelKey: 'blood_urea_label', 
            labelDefault: '  5. BLOOD UREA', 
            value: lab.bloodUrea?.toString() ?? '36',
            onValueChange: (val) => setState(() => _sampleReport = _sampleReport!.copyWith(labInvestigation: lab.copyWith(bloodUrea: double.tryParse(val)))),
          ),
          _TableItem(
            labelKey: 'blood_uric_label', 
            labelDefault: '  6. S-URICACID', 
            value: lab.bloodUricAcid?.toString() ?? '4.5',
            onValueChange: (val) => setState(() => _sampleReport = _sampleReport!.copyWith(labInvestigation: lab.copyWith(bloodUricAcid: double.tryParse(val)))),
          ),
          _TableItem(labelKey: 'blood_thick_title', labelDefault: '  THICK FILM FOR', isHeader: true),
          _TableItem(
            labelKey: 'blood_malaria_label', 
            labelDefault: '  1. MALARIA', 
            value: lab.bloodMalaria ?? 'NIL',
            onValueChange: (val) => setState(() => _sampleReport = _sampleReport!.copyWith(labInvestigation: lab.copyWith(bloodMalaria: val))),
          ),
          _TableItem(
            labelKey: 'blood_filaria_label', 
            labelDefault: '  2. MICRO FILARIA', 
            value: lab.bloodMicroFilaria ?? 'NIL',
            onValueChange: (val) => setState(() => _sampleReport = _sampleReport!.copyWith(labInvestigation: lab.copyWith(bloodMicroFilaria: val))),
          ),
        ]
      },
      'other_serology': {
        'left': [
          _TableItem(labelKey: 'other_title', labelDefault: 'OTHER', isHeader: true),
          _TableItem(
            labelKey: 'other_hernia_label', 
            labelDefault: '  HERNIA', 
            value: exam.hernia ?? 'NIL',
            onValueChange: (val) => setState(() => _sampleReport = _sampleReport!.copyWith(medicalExam: exam.copyWith(hernia: val))),
          ),
          _TableItem(
            labelKey: 'other_veins_label', 
            labelDefault: '  VARICOSE VEINS', 
            value: exam.varicoseVeins ?? 'NIL',
            onValueChange: (val) => setState(() => _sampleReport = _sampleReport!.copyWith(medicalExam: exam.copyWith(varicoseVeins: val))),
          ),
        ],
        'right': [
          _TableItem(labelKey: 'serology_title', labelDefault: 'SEROLOGY', isHeader: true),
          _TableItem(
            labelKey: 'serology_pp2bs_label', 
            labelDefault: '  1. PP 2 BS', 
            value: lab.serologyPp2bs?.toString() ?? '97%',
            onValueChange: (val) => setState(() => _sampleReport = _sampleReport!.copyWith(labInvestigation: lab.copyWith(serologyPp2bs: double.tryParse(val)))),
          ),
          _TableItem(
            labelKey: 'serology_fbs_label', 
            labelDefault: '  2. F. B. S.', 
            value: lab.serologyFbs?.toString() ?? '86%',
            onValueChange: (val) => setState(() => _sampleReport = _sampleReport!.copyWith(labInvestigation: lab.copyWith(serologyFbs: double.tryParse(val)))),
          ),
          _TableItem(
            labelKey: 'serology_lft_label', 
            labelDefault: '  3. L. F. T.', 
            value: lab.serologyLft ?? 'NORMAL',
            onValueChange: (val) => setState(() => _sampleReport = _sampleReport!.copyWith(labInvestigation: lab.copyWith(serologyLft: val))),
          ),
          _TableItem(
            labelKey: 'serology_creat_label', 
            labelDefault: '  4. CREATINE', 
            value: lab.serologyCreatinine?.toString() ?? '1.020mg%',
            onValueChange: (val) => setState(() => _sampleReport = _sampleReport!.copyWith(labInvestigation: lab.copyWith(serologyCreatinine: double.tryParse(val)))),
          ),
          _TableItem(
            labelKey: 'serology_plat_label', 
            labelDefault: '  5. PLATELET COUNT', 
            value: lab.serologyPlateletCount?.toString() ?? '2,99,410',
            onValueChange: (val) => setState(() => _sampleReport = _sampleReport!.copyWith(labInvestigation: lab.copyWith(serologyPlateletCount: double.tryParse(val.replaceAll(',', ''))))),
          ),
        ]
      },
      'extremities_lipid': {
        'left': [
          _TableItem(
            labelKey: 'ext_extremities_label', 
            labelDefault: '  EXTREMITIES', 
            value: exam.extremities ?? 'NAD',
            onValueChange: (val) => setState(() => _sampleReport = _sampleReport!.copyWith(medicalExam: exam.copyWith(extremities: val))),
          ),
          _TableItem(
            labelKey: 'ext_deform_label', 
            labelDefault: '  DEFORMITIES', 
            value: exam.deformities ?? 'NAD',
            onValueChange: (val) => setState(() => _sampleReport = _sampleReport!.copyWith(medicalExam: exam.copyWith(deformities: val))),
          ),
          _TableItem(
            labelKey: 'ext_skin_label', 
            labelDefault: '  SKIN', 
            value: exam.skin ?? 'NAD',
            onValueChange: (val) => setState(() => _sampleReport = _sampleReport!.copyWith(medicalExam: exam.copyWith(skin: val))),
          ),
        ],
        'right': [
          _TableItem(labelKey: 'lipid_title', labelDefault: 'LIPID PROFILE', isHeader: true),
          _TableItem(
            labelKey: 'lipid_cho_label', 
            labelDefault: '  1. S-CHO', 
            value: lab.lipidCholesterol?.toString() ?? '89%',
            onValueChange: (val) => setState(() => _sampleReport = _sampleReport!.copyWith(labInvestigation: lab.copyWith(lipidCholesterol: double.tryParse(val)))),
          ),
          _TableItem(
            labelKey: 'lipid_try_label', 
            labelDefault: '  2. T R Y', 
            value: lab.lipidTry?.toString() ?? '164%',
            onValueChange: (val) => setState(() => _sampleReport = _sampleReport!.copyWith(labInvestigation: lab.copyWith(lipidTry: double.tryParse(val)))),
          ),
          _TableItem(
            labelKey: 'lipid_hdl_label', 
            labelDefault: '  3. H D L', 
            value: lab.lipidHdl?.toString() ?? '72%',
            onValueChange: (val) => setState(() => _sampleReport = _sampleReport!.copyWith(labInvestigation: lab.copyWith(lipidHdl: double.tryParse(val)))),
          ),
          _TableItem(
            labelKey: 'lipid_ldl_label', 
            labelDefault: '  4. L D L', 
            value: lab.lipidLdl?.toString() ?? '165',
            onValueChange: (val) => setState(() => _sampleReport = _sampleReport!.copyWith(labInvestigation: lab.copyWith(lipidLdl: double.tryParse(val)))),
          ),
          _TableItem(
            labelKey: 'lipid_g6pd_label', 
            labelDefault: '  5. G6 PD', 
            value: lab.lipidG6pd ?? '12.60%',
            onValueChange: (val) => setState(() => _sampleReport = _sampleReport!.copyWith(labInvestigation: lab.copyWith(lipidG6pd: val))),
          ),
        ]
      },
      'hernia_elisa': {
        'left': [
          _TableItem(labelKey: 'hernia_title', labelDefault: 'HERNIAVENEREAL DISEASES', isHeader: true),
          _TableItem(
            labelKey: 'hernia_clin_label', 
            labelDefault: '  CLINICAL', 
            value: exam.clinicalRemarks ?? 'NIL',
            onValueChange: (val) => setState(() => _sampleReport = _sampleReport!.copyWith(medicalExam: exam.copyWith(clinicalRemarks: val))),
          ),
        ],
        'right': [
          _TableItem(labelKey: 'elisa_title', labelDefault: 'ELISA', isHeader: true),
          _TableItem(
            labelKey: 'elisa_hiv_label', 
            labelDefault: '  1. H.I.V. 1 & 2', 
            value: lab.elisaHiv ?? 'Negative',
            onValueChange: (val) => setState(() => _sampleReport = _sampleReport!.copyWith(labInvestigation: lab.copyWith(elisaHiv: val))),
          ),
          _TableItem(
            labelKey: 'elisa_hbs_label', 
            labelDefault: '  2. Hbs Ag%', 
            value: lab.elisaHbsAg ?? 'Non - Reacti',
            onValueChange: (val) => setState(() => _sampleReport = _sampleReport!.copyWith(labInvestigation: lab.copyWith(elisaHbsAg: val))),
          ),
          _TableItem(
            labelKey: 'elisa_hcv_label', 
            labelDefault: '  3. Anti HCV%', 
            value: lab.elisaAntiHcv ?? 'Non - Reacti',
            onValueChange: (val) => setState(() => _sampleReport = _sampleReport!.copyWith(labInvestigation: lab.copyWith(elisaAntiHcv: val))),
          ),
          _TableItem(
            labelKey: 'elisa_vdrl_label', 
            labelDefault: '  V D R L', 
            value: lab.elisaVdrl ?? 'Negative',
            onValueChange: (val) => setState(() => _sampleReport = _sampleReport!.copyWith(labInvestigation: lab.copyWith(elisaVdrl: val))),
          ),
          _TableItem(
            labelKey: 'elisa_tpha_label', 
            labelDefault: '  TPHA(IF VDRL TPH Wedal Test)', 
            value: lab.elisaTpha ?? 'Negative',
            onValueChange: (val) => setState(() => _sampleReport = _sampleReport!.copyWith(labInvestigation: lab.copyWith(elisaTpha: val))),
          ),
        ]
      },
    };

    final rows = <TableRow>[];
    final isSpacerList = <bool>[];

    Widget buildInteractiveCell(_TableItem item, bool isValueColumn, bool hasBottomBorder, double paddingVal) {
      final text = isValueColumn ? item.value : _template.getLabel(item.labelKey, item.labelDefault);
      final isBold = !isValueColumn && item.isHeader;
      final color = isBold ? primaryColor : textColor;
      final font = TextStyle(
        fontSize: _template.tableBodyFontSize + 1,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        color: color,
      );

      return Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: hasBottomBorder
                ? BorderSide(width: _template.borderWidth, color: Colors.black)
                : BorderSide.none,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1.5),
        alignment: isValueColumn ? Alignment.center : Alignment.centerLeft,
        child: _EditableText(
          text: text,
          style: font,
          onChanged: (val) {
            if (isValueColumn) {
              if (item.onValueChange != null) {
                item.onValueChange!(val);
              }
            } else {
              _updateLabel(item.labelKey, val);
            }
          },
          isCenter: isValueColumn,
        ),
      );
    }

    Widget buildInteractiveHeaderCell(String labelKey, String labelDefault, TextStyle style) {
      return Container(
        decoration: BoxDecoration(
          color: Color(int.parse('FF${_template.headerBgColorHex.replaceAll("#", "")}', radix: 16)),
          border: Border(
            bottom: BorderSide(width: _template.borderWidth, color: Colors.black),
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 3),
        alignment: Alignment.center,
        child: _EditableText(
          text: _template.getLabel(labelKey, labelDefault),
          style: style,
          onChanged: (val) => _updateLabel(labelKey, val),
          isCenter: true,
        ),
      );
    }

    rows.add(
      TableRow(
        children: [
          buildInteractiveHeaderCell('sub_hdr_left_type', 'TYPE OF MEDICAL EXAMINATION', tableHeaderFont),
          buildInteractiveHeaderCell('sub_hdr_left_res', 'RESULTS', tableHeaderFont),
          buildInteractiveHeaderCell('sub_hdr_right_type', 'TYPE OF INVESTIGATIONS', tableHeaderFont),
          buildInteractiveHeaderCell('sub_hdr_right_res', 'RESULTS', tableHeaderFont),
        ],
      ),
    );
    isSpacerList.add(false);

    for (final blockName in _template.blockOrder) {
      final block = blockItems[blockName];
      if (block == null) continue;

      final leftItems = block['left'] ?? [];
      final rightItems = block['right'] ?? [];
      final maxLen = leftItems.length > rightItems.length ? leftItems.length : rightItems.length;
      final paddingVal = _template.getBlockSpacing(blockName);

      for (int i = 0; i < maxLen; i++) {
        final left = i < leftItems.length ? leftItems[i] : const _TableItem(labelKey: '', labelDefault: '');
        final right = i < rightItems.length ? rightItems[i] : const _TableItem(labelKey: '', labelDefault: '');

        final bool isNextLeftHeader = (i + 1 < leftItems.length) && leftItems[i + 1].isHeader;
        final bool isNextRightHeader = (i + 1 < rightItems.length) && rightItems[i + 1].isHeader;

        final bool isLastRow = (i == maxLen - 1);
        final bool leftBorder = !_template.blockBorderOnly ||
            left.isHeader ||
            isNextLeftHeader ||
            (i == leftItems.length - 1) ||
            isLastRow;

        final bool rightBorder = !_template.blockBorderOnly ||
            right.isHeader ||
            isNextRightHeader ||
            (i == rightItems.length - 1) ||
            isLastRow;

        rows.add(
          TableRow(
            children: [
              buildInteractiveCell(left, false, leftBorder, paddingVal),
              buildInteractiveCell(left, true, leftBorder, paddingVal),
              buildInteractiveCell(right, false, rightBorder, paddingVal),
              buildInteractiveCell(right, true, rightBorder, paddingVal),
            ],
          ),
        );
        isSpacerList.add(false);
      }

      rows.add(
        TableRow(
          children: List.generate(4, (colIdx) => Container(
            height: 10,
            color: Colors.transparent,
            child: MouseRegion(
              cursor: SystemMouseCursors.resizeUpDown,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onVerticalDragUpdate: (details) {
                  final double currentSpacing = _template.getBlockSpacing(blockName);
                  final double newSpacing = (currentSpacing + details.delta.dy * 0.15).clamp(0.4, 6.0);
                  final updatedSpacings = Map<String, double>.from(_template.blockSpacings);
                  updatedSpacings[blockName] = newSpacing;
                  _updateTemplate(_template.copyWith(blockSpacings: updatedSpacings));
                },
                child: Center(
                  child: Container(
                    height: 2,
                    color: Colors.teal.withOpacity(0.12),
                  ),
                ),
              ),
            ),
          )),
        ),
      );
      isSpacerList.add(true);
    }

    final totalRows = rows.length;
    final List<Widget> rowWidgets = [];

    for (int index = 0; index < totalRows; index++) {
      final tr = rows[index];
      final isSpacer = isSpacerList[index];
      final w = _template.getRowWidths(index);
      final totalSum = w[0] + w[1] + w[2] + w[3];
      
      final p0 = w[0] / totalSum;
      final p1 = w[1] / totalSum;
      final p2 = w[2] / totalSum;

      final x0 = p0 * tableWidth;
      final x1 = (p0 + p1) * tableWidth;
      final x2 = (p0 + p1 + p2) * tableWidth;

      Widget rowTable = Table(
        columnWidths: {
          0: FlexColumnWidth(w[0]),
          1: FlexColumnWidth(w[1]),
          2: FlexColumnWidth(w[2]),
          3: FlexColumnWidth(w[3]),
        },
        border: TableBorder(
          left: _template.showOuterBorder ? BorderSide(width: _template.borderWidth, color: Colors.black) : BorderSide.none,
          right: _template.showOuterBorder ? BorderSide(width: _template.borderWidth, color: Colors.black) : BorderSide.none,
          verticalInside: borderSide,
        ),
        children: [tr],
      );

      if (isSpacer) {
        rowWidgets.add(rowTable);
        continue;
      }

      rowWidgets.add(
        Stack(
          children: [
            rowTable,
            // Splitter 0 (between Col 0 and 1)
            Positioned(
              left: x0 - 8.0,
              top: 0,
              bottom: 0,
              child: MouseRegion(
                cursor: SystemMouseCursors.resizeLeftRight,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onHorizontalDragUpdate: (details) {
                    final double newX = (x0 + details.delta.dx).clamp(0.10 * tableWidth, ( (w[0] + w[1] - 0.5) / totalSum ) * tableWidth);
                    final double newRatio = newX / tableWidth;
                    final double newWidth0 = newRatio * totalSum;
                    final double newWidth1 = (w[0] + w[1]) - newWidth0;
                    
                    final newWidths = [newWidth0, newWidth1, w[2], w[3]];
                    final updatedWidths = Map<String, List<double>>.from(_template.rowColumnWidths);
                    updatedWidths['row_$index'] = newWidths;
                    _updateTemplate(_template.copyWith(rowColumnWidths: updatedWidths));
                  },
                  child: Container(
                    width: 16,
                    color: Colors.transparent,
                    child: Center(
                      child: Container(width: 2, color: Colors.teal.withOpacity(0.35)),
                    ),
                  ),
                ),
              ),
            ),
            // Splitter 1 (Middle Divider)
            Positioned(
              left: x1 - 8.0,
              top: 0,
              bottom: 0,
              child: MouseRegion(
                cursor: SystemMouseCursors.resizeLeftRight,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onHorizontalDragUpdate: (details) {
                    final double newX = (x1 + details.delta.dx).clamp(0.20 * tableWidth, 0.80 * tableWidth);
                    final double newRatio = newX / tableWidth;
                    final double leftHalf = newRatio * totalSum;
                    final double rightHalf = (1.0 - newRatio) * totalSum;
                    
                    final r0 = w[0] / (w[0] + w[1]);
                    final r1 = w[1] / (w[0] + w[1]);
                    final newWidth0 = r0 * leftHalf;
                    final newWidth1 = r1 * leftHalf;

                    final r2 = w[2] / (w[2] + w[3]);
                    final r3 = w[3] / (w[2] + w[3]);
                    final newWidth2 = r2 * rightHalf;
                    final newWidth3 = r3 * rightHalf;

                    final newWidths = [newWidth0, newWidth1, newWidth2, newWidth3];
                    final updatedWidths = Map<String, List<double>>.from(_template.rowColumnWidths);
                    updatedWidths['row_$index'] = newWidths;
                    _updateTemplate(_template.copyWith(rowColumnWidths: updatedWidths));
                  },
                  child: Container(
                    width: 16,
                    color: Colors.transparent,
                    child: Center(
                      child: Container(width: 3, color: Colors.teal.withOpacity(0.65)),
                    ),
                  ),
                ),
              ),
            ),
            // Splitter 2 (between Col 2 and 3)
            Positioned(
              left: x2 - 8.0,
              top: 0,
              bottom: 0,
              child: MouseRegion(
                cursor: SystemMouseCursors.resizeLeftRight,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onHorizontalDragUpdate: (details) {
                    final double newX = (x2 + details.delta.dx).clamp( ( (w[0] + w[1] + 0.5) / totalSum ) * tableWidth, 0.92 * tableWidth);
                    final double rightStart = x1;
                    final double rightWidth = tableWidth - rightStart;
                    final double relX = newX - rightStart;
                    final double relRatio = relX / rightWidth;
                    
                    final double sum23 = w[2] + w[3];
                    final double newWidth2 = relRatio * sum23;
                    final double newWidth3 = sum23 - newWidth2;

                    final newWidths = [w[0], w[1], newWidth2, newWidth3];
                    final updatedWidths = Map<String, List<double>>.from(_template.rowColumnWidths);
                    updatedWidths['row_$index'] = newWidths;
                    _updateTemplate(_template.copyWith(rowColumnWidths: updatedWidths));
                  },
                  child: Container(
                    width: 16,
                    color: Colors.transparent,
                    child: Center(
                      child: Container(width: 2, color: Colors.teal.withOpacity(0.35)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    final bannerWidths = _template.getRowWidths(0);
    final leftBannerFlex = bannerWidths[0] + bannerWidths[1];
    final rightBannerFlex = bannerWidths[2] + bannerWidths[3];

    return Column(
      children: [
        Table(
          columnWidths: {
            0: FlexColumnWidth(leftBannerFlex),
            1: FlexColumnWidth(rightBannerFlex),
          },
          border: BorderBorderSideOnly(t: _template, borderSide: borderSide),
          children: [
            TableRow(
              children: [
                Container(
                  color: Color(int.parse('FF${_template.headerBgColorHex.replaceAll("#", "")}', radix: 16)),
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Center(
                    child: _EditableText(
                      text: _template.getLabel('main_hdr_left', 'MEDICAL EXAMINATION'),
                      style: tableHeaderFont,
                      onChanged: (val) => _updateLabel('main_hdr_left', val),
                      isCenter: true,
                    ),
                  ),
                ),
                Container(
                  color: Color(int.parse('FF${_template.headerBgColorHex.replaceAll("#", "")}', radix: 16)),
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Center(
                    child: _EditableText(
                      text: _template.getLabel('main_hdr_right', 'LABORATORY INVESTIGATION'),
                      style: tableHeaderFont,
                      onChanged: (val) => _updateLabel('main_hdr_right', val),
                      isCenter: true,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        ...rowWidgets,
      ],
    );
  }

  Widget _buildInteractiveFooter() {
    final primaryColor = Color(int.parse('FF${_template.primaryColorHex.replaceAll("#", "")}', radix: 16));
    const textColor = Colors.black;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _EditableText(
              text: 'For ${_template.clinicName.isNotEmpty ? _template.clinicName : "SHANTI CLINIC"} (OHC)',
              style: TextStyle(fontSize: _template.bodyFontSize + 2.5, fontWeight: FontWeight.bold, color: primaryColor),
              onChanged: (val) {
                final cleaned = val.replaceAll('For ', '').replaceAll(' (OHC)', '').trim();
                _updateTemplate(_template.copyWith(clinicName: cleaned.toUpperCase()));
              },
            ),
            _EditableText(
              text: _template.getLabel('footer_clinic_ohc', 'Occupational Health Center'),
              style: const TextStyle(fontSize: 7.5, color: textColor),
              onChanged: (val) => _updateLabel('footer_clinic_ohc', val),
            ),
            _EditableText(
              text: _template.getLabel('footer_doc_name', 'Dr. Abdhesh J Mahto'),
              style: const TextStyle(fontSize: 7.5, color: textColor),
              onChanged: (val) => _updateLabel('footer_doc_name', val),
            ),
            _EditableText(
              text: _template.getLabel('footer_doc_quals_1', 'M.b.b.s,m.d (blo) M.b.a.(h&m)'),
              style: const TextStyle(fontSize: 7.5, color: textColor),
              onChanged: (val) => _updateLabel('footer_doc_quals_1', val),
            ),
            _EditableText(
              text: _template.getLabel('footer_doc_quals_2', 'P.g.c.i.h.(afih)ind. Health'),
              style: const TextStyle(fontSize: 7.5, color: textColor),
              onChanged: (val) => _updateLabel('footer_doc_quals_2', val),
            ),
            const SizedBox(height: 5),
            _EditableText(
              text: _template.getLabel('footer_auth_sig', 'Authorised Signatory'),
              style: const TextStyle(fontSize: 8.5, fontWeight: FontWeight.bold, color: textColor),
              onChanged: (val) => _updateLabel('footer_auth_sig', val),
            ),
            _EditableText(
              text: _template.getLabel('footer_doc_desc', 'Consultants Occupational Health Physician'),
              style: const TextStyle(fontSize: 7.5, color: textColor),
              onChanged: (val) => _updateLabel('footer_doc_desc', val),
            ),
            _EditableText(
              text: _template.getLabel('footer_address_1', 'Add. F-102 Jalanand Township'),
              style: const TextStyle(fontSize: 7.5, color: textColor),
              onChanged: (val) => _updateLabel('footer_address_1', val),
            ),
            _EditableText(
              text: _template.getLabel('footer_address_2', 'Panchvati Gorwa Vadodara 390016'),
              style: const TextStyle(fontSize: 7.5, color: textColor),
              onChanged: (val) => _updateLabel('footer_address_2', val),
            ),
            _EditableText(
              text: _template.getLabel('footer_mobiles', 'M.:- 9327680307/8849793270'),
              style: const TextStyle(fontSize: 7.5, color: textColor),
              onChanged: (val) => _updateLabel('footer_mobiles', val),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildIdentitySection() {
    return _CustomizerAccordion(
      title: 'Clinic Identity & Document Headers',
      icon: Icons.local_hospital_outlined,
      children: [
        TextFormField(
          initialValue: _template.name,
          decoration: const InputDecoration(labelText: 'Template Name *', prefixIcon: Icon(Icons.label_outline_rounded, size: 18)),
          validator: (v) => v == null || v.trim().isEmpty ? 'Required' : null,
          onChanged: (val) => _updateTemplate(_template.copyWith(name: val.trim())),
        ),
        const SizedBox(height: 14),
        TextFormField(
          initialValue: _template.headerTitle,
          decoration: const InputDecoration(labelText: 'Document Header Title *', prefixIcon: Icon(Icons.title_rounded, size: 18)),
          textCapitalization: TextCapitalization.characters,
          validator: (v) => v == null || v.trim().isEmpty ? 'Required' : null,
          onChanged: (val) => _updateTemplate(_template.copyWith(headerTitle: val.trim().toUpperCase())),
        ),
        const SizedBox(height: 14),
        TextFormField(
          initialValue: _template.clinicName,
          decoration: const InputDecoration(labelText: 'Clinic Name *', prefixIcon: Icon(Icons.business_rounded, size: 18)),
          textCapitalization: TextCapitalization.characters,
          validator: (v) => v == null || v.trim().isEmpty ? 'Required' : null,
          onChanged: (val) => _updateTemplate(_template.copyWith(clinicName: val.trim().toUpperCase())),
        ),
        const SizedBox(height: 14),
        TextFormField(
          initialValue: _template.clinicAddress,
          decoration: const InputDecoration(labelText: 'Clinic Address / License Subtitle', prefixIcon: Icon(Icons.location_on_outlined, size: 18)),
          onChanged: (val) => _updateTemplate(_template.copyWith(clinicAddress: val.trim())),
        ),
        const SizedBox(height: 14),
        TextFormField(
          initialValue: _template.clinicPhone,
          decoration: const InputDecoration(labelText: 'Clinic Phone', prefixIcon: Icon(Icons.phone_outlined, size: 18)),
          onChanged: (val) => _updateTemplate(_template.copyWith(clinicPhone: val.trim())),
        ),
      ],
    );
  }

  Widget _buildColorsSection() {
    return _CustomizerAccordion(
      title: 'Theme Branding Colors',
      icon: Icons.palette_outlined,
      children: [
        Text('Accent / Primary Elements Color', style: context.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        _ColorSelector(
          selectedValue: _template.primaryColorHex,
          palette: _colorPalette,
          onSelected: (color) => _updateTemplate(_template.copyWith(primaryColorHex: color)),
        ),
        const SizedBox(height: 14),
        Text('Main Text Color', style: context.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        _ColorSelector(
          selectedValue: _template.textColorHex,
          palette: const [
            {'name': 'Black (Default)', 'value': '#000000'},
            {'name': 'Dark Grey', 'value': '#1E293B'},
            {'name': 'Slate Gray', 'value': '#475569'},
            {'name': 'Deep Navy', 'value': '#0F172A'},
          ],
          onSelected: (color) => _updateTemplate(_template.copyWith(textColorHex: color)),
        ),
        const SizedBox(height: 14),
        Text('Table Header Background', style: context.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        _ColorSelector(
          selectedValue: _template.headerBgColorHex,
          palette: const [
            {'name': 'White (Default)', 'value': '#FFFFFF'},
            {'name': 'Light Blue', 'value': '#EFF6FF'},
            {'name': 'Light Teal', 'value': '#F0FDFA'},
            {'name': 'Soft Grey', 'value': '#F1F5F9'},
          ],
          onSelected: (color) => _updateTemplate(_template.copyWith(headerBgColorHex: color)),
        ),
      ],
    );
  }

  Widget _buildBordersSection() {
    return _CustomizerAccordion(
      title: 'Borders & Table Outlines',
      icon: Icons.border_outer_rounded,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Outer Table Border'),
            Switch(
              value: _template.showOuterBorder,
              onChanged: (val) => _updateTemplate(_template.copyWith(showOuterBorder: val)),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Inner Table Gridlines'),
            Switch(
              value: _template.showInnerBorders,
              onChanged: (val) => _updateTemplate(_template.copyWith(showInnerBorders: val)),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Expanded(child: Text('GAMCA Style Block Borders Only')),
            Switch(
              value: _template.blockBorderOnly,
              onChanged: (val) => _updateTemplate(_template.copyWith(blockBorderOnly: val)),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text('Border Thickness: ${_template.borderWidth.toStringAsFixed(1)} pt', style: context.textTheme.labelMedium),
        Slider(
          value: _template.borderWidth,
          min: 0.1,
          max: 2.0,
          divisions: 19,
          label: _template.borderWidth.toStringAsFixed(1),
          onChanged: (val) => _updateTemplate(_template.copyWith(borderWidth: val)),
        ),
        const SizedBox(height: 10),
        Text('Border Color', style: context.textTheme.labelMedium?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        _ColorSelector(
          selectedValue: _template.borderColorHex,
          palette: const [
            {'name': 'Black (Default)', 'value': '#000000'},
            {'name': 'Grey', 'value': '#94A3B8'},
            {'name': 'Soft Blue-Grey', 'value': '#64748B'},
            {'name': 'Matching Primary', 'value': 'PRIMARY_MATCH'},
          ],
          onSelected: (color) {
            final targetColor = color == 'PRIMARY_MATCH' ? _template.primaryColorHex : color;
            _updateTemplate(_template.copyWith(borderColorHex: targetColor));
          },
        ),
      ],
    );
  }

  Widget _buildTypographySection() {
    return _CustomizerAccordion(
      title: 'Typography & Spacings',
      icon: Icons.format_size_rounded,
      children: [
        Text('Clinic Title Font Size: ${_template.headerFontSize.toStringAsFixed(0)} pt', style: context.textTheme.bodyMedium),
        Slider(
          value: _template.headerFontSize,
          min: 12.0,
          max: 26.0,
          divisions: 14,
          onChanged: (val) => _updateTemplate(_template.copyWith(headerFontSize: val)),
        ),
        Text('Report Header Title Size: ${_template.titleFontSize.toStringAsFixed(0)} pt', style: context.textTheme.bodyMedium),
        Slider(
          value: _template.titleFontSize,
          min: 7.0,
          max: 14.0,
          divisions: 7,
          onChanged: (val) => _updateTemplate(_template.copyWith(titleFontSize: val)),
        ),
        Text('Details / Body Font Size: ${_template.bodyFontSize.toStringAsFixed(1)} pt', style: context.textTheme.bodyMedium),
        Slider(
          value: _template.bodyFontSize,
          min: 5.0,
          max: 10.0,
          divisions: 10,
          onChanged: (val) => _updateTemplate(_template.copyWith(bodyFontSize: val)),
        ),
        Text('Table Results Font Size: ${_template.tableBodyFontSize.toStringAsFixed(1)} pt', style: context.textTheme.bodyMedium),
        Slider(
          value: _template.tableBodyFontSize,
          min: 5.0,
          max: 9.0,
          divisions: 8,
          onChanged: (val) => _updateTemplate(_template.copyWith(tableBodyFontSize: val, tableHeaderFontSize: val)),
        ),
        Text('Section Spacing (Margins): ${_template.sectionSpacing.toStringAsFixed(0)} pt', style: context.textTheme.bodyMedium),
        Slider(
          value: _template.sectionSpacing,
          min: 1.0,
          max: 12.0,
          divisions: 11,
          onChanged: (val) => _updateTemplate(_template.copyWith(sectionSpacing: val)),
        ),
      ],
    );
  }

  Widget _buildSectionOrderSection() {
    return _CustomizerAccordion(
      title: 'Major Section Order (Vertical)',
      icon: Icons.swap_vert_rounded,
      children: [
        Text(
          'Reorder layout sections vertically on the page:',
          style: context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: context.colorScheme.outline),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: _template.sectionOrder.asMap().entries.map((e) {
              final idx = e.key;
              final name = e.value;
              final displayTitle = name == 'header'
                  ? 'Clinic Header Letterhead'
                  : name == 'info'
                      ? 'Candidate Information Table'
                      : name == 'table'
                          ? 'Medical & Lab Clinical Tables'
                          : 'Doctor Sign-off / Footer';

              return Container(
                decoration: BoxDecoration(
                  border: Border(bottom: idx == _template.sectionOrder.length - 1 ? BorderSide.none : BorderSide(color: context.colorScheme.outline)),
                ),
                child: ListTile(
                  dense: true,
                  title: Text(displayTitle, style: const TextStyle(fontWeight: FontWeight.bold)),
                  leading: CircleAvatar(radius: 10, child: Text('${idx + 1}', style: const TextStyle(fontSize: 10))),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (idx > 0)
                        IconButton(
                          icon: const Icon(Icons.arrow_upward_rounded, size: 16),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          onPressed: () {
                            final list = List<String>.from(_template.sectionOrder);
                            final temp = list[idx];
                            list[idx] = list[idx - 1];
                            list[idx - 1] = temp;
                            _updateTemplate(_template.copyWith(sectionOrder: list));
                          },
                        ),
                      if (idx < _template.sectionOrder.length - 1) ...[
                        const SizedBox(width: 8),
                        IconButton(
                          icon: const Icon(Icons.arrow_downward_rounded, size: 16),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          onPressed: () {
                            final list = List<String>.from(_template.sectionOrder);
                            final temp = list[idx];
                            list[idx] = list[idx + 1];
                            list[idx + 1] = temp;
                            _updateTemplate(_template.copyWith(sectionOrder: list));
                          },
                        ),
                      ],
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildTableColumnsSection() {
    final w = _template.columnWidths;
    final totalSum = w[0] + w[1] + w[2] + w[3];
    final leftFlex = w[0] + w[1];
    final rightFlex = w[2] + w[3];
    final ratio = leftFlex / totalSum;

    final isDark = context.isDark;
    final cardBg = isDark ? const Color(0xFF0F172A) : Colors.grey.shade100;

    const double pageHeight = 180.0;
    const double pageWidth = 280.0;
    const double tableWidth = pageWidth - 40.0;

    final double splitterPosX = 20.0 + (ratio * tableWidth);

    return _CustomizerAccordion(
      title: 'Interactive Grid Splitter & Spacing',
      icon: Icons.grid_on_rounded,
      children: [
        Text(
          'Drag the vertical handle to size columns, or drag the horizontal line to adjust section spacing:',
          style: context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant),
        ),
        const SizedBox(height: 14),
        Center(
          child: Container(
            width: pageWidth,
            height: pageHeight,
            decoration: BoxDecoration(
              color: cardBg,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: context.colorScheme.outline.withOpacity(0.5)),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Column(
                    children: [
                      Container(
                        height: 18,
                        decoration: BoxDecoration(
                          color: context.colorScheme.primary.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Center(
                          child: Container(width: 60, height: 4, color: context.colorScheme.primary.withOpacity(0.4)),
                        ),
                      ),
                      SizedBox(height: _template.sectionSpacing),
                      Container(
                        height: 22,
                        decoration: BoxDecoration(
                          border: Border.all(color: context.colorScheme.outline),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Row(
                          children: [
                            Expanded(child: Container(margin: const EdgeInsets.all(3), color: context.colorScheme.outline.withOpacity(0.2))),
                            Container(width: 1, color: context.colorScheme.outline),
                            Expanded(child: Container(margin: const EdgeInsets.all(3), color: context.colorScheme.outline.withOpacity(0.2))),
                          ],
                        ),
                      ),
                      SizedBox(height: _template.sectionSpacing),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: context.colorScheme.outline),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Stack(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: (leftFlex * 10).toInt(),
                                    child: Container(color: context.colorScheme.primary.withOpacity(0.03)),
                                  ),
                                  Container(width: 1, color: context.colorScheme.outline),
                                  Expanded(
                                    flex: (rightFlex * 10).toInt(),
                                    child: Container(color: context.colorScheme.primary.withOpacity(0.03)),
                                  ),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: List.generate(4, (i) => Container(height: 1, color: context.colorScheme.outline.withOpacity(0.3))),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: _template.sectionSpacing),
                      Container(
                        height: 20,
                        decoration: BoxDecoration(
                          color: context.colorScheme.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(width: 50, height: 4, margin: const EdgeInsets.only(right: 8), color: context.colorScheme.primary.withOpacity(0.4)),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: splitterPosX - 8.0,
                  top: 50,
                  bottom: 40,
                  child: MouseRegion(
                    cursor: SystemMouseCursors.resizeLeftRight,
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onHorizontalDragUpdate: (details) {
                        final double currentPosX = splitterPosX;
                        final double newPosX = (currentPosX + details.delta.dx).clamp(20.0 + (0.25 * tableWidth), 20.0 + (0.75 * tableWidth));
                        final double newRatio = (newPosX - 20.0) / tableWidth;
                        
                        final double leftHalf = newRatio * totalSum;
                        final double rightHalf = (1.0 - newRatio) * totalSum;

                        final r0 = w[0] / (w[0] + w[1]);
                        final r1 = w[1] / (w[0] + w[1]);
                        final newWidth0 = r0 * leftHalf;
                        final newWidth1 = r1 * leftHalf;

                        final r2 = w[2] / (w[2] + w[3]);
                        final r3 = w[3] / (w[2] + w[3]);
                        final newWidth2 = r2 * rightHalf;
                        final newWidth3 = r3 * rightHalf;

                        _updateTemplate(_template.copyWith(columnWidths: [newWidth0, newWidth1, newWidth2, newWidth3]));
                      },
                      child: Container(
                        width: 16,
                        color: Colors.transparent,
                        child: Center(
                          child: Container(
                            width: 3,
                            decoration: BoxDecoration(
                              color: context.colorScheme.primary,
                              boxShadow: [
                                BoxShadow(
                                  color: context.colorScheme.primary.withOpacity(0.5),
                                  blurRadius: 4,
                                  spreadRadius: 1,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  right: 20,
                  top: 30,
                  height: 22,
                  child: MouseRegion(
                    cursor: SystemMouseCursors.resizeUpDown,
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onVerticalDragUpdate: (details) {
                        final double newSpacing = (_template.sectionSpacing + details.delta.dy * 0.15).clamp(1.0, 15.0);
                        _updateTemplate(_template.copyWith(sectionSpacing: newSpacing));
                      },
                      child: Container(
                        color: Colors.transparent,
                        child: Center(
                          child: Container(
                            height: 1,
                            color: context.colorScheme.primary.withOpacity(0.2),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 14),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Left: ${(w[0]+w[1]).toStringAsFixed(1)}', style: context.textTheme.labelMedium),
            Text('Spacing: ${_template.sectionSpacing.toStringAsFixed(1)} pt', style: context.textTheme.labelMedium),
            Text('Right: ${(w[2]+w[3]).toStringAsFixed(1)}', style: context.textTheme.labelMedium),
          ],
        ),
      ],
    );
  }

  Widget _buildClinicalBlocksSection() {
    final blockLabels = {
      'eye_ear_urine': 'Eye & Ear Exam / Urine Profile',
      'systemic_stool': 'Systemic (CVS, Lungs) / Stool Profile',
      'gastro_blood': 'Gastro Abdomen / Blood & Hemogram',
      'other_serology': 'Hernia & Veins / Renal & Glucose',
      'extremities_lipid': 'Extremities & Skin / Lipid Profile',
      'hernia_elisa': 'Genitals / Serology & ELISA Profile',
    };

    return _CustomizerAccordion(
      title: 'Clinical Blocks Order (Vertical)',
      icon: Icons.low_priority_rounded,
      children: [
        Text(
          'Reorder clinical blocks inside the main tables:',
          style: context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: context.colorScheme.outline),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: _template.blockOrder.asMap().entries.map((e) {
              final idx = e.key;
              final name = e.value;
              final displayTitle = blockLabels[name] ?? name;

              return Container(
                decoration: BoxDecoration(
                  border: Border(bottom: idx == _template.blockOrder.length - 1 ? BorderSide.none : BorderSide(color: context.colorScheme.outline)),
                ),
                child: ListTile(
                  dense: true,
                  title: Text(displayTitle, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 11.5)),
                  leading: CircleAvatar(radius: 10, child: Text('${idx + 1}', style: const TextStyle(fontSize: 9))),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (idx > 0)
                        IconButton(
                          icon: const Icon(Icons.arrow_upward_rounded, size: 14),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          onPressed: () {
                            final list = List<String>.from(_template.blockOrder);
                            final temp = list[idx];
                            list[idx] = list[idx - 1];
                            list[idx - 1] = temp;
                            _updateTemplate(_template.copyWith(blockOrder: list));
                          },
                        ),
                      if (idx < _template.blockOrder.length - 1) ...[
                        const SizedBox(width: 6),
                        IconButton(
                          icon: const Icon(Icons.arrow_downward_rounded, size: 14),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          onPressed: () {
                            final list = List<String>.from(_template.blockOrder);
                            final temp = list[idx];
                            list[idx] = list[idx + 1];
                            list[idx + 1] = temp;
                            _updateTemplate(_template.copyWith(blockOrder: list));
                          },
                        ),
                      ],
                    ],
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

class BorderBorderSideOnly extends TableBorder {
  final ReportTemplate t;
  final BorderSide borderSide;
  const BorderBorderSideOnly({
    required this.t,
    required this.borderSide,
  });

  @override
  BorderSide get left => t.showOuterBorder ? const BorderSide(color: Colors.black) : BorderSide.none;
  @override
  BorderSide get right => t.showOuterBorder ? const BorderSide(color: Colors.black) : BorderSide.none;
  @override
  BorderSide get top => t.showOuterBorder ? const BorderSide(color: Colors.black) : BorderSide.none;
  @override
  BorderSide get bottom => BorderSide.none;
  @override
  BorderSide get verticalInside => borderSide;
  @override
  BorderSide get horizontalInside => BorderSide.none;
}

class _CustomizerAccordion extends StatelessWidget {
  final String title;
  final IconData icon;
  final List<Widget> children;

  const _CustomizerAccordion({
    required this.title,
    required this.icon,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.isDark ? context.colorScheme.surfaceContainerHighest.withOpacity(0.1) : Colors.grey.shade50,
        border: Border.all(color: context.colorScheme.outline.withOpacity(0.7)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Material(
        color: Colors.transparent,
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(10),
        child: Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            initiallyExpanded: title.startsWith('Clinic') || title.startsWith('Theme'),
            title: Text(title, style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
            leading: Icon(icon, color: context.colorScheme.primary, size: 20),
            expandedAlignment: Alignment.topLeft,
            childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            children: children,
          ),
        ),
      ),
    );
  }
}

class _ColorSelector extends StatelessWidget {
  final String selectedValue;
  final List<Map<String, String>> palette;
  final ValueChanged<String> onSelected;

  const _ColorSelector({
    required this.selectedValue,
    required this.palette,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: palette.map((color) {
        final hexValue = color['value']!;
        final name = color['name']!;
        final isSelected = selectedValue.toUpperCase() == hexValue.toUpperCase();

        Color displayColor;
        if (hexValue == 'PRIMARY_MATCH') {
          displayColor = Colors.transparent;
        } else {
          displayColor = Color(int.parse('FF${hexValue.replaceAll("#", "")}', radix: 16));
        }

        return Tooltip(
          message: name,
          child: GestureDetector(
            onTap: () => onSelected(hexValue),
            child: Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: displayColor,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? context.colorScheme.primary
                      : context.colorScheme.outline,
                  width: isSelected ? 3.0 : 1.0,
                ),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: context.colorScheme.primary.withOpacity(0.4),
                          blurRadius: 6,
                          spreadRadius: 1,
                        )
                      ]
                    : null,
              ),
              child: isSelected
                  ? Icon(
                      Icons.check,
                      color: displayColor.computeLuminance() > 0.6 ? Colors.black : Colors.white,
                      size: 14,
                    )
                  : hexValue == 'PRIMARY_MATCH'
                      ? Center(child: Icon(Icons.link, color: context.colorScheme.onSurfaceVariant, size: 16))
                      : null,
            ),
          ),
        );
      }).toList(),
    );
  }
}

class _EditableText extends StatefulWidget {
  final String text;
  final TextStyle style;
  final ValueChanged<String> onChanged;
  final bool isCenter;

  const _EditableText({
    required this.text,
    required this.style,
    required this.onChanged,
    this.isCenter = false,
  });

  @override
  _EditableTextState createState() => _EditableTextState();
}

class _EditableTextState extends State<_EditableText> {
  bool _isEditing = false;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.text);
  }

  @override
  void didUpdateWidget(_EditableText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text) {
      _controller.text = widget.text;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_isEditing) {
      return IntrinsicWidth(
        child: TextField(
          controller: _controller,
          style: widget.style.copyWith(color: Colors.black),
          textAlign: widget.isCenter ? TextAlign.center : TextAlign.start,
          autofocus: true,
          decoration: const InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
            isDense: true,
            border: OutlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
          ),
          onSubmitted: (val) {
            setState(() => _isEditing = false);
            widget.onChanged(val);
          },
          onTapOutside: (_) {
            setState(() => _isEditing = false);
            widget.onChanged(_controller.text);
          },
        ),
      );
    }

    return GestureDetector(
      onDoubleTap: () => setState(() => _isEditing = true),
      child: Tooltip(
        message: 'Double-click to edit text inline',
        child: Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.transparent),
          ),
          child: Text(
            widget.text,
            style: widget.style,
            textAlign: widget.isCenter ? TextAlign.center : TextAlign.start,
          ),
        ),
      ),
    );
  }
}
