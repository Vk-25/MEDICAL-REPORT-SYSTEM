import 'dart:io';
import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../core/models.dart';
import '../core/utils.dart';

class PdfService {
  PdfColor _parseColor(String? hex, PdfColor defaultValue) {
    if (hex == null || hex.isEmpty) return defaultValue;
    try {
      final cleanHex = hex.replaceAll('#', '');
      if (cleanHex.length == 6) {
        return PdfColor.fromInt(int.parse('FF$cleanHex', radix: 16));
      } else if (cleanHex.length == 8) {
        return PdfColor.fromInt(int.parse(cleanHex, radix: 16));
      }
    } catch (_) {}
    return defaultValue;
  }

  pw.TableBorder _getTableBorder(ReportTemplate t, int rowIndex, int totalRows) {
    final borderColor = _parseColor(t.borderColorHex, PdfColors.black);
    final borderWidth = t.borderWidth;

    return pw.TableBorder(
      left: t.showOuterBorder ? pw.BorderSide(width: borderWidth, color: borderColor) : pw.BorderSide.none,
      right: t.showOuterBorder ? pw.BorderSide(width: borderWidth, color: borderColor) : pw.BorderSide.none,
      top: (rowIndex == 0 && t.showOuterBorder) ? pw.BorderSide(width: borderWidth, color: borderColor) : pw.BorderSide.none,
      bottom: (rowIndex == totalRows - 1 && t.showOuterBorder) ? pw.BorderSide(width: borderWidth, color: borderColor) : pw.BorderSide.none,
      verticalInside: t.showInnerBorders ? pw.BorderSide(width: borderWidth, color: borderColor) : pw.BorderSide.none,
      horizontalInside: pw.BorderSide.none,
    );
  }

  pw.TableBorder _getInfoTableBorder(ReportTemplate t) {
    final borderColor = _parseColor(t.borderColorHex, PdfColors.black);
    final borderWidth = t.borderWidth;

    return pw.TableBorder(
      left: t.showOuterBorder ? pw.BorderSide(width: borderWidth, color: borderColor) : pw.BorderSide.none,
      right: t.showOuterBorder ? pw.BorderSide(width: borderWidth, color: borderColor) : pw.BorderSide.none,
      top: t.showOuterBorder ? pw.BorderSide(width: borderWidth, color: borderColor) : pw.BorderSide.none,
      bottom: t.showOuterBorder ? pw.BorderSide(width: borderWidth, color: borderColor) : pw.BorderSide.none,
      verticalInside: t.showInnerBorders ? pw.BorderSide(width: borderWidth, color: borderColor) : pw.BorderSide.none,
      horizontalInside: t.showInnerBorders ? pw.BorderSide(width: borderWidth, color: borderColor) : pw.BorderSide.none,
    );
  }

  Future<Uint8List> generateGamcaReport(Report report, Clinic? clinic, Doctor? doctor, {ReportTemplate? template}) async {
    final pdf = pw.Document();
    final patient = report.patientInfo;
    final exam = report.medicalExam;
    final lab = report.labInvestigation;

    final t = template ?? ReportTemplate(
      id: '0',
      name: 'Standard',
      layoutType: ReportLayoutType.standard,
      headerTitle: 'MEDICAL REPORT',
      clinicName: clinic?.name ?? 'SHANTI CLINIC',
      clinicAddress: clinic?.address ?? '',
      clinicPhone: clinic?.phone ?? '',
      isDefault: true,
      createdAt: DateTime.now(),
    );

    pw.ImageProvider? doctorSig;
    if (doctor?.signaturePath != null && File(doctor!.signaturePath!).existsSync()) {
      try {
        final sigBytes = await File(doctor.signaturePath!).readAsBytes();
        doctorSig = pw.MemoryImage(sigBytes);
      } catch (_) {
        doctorSig = null;
      }
    }

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        build: (pw.Context context) {
          final sections = <pw.Widget>[];
          for (final sectionName in t.sectionOrder) {
            if (sectionName == 'header') {
              sections.add(_buildHeader(clinic, t));
            } else if (sectionName == 'info') {
              sections.add(_buildReportInfo(report, patient, t));
            } else if (sectionName == 'table') {
              sections.add(_buildMainTable(exam, lab, t));
            } else if (sectionName == 'footer') {
              sections.add(_buildFooter(doctor, doctorSig, t));
            }
            sections.add(pw.SizedBox(height: t.sectionSpacing));
          }
          if (sections.isNotEmpty) {
            sections.removeLast(); // remove last spacing
          }

          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: sections,
          );
        },
      ),
    );

    return pdf.save();
  }

  pw.Widget _buildHeader(Clinic? clinic, ReportTemplate t) {
    final primaryColor = _parseColor(t.primaryColorHex, PdfColor.fromHex('#0F766E'));
    final textColor = _parseColor(t.textColorHex, PdfColors.black);

    return pw.Column(
      children: [
        pw.Row(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Expanded(flex: 1, child: pw.Container()),
            pw.Expanded(
              flex: 3,
              child: pw.Column(
                children: [
                  pw.Text(
                    t.clinicName.isNotEmpty ? t.clinicName.toUpperCase() : 'SHANTI CLINIC',
                    style: pw.TextStyle(fontSize: t.headerFontSize, fontWeight: pw.FontWeight.bold, color: primaryColor),
                  ),
                  pw.Text(
                    t.getLabel('clinic_sub_1', 'OCCUPATIONAL HEALTH CENTER'),
                    style: pw.TextStyle(fontSize: t.bodyFontSize + 1.5, fontWeight: pw.FontWeight.bold, color: textColor),
                  ),
                  pw.Text(
                    t.getLabel('clinic_sub_2', '(A UNIT OF SHANTI CHARITABLE TRUST)'),
                    style: pw.TextStyle(fontSize: t.bodyFontSize + 0.5, fontWeight: pw.FontWeight.bold, color: textColor),
                  ),
                ],
              ),
            ),
            pw.Expanded(
              flex: 1,
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text(t.getLabel('reg_no_1', 'Reg. No. - 11453'), style: pw.TextStyle(fontSize: t.bodyFontSize - 0.5, color: textColor)),
                  pw.Text(t.getLabel('reg_no_2', 'Reg. No. - B-27/879'), style: pw.TextStyle(fontSize: t.bodyFontSize - 0.5, color: textColor)),
                  pw.Text(t.getLabel('trust_no', 'Trus No : F/3162/Vadodara'), style: pw.TextStyle(fontSize: t.bodyFontSize - 0.5, color: textColor)),
                  pw.Text(t.getLabel('reg_no_vadodara', 'Reg. No : Guj/3477/Vadodara'), style: pw.TextStyle(fontSize: t.bodyFontSize - 0.5, color: textColor)),
                  if (t.clinicPhone.isNotEmpty)
                    pw.Text(t.getLabel('clinic_phone', 'Mob. : ${t.clinicPhone}'), style: pw.TextStyle(fontSize: t.bodyFontSize - 0.5, color: textColor))
                  else
                    pw.Text(t.getLabel('clinic_phone', 'Mob. : 9327680307'), style: pw.TextStyle(fontSize: t.bodyFontSize - 0.5, color: textColor)),
                ],
              ),
            ),
          ],
        ),
        pw.SizedBox(height: 1),
        pw.Center(
          child: pw.Text(
            t.getLabel('doctor_name', 'Dr. Abdhesh J Mhto'),
            style: pw.TextStyle(fontSize: t.bodyFontSize + 1.5, fontWeight: pw.FontWeight.bold, color: textColor),
          ),
        ),
        pw.Center(
          child: pw.Text(
            t.getLabel('doc_quals_1', '(M.B.B.S., M.D., (H&H Megnt.), M.B.A. P.G.C.I.H.(Ind. Health))'),
            style: pw.TextStyle(fontSize: t.bodyFontSize - 0.5, color: textColor),
          ),
        ),
        pw.Center(
          child: pw.Text(
            t.getLabel('doc_quals_2', 'A.F.I.H. (Ind. Health), M.R.S.H (LONDON), F.R.H.S (UK)'),
            style: pw.TextStyle(fontSize: t.bodyFontSize - 0.5, color: textColor),
          ),
        ),
        pw.Center(
          child: pw.Text(
            t.getLabel('doc_quals_3', 'Consultants Occupational Health Physician & Diabetology'),
            style: pw.TextStyle(fontSize: t.bodyFontSize - 0.5, color: textColor),
          ),
        ),
        pw.Center(
          child: pw.Text(
            t.getLabel('doc_quals_4', 'T.B., Typhoid, B.P., Diabetic, Malaria, Asthma, Chest infection, Sexual Disease Specialist'),
            style: pw.TextStyle(fontSize: t.bodyFontSize - 0.5, color: textColor),
          ),
        ),
        pw.Center(
          child: pw.Text(
            t.clinicAddress.isNotEmpty ? t.clinicAddress : 'F/102, Jalanand Township, Panchvati Refinery Road, Gorwa, Vadodara - 390 016 Gujarat.',
            style: pw.TextStyle(fontSize: t.bodyFontSize - 0.5, color: textColor),
          ),
        ),
        pw.Center(
          child: pw.Text(
            t.getLabel('email_id', 'E-mail ID :- shanticlinicohc26@gmail.com, dr.abdhesh.mahto@gmail.com'),
            style: pw.TextStyle(fontSize: t.bodyFontSize - 0.5, color: textColor),
          ),
        ),
        pw.SizedBox(height: 3),
        pw.Container(
          width: double.infinity,
          padding: const pw.EdgeInsets.symmetric(vertical: 1.5),
          decoration: pw.BoxDecoration(
            border: t.showOuterBorder ? pw.Border.all(width: t.borderWidth, color: _parseColor(t.borderColorHex, PdfColors.black)) : null,
            color: _parseColor(t.headerBgColorHex, PdfColors.white),
          ),
          child: pw.Center(
            child: pw.Text(
              t.headerTitle.isNotEmpty ? t.headerTitle : 'MEDICAL REPORT',
              style: pw.TextStyle(fontSize: t.titleFontSize, fontWeight: pw.FontWeight.bold, color: textColor),
            ),
          ),
        ),
      ],
    );
  }

  pw.Widget _buildReportInfo(Report report, PatientInfo patient, ReportTemplate t) {
    final textColor = _parseColor(t.textColorHex, PdfColors.black);
    final labelFont = pw.TextStyle(fontSize: t.bodyFontSize, color: textColor);
    final valueFont = pw.TextStyle(fontSize: t.bodyFontSize, fontWeight: pw.FontWeight.bold, color: textColor);

    return pw.Table(
      border: _getInfoTableBorder(t),
      columnWidths: const {
        0: pw.FlexColumnWidth(1),
        1: pw.FlexColumnWidth(1),
      },
      children: [
        pw.TableRow(children: [
          pw.Padding(
            padding: const pw.EdgeInsets.all(2),
            child: pw.Text('Exam Date :- ${report.examDate.toDisplayDate()}', style: valueFont),
          ),
          pw.Padding(
            padding: const pw.EdgeInsets.all(2),
            child: pw.Text(t.getLabel('serial_no_full', 'Serial Number :- ${report.serialNumber}'), style: valueFont),
          ),
        ]),
        pw.TableRow(children: [
          pw.Padding(
            padding: const pw.EdgeInsets.all(2),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                _infoRow('Name', patient.name ?? 'MAKWANA VIKASHKUMAR RAJESHBHAI', labelFont, valueFont),
                _infoRow('Height', '${patient.height != null ? patient.height!.toStringAsFixed(0) : "165"} Cm', labelFont, valueFont),
                _infoRow('Weight', '${patient.weight != null ? patient.weight!.toStringAsFixed(0) : "74"} Kg', labelFont, valueFont),
                _infoRow('Age', '${patient.age ?? "36"} Years', labelFont, valueFont),
                _infoRow('Blood Group', patient.bloodGroup ?? 'B (+) Positive', labelFont, valueFont),
              ],
            ),
          ),
          pw.Padding(
            padding: const pw.EdgeInsets.all(2),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                _infoRow('Passport No', patient.passportNumber ?? 'W 9144648', labelFont, valueFont),
                _infoRow('Date of Issue', patient.issueDate?.toDisplayDate() ?? '26.12.2022', labelFont, valueFont),
                _infoRow('Place of Issue', patient.placeOfIssue ?? 'Ahmedabad, Gujarat', labelFont, valueFont),
                _infoRow('Nationality', patient.nationality ?? 'Indian', labelFont, valueFont),
                _infoRow('Position applied for', patient.position ?? 'General Fitter ( Mechanical )', labelFont, valueFont),
                _infoRow('Visa No', patient.visaNumber ?? '', labelFont, valueFont),
              ],
            ),
          ),
        ]),
      ],
    );
  }

  pw.Widget _infoRow(String label, String value, pw.TextStyle labelStyle, pw.TextStyle valueStyle) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 0.2),
      child: pw.Row(
        children: [
          pw.SizedBox(
            width: 80,
            child: pw.Text(label, style: labelStyle),
          ),
          pw.Expanded(
            child: pw.Text(
              value,
              style: valueStyle,
            ),
          ),
        ],
      ),
    );
  }

  pw.Widget _buildMainTable(MedicalExam exam, LabInvestigation lab, ReportTemplate t) {
    final borderColor = _parseColor(t.borderColorHex, PdfColors.black);
    final primaryColor = _parseColor(t.primaryColorHex, PdfColor.fromHex('#0F766E'));
    final textColor = _parseColor(t.textColorHex, PdfColors.black);
    final tableHeaderFont = pw.TextStyle(fontSize: t.tableHeaderFontSize, fontWeight: pw.FontWeight.bold, color: textColor);
    final tableBodyFont = pw.TextStyle(fontSize: t.tableBodyFontSize, color: textColor);

    final blockItems = {
      'eye_ear_urine': {
        'left': [
          MapEntry(t.getLabel('eye_title', 'EYE'), ''),
          MapEntry(t.getLabel('eye_right_label', '  R. EYE'), exam.eyeRight ?? 'NORMAL'),
          MapEntry(t.getLabel('eye_left_label', '  L. EYE'), exam.eyeLeft ?? 'NORMAL'),
          MapEntry(t.getLabel('ear_title', 'EAR'), ''),
          MapEntry(t.getLabel('ear_right_label', '  R. EAR'), exam.earRight ?? 'NAD'),
          MapEntry(t.getLabel('ear_left_label', '  L. EAR'), exam.earLeft ?? 'NAD'),
        ],
        'right': [
          MapEntry(t.getLabel('urine_title', 'URINE'), ''),
          MapEntry(t.getLabel('urine_sugar_label', '  SUGAR'), lab.urineSugar ?? 'ABSENT'),
          MapEntry(t.getLabel('urine_albumin_label', '  ALBUMIN'), lab.urineAlbumin ?? 'ABSENT'),
          MapEntry(t.getLabel('urine_bilharziasis_label', '  BILHARZIASIS IF ENDEMIC'), lab.urineBilharziasis ?? 'ABSENT'),
        ]
      },
      'systemic_stool': {
        'left': [
          MapEntry(t.getLabel('systemic_title', 'SYSTEMIC EXAM'), ''),
          MapEntry(t.getLabel('sys_cvs_label', '  CARDIO-VASCULAR'), exam.cardiovascular ?? 'NAD'),
          MapEntry(t.getLabel('sys_bp_label', '  B. P.'), exam.bloodPressure ?? '130/82 mmHg'),
          MapEntry(t.getLabel('sys_heart_label', '  HEART'), exam.heart ?? 'NAD'),
          MapEntry(t.getLabel('resp_title', 'RESPIRATORY SYSTEM'), ''),
          MapEntry(t.getLabel('resp_lungs_label', '  LUNGS-CHEST X-RAY'), exam.chestXRay ?? 'CLEAR'),
          MapEntry(t.getLabel('resp_tb_label', '  TUBERCULOSIS'), exam.tuberculosis ?? 'ABSENT'),
        ],
        'right': [
          MapEntry(t.getLabel('stool_title', 'STOOL          ROUTINE'), ''),
          MapEntry(t.getLabel('stool_ova_label', '1. OVA'), lab.stoolOva ?? 'NIL'),
          MapEntry(t.getLabel('stool_cyst_label', '2. CYST'), lab.stoolCyst ?? 'NIL'),
          MapEntry(t.getLabel('stool_blood_label', '3. BLOOD'), lab.stoolBlood ?? 'ABSENT'),
          MapEntry(t.getLabel('stool_helm_label', '4. HELMINTHES'), lab.stoolHelminthes ?? 'NIL'),
          MapEntry(t.getLabel('stool_giardia_label', '5. GIARDIA%'), lab.stoolGiardia ?? '0'),
          MapEntry(t.getLabel('stool_bilh_label', '6. BILHARZIASIS (IF ENDEMIC) CULT'), lab.stoolBilharziasis ?? 'NIL'),
          MapEntry(t.getLabel('stool_salm_label', '7. SALMONELLA'), lab.stoolSalmonella ?? 'NIL'),
          MapEntry(t.getLabel('stool_shig_label', '  SHIGELLA'), lab.stoolShigella ?? '0'),
          MapEntry(t.getLabel('stool_chol_label', '  V CHOLERA (IF ENDEMIC)'), lab.stoolCholera ?? '0'),
        ]
      },
      'gastro_blood': {
        'left': [
          MapEntry(t.getLabel('gastro_title', 'GASTRO INTESTINAL'), ''),
          MapEntry(t.getLabel('gastro_abd_label', '  ABDOMEN'), exam.abdomen ?? 'NAD'),
        ],
        'right': [
          MapEntry(t.getLabel('blood_title', 'BLOOD'), ''),
          MapEntry(t.getLabel('blood_hb_label', '  HEMOGLOBIN'), lab.bloodHemoglobin?.toString() ?? '15.5'),
          MapEntry(t.getLabel('blood_tlc_label', '  1. TLC'), lab.bloodTlc?.toString() ?? '9430'),
          MapEntry(t.getLabel('blood_wbc_label', '  2. W B C'), lab.bloodWbc?.toString() ?? '50 / 54 / 01 / 01 / 000'),
          MapEntry(t.getLabel('blood_esr_label', '  3. E S R'), lab.bloodEsr?.toString() ?? '10'),
          MapEntry(t.getLabel('blood_sgpt_label', '  4. S G P T'), lab.bloodSgpt?.toString() ?? '38'),
          MapEntry(t.getLabel('blood_urea_label', '  5. BLOOD UREA'), lab.bloodUrea?.toString() ?? '36'),
          MapEntry(t.getLabel('blood_uric_label', '  6. S-URICACID'), lab.bloodUricAcid?.toString() ?? '4.5'),
          MapEntry(t.getLabel('blood_thick_title', '  THICK FILM FOR'), ''),
          MapEntry(t.getLabel('blood_malaria_label', '  1. MALARIA'), lab.bloodMalaria ?? 'NIL'),
          MapEntry(t.getLabel('blood_filaria_label', '  2. MICRO FILARIA'), lab.bloodMicroFilaria ?? 'NIL'),
        ]
      },
      'other_serology': {
        'left': [
          MapEntry(t.getLabel('other_title', 'OTHER'), ''),
          MapEntry(t.getLabel('other_hernia_label', '  HERNIA'), exam.hernia ?? 'NIL'),
          MapEntry(t.getLabel('other_veins_label', '  VARICOSE VEINS'), exam.varicoseVeins ?? 'NIL'),
        ],
        'right': [
          MapEntry(t.getLabel('serology_title', 'SEROLOGY'), ''),
          MapEntry(t.getLabel('serology_pp2bs_label', '  1. PP 2 BS'), lab.serologyPp2bs?.toString() ?? '97%'),
          MapEntry(t.getLabel('serology_fbs_label', '  2. F. B. S.'), lab.serologyFbs?.toString() ?? '86%'),
          MapEntry(t.getLabel('serology_lft_label', '  3. L. F. T.'), lab.serologyLft ?? 'NORMAL'),
          MapEntry(t.getLabel('serology_creat_label', '  4. CREATINE'), lab.serologyCreatinine?.toString() ?? '1.020mg%'),
          MapEntry(t.getLabel('serology_plat_label', '  5. PLATELET COUNT'), lab.serologyPlateletCount?.toString() ?? '2,99,410'),
        ]
      },
      'extremities_lipid': {
        'left': [
          MapEntry(t.getLabel('ext_extremities_label', '  EXTREMITIES'), exam.extremities ?? 'NAD'),
          MapEntry(t.getLabel('ext_deform_label', '  DEFORMITIES'), exam.deformities ?? 'NAD'),
          MapEntry(t.getLabel('ext_skin_label', '  SKIN'), exam.skin ?? 'NAD'),
        ],
        'right': [
          MapEntry(t.getLabel('lipid_title', 'LIPID PROFILE'), ''),
          MapEntry(t.getLabel('lipid_cho_label', '  1. S-CHO'), lab.lipidCholesterol?.toString() ?? '89%'),
          MapEntry(t.getLabel('lipid_try_label', '  2. T R Y'), lab.lipidTry?.toString() ?? '164%'),
          MapEntry(t.getLabel('lipid_hdl_label', '  3. H D L'), lab.lipidHdl?.toString() ?? '72%'),
          MapEntry(t.getLabel('lipid_ldl_label', '  4. L D L'), lab.lipidLdl?.toString() ?? '165'),
          MapEntry(t.getLabel('lipid_g6pd_label', '  5. G6 PD'), lab.lipidG6pd ?? '12.60%'),
        ]
      },
      'hernia_elisa': {
        'left': [
          MapEntry(t.getLabel('hernia_title', 'HERNIAVENEREAL DISEASES'), ''),
          MapEntry(t.getLabel('hernia_clin_label', '  CLINICAL'), exam.clinicalRemarks ?? 'NIL'),
        ],
        'right': [
          MapEntry(t.getLabel('elisa_title', 'ELISA'), ''),
          MapEntry(t.getLabel('elisa_hiv_label', '  1. H.I.V. 1 & 2'), lab.elisaHiv ?? 'Negative'),
          MapEntry(t.getLabel('elisa_hbs_label', '  2. Hbs Ag%'), lab.elisaHbsAg ?? 'Non - Reacti'),
          MapEntry(t.getLabel('elisa_hcv_label', '  3. Anti HCV%'), lab.elisaAntiHcv ?? 'Non - Reacti'),
          MapEntry(t.getLabel('elisa_vdrl_label', '  V D R L'), lab.elisaVdrl ?? 'Negative'),
          MapEntry(t.getLabel('elisa_tpha_label', '  TPHA(IF VDRL TPH Wedal Test)'), lab.elisaTpha ?? 'Negative'),
        ]
      },
    };

    final rows = <pw.TableRow>[];

    pw.Widget buildCell(String text, pw.TextStyle style, bool alignCenter, bool hasBottomBorder, double paddingVal) {
      return pw.Container(
        decoration: pw.BoxDecoration(
          border: pw.Border(
            bottom: hasBottomBorder
                ? pw.BorderSide(width: t.borderWidth, color: borderColor)
                : pw.BorderSide.none,
          ),
        ),
        padding: pw.EdgeInsets.symmetric(horizontal: 4, vertical: paddingVal),
        alignment: alignCenter ? pw.Alignment.center : pw.Alignment.centerLeft,
        child: pw.Text(text, style: style),
      );
    }

    pw.Widget buildHeaderCell(String text, pw.TextStyle style) {
      return pw.Container(
        decoration: pw.BoxDecoration(
          color: _parseColor(t.headerBgColorHex, PdfColors.white),
          border: pw.Border(
            bottom: pw.BorderSide(width: t.borderWidth, color: borderColor),
          ),
        ),
        padding: const pw.EdgeInsets.symmetric(vertical: 2, horizontal: 3),
        alignment: pw.Alignment.center,
        child: pw.Text(text, style: style),
      );
    }

    rows.add(
      pw.TableRow(
        children: [
          buildHeaderCell(t.getLabel('sub_hdr_left_type', 'TYPE OF MEDICAL EXAMINATION'), tableHeaderFont),
          buildHeaderCell(t.getLabel('sub_hdr_left_res', 'RESULTS'), tableHeaderFont),
          buildHeaderCell(t.getLabel('sub_hdr_right_type', 'TYPE OF INVESTIGATIONS'), tableHeaderFont),
          buildHeaderCell(t.getLabel('sub_hdr_right_res', 'RESULTS'), tableHeaderFont),
        ],
      ),
    );

    for (final blockName in t.blockOrder) {
      final block = blockItems[blockName];
      if (block == null) continue;

      final leftItems = block['left'] ?? [];
      final rightItems = block['right'] ?? [];
      final maxLen = leftItems.length > rightItems.length ? leftItems.length : rightItems.length;
      final paddingVal = t.getBlockSpacing(blockName);

      for (int i = 0; i < maxLen; i++) {
        final left = i < leftItems.length ? leftItems[i] : const MapEntry('', '');
        final right = i < rightItems.length ? rightItems[i] : const MapEntry('', '');

        final isLeftBold = left.key.isNotEmpty && left.value.isEmpty;
        final isRightBold = right.key.isNotEmpty && right.value.isEmpty;

        final leftColor = isLeftBold ? primaryColor : textColor;
        final rightColor = isRightBold ? primaryColor : textColor;

        final bool isNextLeftHeader = (i + 1 < leftItems.length) &&
            leftItems[i + 1].key.isNotEmpty &&
            leftItems[i + 1].value.isEmpty;

        final bool isNextRightHeader = (i + 1 < rightItems.length) &&
            rightItems[i + 1].key.isNotEmpty &&
            rightItems[i + 1].value.isEmpty;

        final bool isLastRow = (i == maxLen - 1);
        final bool leftBorder = !t.blockBorderOnly ||
            isLeftBold ||
            isNextLeftHeader ||
            (i == leftItems.length - 1) ||
            isLastRow;

        final bool rightBorder = !t.blockBorderOnly ||
            isRightBold ||
            isNextRightHeader ||
            (i == rightItems.length - 1) ||
            isLastRow;

        rows.add(
          pw.TableRow(
            children: [
              buildCell(
                left.key,
                pw.TextStyle(
                  fontSize: t.tableBodyFontSize,
                  fontWeight: isLeftBold ? pw.FontWeight.bold : pw.FontWeight.normal,
                  color: leftColor,
                ),
                false,
                leftBorder,
                paddingVal,
              ),
              buildCell(
                left.value,
                tableBodyFont,
                true,
                leftBorder,
                paddingVal,
              ),
              buildCell(
                right.key,
                pw.TextStyle(
                  fontSize: t.tableBodyFontSize,
                  fontWeight: isRightBold ? pw.FontWeight.bold : pw.FontWeight.normal,
                  color: rightColor,
                ),
                false,
                rightBorder,
                paddingVal,
              ),
              buildCell(
                right.value,
                tableBodyFont,
                true,
                rightBorder,
                paddingVal,
              ),
            ],
          ),
        );
      }
    }

    final borderSide = t.showInnerBorders ? pw.BorderSide(width: t.borderWidth, color: borderColor) : pw.BorderSide.none;
    final totalRows = rows.length;

    pw.Widget buildRowTable(int rowIndex, pw.TableRow row, List<double> rowWidths) {
      return pw.Table(
        border: pw.TableBorder(
          left: t.showOuterBorder ? pw.BorderSide(width: t.borderWidth, color: borderColor) : pw.BorderSide.none,
          right: t.showOuterBorder ? pw.BorderSide(width: t.borderWidth, color: borderColor) : pw.BorderSide.none,
          top: (rowIndex == 0 && t.showOuterBorder) ? pw.BorderSide(width: t.borderWidth, color: borderColor) : pw.BorderSide.none,
          bottom: (rowIndex == totalRows - 1 && t.showOuterBorder) ? pw.BorderSide(width: t.borderWidth, color: borderColor) : pw.BorderSide.none,
          verticalInside: borderSide,
        ),
        columnWidths: {
          0: pw.FlexColumnWidth(rowWidths[0]),
          1: pw.FlexColumnWidth(rowWidths[1]),
          2: pw.FlexColumnWidth(rowWidths[2]),
          3: pw.FlexColumnWidth(rowWidths[3]),
        },
        children: [row],
      );
    }

    final bannerWidths = t.getRowWidths(0);
    final leftBannerFlex = bannerWidths[0] + bannerWidths[1];
    final rightBannerFlex = bannerWidths[2] + bannerWidths[3];

    return pw.Column(
      children: [
        pw.Table(
          border: pw.TableBorder(
            left: t.showOuterBorder ? pw.BorderSide(width: t.borderWidth, color: borderColor) : pw.BorderSide.none,
            right: t.showOuterBorder ? pw.BorderSide(width: t.borderWidth, color: borderColor) : pw.BorderSide.none,
            top: t.showOuterBorder ? pw.BorderSide(width: t.borderWidth, color: borderColor) : pw.BorderSide.none,
            verticalInside: borderSide,
          ),
          columnWidths: {
            0: pw.FlexColumnWidth(leftBannerFlex),
            1: pw.FlexColumnWidth(rightBannerFlex),
          },
          children: [
            pw.TableRow(
              children: [
                pw.Container(
                  color: _parseColor(t.headerBgColorHex, PdfColors.white),
                  padding: const pw.EdgeInsets.symmetric(vertical: 2),
                  child: pw.Center(child: pw.Text(t.getLabel('main_hdr_left', 'MEDICAL EXAMINATION'), style: tableHeaderFont)),
                ),
                pw.Container(
                  color: _parseColor(t.headerBgColorHex, PdfColors.white),
                  padding: const pw.EdgeInsets.symmetric(vertical: 2),
                  child: pw.Center(child: pw.Text(t.getLabel('main_hdr_right', 'LABORATORY INVESTIGATION'), style: tableHeaderFont)),
                ),
              ],
            ),
          ],
        ),
        ...List.generate(totalRows, (index) {
          final rowWidths = t.getRowWidths(index);
          return buildRowTable(index, rows[index], rowWidths);
        }),
      ],
    );
  }

  pw.Widget _buildFooter(Doctor? doctor, pw.ImageProvider? sig, ReportTemplate t) {
    final textColor = _parseColor(t.textColorHex, PdfColors.black);
    final primaryColor = _parseColor(t.primaryColorHex, PdfColor.fromHex('#0F766E'));

    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.end,
      children: [
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text(
              'For ${t.clinicName.isNotEmpty ? t.clinicName : "SHANTI CLINIC"} (OHC)', 
              style: pw.TextStyle(fontSize: t.bodyFontSize + 1.5, fontWeight: pw.FontWeight.bold, color: primaryColor),
            ),
            pw.Text(t.getLabel('footer_clinic_ohc', 'Occupational Health Center'), style: pw.TextStyle(fontSize: t.bodyFontSize - 0.5, color: textColor)),
            pw.Text(t.getLabel('footer_doc_name', 'Dr. Abdhesh J Mahto'), style: pw.TextStyle(fontSize: t.bodyFontSize - 0.5, color: textColor)),
            pw.Text(t.getLabel('footer_doc_quals_1', 'M.b.b.s,m.d (blo) M.b.a.(h&m)'), style: pw.TextStyle(fontSize: t.bodyFontSize - 0.5, color: textColor)),
            pw.Text(t.getLabel('footer_doc_quals_2', 'P.g.c.i.h.(afih)ind. Health'), style: pw.TextStyle(fontSize: t.bodyFontSize - 0.5, color: textColor)),
            pw.SizedBox(height: 5),
            pw.Stack(
              alignment: pw.Alignment.center,
              children: [
                pw.Text(t.getLabel('footer_auth_sig', 'Authorised Signatory'), style: pw.TextStyle(fontSize: t.bodyFontSize + 0.5, fontWeight: pw.FontWeight.bold, color: textColor)),
                if (sig != null) pw.Container(height: 24, child: pw.Image(sig)),
              ],
            ),
            pw.Text(t.getLabel('footer_doc_desc', 'Consultants Occupational Health Physician'), style: pw.TextStyle(fontSize: t.bodyFontSize - 0.5, color: textColor)),
            pw.Text(t.getLabel('footer_address_1', 'Add. F-102 Jalanand Township'), style: pw.TextStyle(fontSize: t.bodyFontSize - 0.5, color: textColor)),
            pw.Text(t.getLabel('footer_address_2', 'Panchvati Gorwa Vadodara 390016'), style: pw.TextStyle(fontSize: t.bodyFontSize - 0.5, color: textColor)),
            pw.Text(t.getLabel('footer_mobiles', 'M.:- 9327680307/8849793270'), style: pw.TextStyle(fontSize: t.bodyFontSize - 0.5, color: textColor)),
          ],
        ),
      ],
    );
  }
}
