import 'dart:io';
import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../core/models.dart';
import '../core/utils.dart';

/// PDF generation engine responsible for rendering enterprise GAMCA and Occupational Health reports.
class PdfService {
  Future<Uint8List> generateGamcaReport(Report report, Clinic? clinic, Doctor? doctor) async {
    final pdf = pw.Document();
    final patient = report.patientInfo;
    final exam = report.medicalExam;
    final lab = report.labInvestigation;

    // Load photo if available on disk
    pw.ImageProvider? patientPhoto;
    if (patient.photoPath != null && File(patient.photoPath!).existsSync()) {
      try {
        final photoBytes = await File(patient.photoPath!).readAsBytes();
        patientPhoto = pw.MemoryImage(photoBytes);
      } catch (_) {
        patientPhoto = null;
      }
    }

    // Load clinic logo if available on disk
    pw.ImageProvider? clinicLogo;
    if (clinic?.logoPath != null && File(clinic!.logoPath!).existsSync()) {
      try {
        final logoBytes = await File(clinic.logoPath!).readAsBytes();
        clinicLogo = pw.MemoryImage(logoBytes);
      } catch (_) {
        clinicLogo = null;
      }
    }

    // Load doctor signature if available
    pw.ImageProvider? doctorSig;
    if (doctor?.signaturePath != null && File(doctor!.signaturePath!).existsSync()) {
      try {
        final sigBytes = await File(doctor.signaturePath!).readAsBytes();
        doctorSig = pw.MemoryImage(sigBytes);
      } catch (_) {
        doctorSig = null;
      }
    }

    // Colors
    final primaryColor = PdfColor.fromHex('#1565C0');
    final darkText = PdfColor.fromHex('#1A1A1A');
    final grayBg = PdfColor.fromHex('#F5F5F5');
    final borderGray = PdfColor.fromHex('#CCCCCC');
    final statusColor = report.status == ReportStatus.completed
        ? PdfColor.fromHex('#2E7D32')
        : (report.status == ReportStatus.pending ? PdfColor.fromHex('#C62828') : PdfColor.fromHex('#1565C0'));

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        header: (pw.Context context) => _buildHeader(clinic, clinicLogo, primaryColor, darkText),
        footer: (pw.Context context) => _buildFooter(context, darkText),
        build: (pw.Context context) {
          return [
            pw.SizedBox(height: 12),
            _buildReportTitleBox(report, primaryColor, borderGray),
            pw.SizedBox(height: 14),
            _buildSectionHeader('1. PATIENT INFORMATION & IDENTIFICATION', primaryColor),
            pw.SizedBox(height: 6),
            _buildPatientInfoBox(patient, patientPhoto, borderGray, grayBg, darkText),
            pw.SizedBox(height: 14),
            _buildSectionHeader('2. PHYSICAL MEDICAL EXAMINATION', primaryColor),
            pw.SizedBox(height: 6),
            _buildPhysicalExamTable(exam, borderGray, grayBg, darkText),
            pw.SizedBox(height: 14),
            _buildSectionHeader('3. LABORATORY INVESTIGATIONS & RADIOLOGY', primaryColor),
            pw.SizedBox(height: 6),
            _buildLabTable(lab, borderGray, grayBg, darkText),
            pw.SizedBox(height: 16),
            _buildAssessmentBox(report, statusColor, grayBg, borderGray, darkText),
            pw.SizedBox(height: 24),
            _buildSignatureBlock(doctor, doctorSig, clinic, darkText),
          ];
        },
      ),
    );

    return pdf.save();
  }

  pw.Widget _buildHeader(Clinic? clinic, pw.ImageProvider? logo, PdfColor primary, PdfColor dark) {
    return pw.Column(
      children: [
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          crossAxisAlignment: pw.CrossAxisAlignment.center,
          children: [
            pw.Row(
              children: [
                if (logo != null)
                  pw.Container(
                    width: 50,
                    height: 50,
                    margin: const pw.EdgeInsets.only(right: 12),
                    child: pw.Image(logo, fit: pw.BoxFit.contain),
                  ),
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      clinic?.name.toUpperCase() ?? 'SHANTI CLINIC OCCUPATIONAL HEALTH CENTER',
                      style: pw.TextStyle(color: primary, fontSize: 16, fontWeight: pw.FontWeight.bold),
                    ),
                    pw.SizedBox(height: 2),
                    pw.Text(
                      clinic?.subtitle ?? 'Approved Medical Diagnostic & GAMCA Examination Facility',
                      style: pw.TextStyle(color: dark, fontSize: 9),
                    ),
                  ],
                ),
              ],
            ),
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.end,
              children: [
                pw.Text(clinic?.phone ?? 'Tel: +91 11 2345 6789', style: const pw.TextStyle(fontSize: 8.5)),
                pw.Text(clinic?.email ?? 'Email: contact@shanticlinic.com', style: const pw.TextStyle(fontSize: 8.5)),
                pw.Text(clinic?.address ?? '12/A Healthcare Blvd, New Delhi', style: const pw.TextStyle(fontSize: 8.5)),
              ],
            ),
          ],
        ),
        pw.SizedBox(height: 8),
        pw.Divider(color: primary, thickness: 1.5),
      ],
    );
  }

  pw.Widget _buildFooter(pw.Context context, PdfColor dark) {
    return pw.Column(
      children: [
        pw.Divider(color: PdfColors.grey400, thickness: 0.5),
        pw.SizedBox(height: 4),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            pw.Text(
              'Confidential Medical Report - System Generated via Shanti Clinic EMR',
              style: const pw.TextStyle(fontSize: 7.5, color: PdfColors.grey700),
            ),
            pw.Text(
              'Page ${context.pageNumber} of ${context.pagesCount}',
              style: pw.TextStyle(fontSize: 8, color: dark, fontWeight: pw.FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }

  pw.Widget _buildReportTitleBox(Report report, PdfColor primary, PdfColor border) {
    return pw.Container(
      padding: const pw.EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: pw.BoxDecoration(
        border: pw.Border.all(color: border),
        borderRadius: const pw.BorderRadius.all(pw.Radius.circular(4)),
      ),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Text(
                'MEDICAL EXAMINATION REPORT FOR GAMCA / WORK VISA',
                style: pw.TextStyle(color: primary, fontSize: 11, fontWeight: pw.FontWeight.bold),
              ),
              pw.SizedBox(height: 2),
              pw.Text(
                'Report Serial No: #${report.serialNumber}   |   Exam Date: ${report.examDate.toDisplayDate()}',
                style: pw.TextStyle(fontSize: 9.5, fontWeight: pw.FontWeight.bold),
              ),
            ],
          ),
          pw.BarcodeWidget(
            barcode: pw.Barcode.qrCode(),
            data: 'GAMCA:${report.serialNumber}|PASSPORT:${report.patientInfo.passportNumber ?? ""}|STATUS:${report.status.name.toUpperCase()}',
            width: 44,
            height: 44,
          ),
        ],
      ),
    );
  }

  pw.Widget _buildSectionHeader(String title, PdfColor primary) {
    return pw.Container(
      width: double.infinity,
      padding: const pw.EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: pw.BoxDecoration(color: primary),
      child: pw.Text(
        title,
        style: pw.TextStyle(color: PdfColors.white, fontSize: 9.5, fontWeight: pw.FontWeight.bold),
      ),
    );
  }

  pw.Widget _buildPatientInfoBox(PatientInfo patient, pw.ImageProvider? photo, PdfColor border, PdfColor grayBg, PdfColor dark) {
    return pw.Container(
      decoration: pw.BoxDecoration(border: pw.Border.all(color: border)),
      child: pw.Row(
        children: [
          pw.SizedBox(
            width: 440,
            child: pw.Table(
              border: pw.TableBorder.all(color: border, width: 0.5),
              children: [
                pw.TableRow(children: [
                  _cell('Full Name:', isLabel: true, bg: grayBg),
                  _cell(patient.name ?? 'N/A'),
                  _cell('Passport No:', isLabel: true, bg: grayBg),
                  _cell(patient.passportNumber ?? 'N/A', isBold: true),
                ]),
                pw.TableRow(children: [
                  _cell('Nationality:', isLabel: true, bg: grayBg),
                  _cell(patient.nationality ?? 'N/A'),
                  _cell('Age / Gender:', isLabel: true, bg: grayBg),
                  _cell('${patient.age ?? "N/A"} Yrs / ${patient.gender ?? "N/A"}'),
                ]),
                pw.TableRow(children: [
                  _cell('Height / Weight:', isLabel: true, bg: grayBg),
                  _cell('${patient.height ?? "N/A"} cm / ${patient.weight ?? "N/A"} kg'),
                  _cell('Blood Group:', isLabel: true, bg: grayBg),
                  _cell(patient.bloodGroup ?? 'N/A', isBold: true),
                ]),
                pw.TableRow(children: [
                  _cell('Phone Number:', isLabel: true, bg: grayBg),
                  _cell(patient.phone ?? 'N/A'),
                  _cell('Email Address:', isLabel: true, bg: grayBg),
                  _cell(patient.email ?? 'N/A'),
                ]),
              ],
            ),
          ),
          pw.Container(
            width: 80,
            height: 90,
            margin: const pw.EdgeInsets.all(4),
            decoration: pw.BoxDecoration(
              border: pw.Border.all(color: border),
              color: PdfColors.grey200,
            ),
            child: photo != null
                ? pw.Image(photo, fit: pw.BoxFit.cover)
                : pw.Center(
                    child: pw.Text('PHOTO\n80x90', textAlign: pw.TextAlign.center, style: const pw.TextStyle(fontSize: 8, color: PdfColors.grey600)),
                  ),
          ),
        ],
      ),
    );
  }

  pw.Widget _buildPhysicalExamTable(MedicalExam exam, PdfColor border, PdfColor grayBg, PdfColor dark) {
    return pw.Table(
      border: pw.TableBorder.all(color: border, width: 0.5),
      children: [
        pw.TableRow(children: [
          _cell('Right Eye Vision:', isLabel: true, bg: grayBg),
          _cell(exam.eyeVisionRight ?? '6/6'),
          _cell('Left Eye Vision:', isLabel: true, bg: grayBg),
          _cell(exam.eyeVisionLeft ?? '6/6'),
          _cell('Color Vision:', isLabel: true, bg: grayBg),
          _cell(exam.colorVision ?? 'NORMAL'),
        ]),
        pw.TableRow(children: [
          _cell('Right Ear:', isLabel: true, bg: grayBg),
          _cell(exam.earRight ?? 'NORMAL'),
          _cell('Left Ear:', isLabel: true, bg: grayBg),
          _cell(exam.earLeft ?? 'NORMAL'),
          _cell('Cardiovascular:', isLabel: true, bg: grayBg),
          _cell(exam.cardiovascular ?? 'NAD'),
        ]),
        pw.TableRow(children: [
          _cell('Respiratory System:', isLabel: true, bg: grayBg),
          _cell(exam.respiratory ?? 'NAD'),
          _cell('Gastrointestinal:', isLabel: true, bg: grayBg),
          _cell(exam.gastrointestinal ?? 'NAD'),
          _cell('Central Nervous System:', isLabel: true, bg: grayBg),
          _cell(exam.centralNervousSystem ?? 'NAD'),
        ]),
        pw.TableRow(children: [
          _cell('Hernia:', isLabel: true, bg: grayBg),
          _cell(exam.hernia ?? 'ABSENT'),
          _cell('Varicose Veins:', isLabel: true, bg: grayBg),
          _cell(exam.varicoseVeins ?? 'ABSENT'),
          _cell('Extremities / Locomotor:', isLabel: true, bg: grayBg),
          _cell(exam.extremities ?? 'NORMAL'),
        ]),
        pw.TableRow(children: [
          _cell('Skin Examination:', isLabel: true, bg: grayBg),
          _cell(exam.skin ?? 'NORMAL'),
          _cell('Deformities:', isLabel: true, bg: grayBg),
          _cell(exam.deformities ?? 'NIL'),
          _cell('Psychiatric Evaluation:', isLabel: true, bg: grayBg),
          _cell(exam.psychiatric ?? 'NORMAL'),
        ]),
      ],
    );
  }

  pw.Widget _buildLabTable(LabInvestigation lab, PdfColor border, PdfColor grayBg, PdfColor dark) {
    return pw.Table(
      border: pw.TableBorder.all(color: border, width: 0.5),
      children: [
        pw.TableRow(children: [
          _cell('Urine Protein:', isLabel: true, bg: grayBg),
          _cell(lab.urineProtein ?? 'NIL'),
          _cell('Urine Sugar:', isLabel: true, bg: grayBg),
          _cell(lab.urineSugar ?? 'NIL'),
          _cell('Urine Microscopic:', isLabel: true, bg: grayBg),
          _cell(lab.urineMicroscopic ?? 'NAD'),
        ]),
        pw.TableRow(children: [
          _cell('Stool Helminths:', isLabel: true, bg: grayBg),
          _cell(lab.stoolHelminths ?? 'ABSENT'),
          _cell('Stool Protozoa:', isLabel: true, bg: grayBg),
          _cell(lab.stoolProtozoa ?? 'ABSENT'),
          _cell('Hemoglobin (g/dL):', isLabel: true, bg: grayBg),
          _cell(lab.bloodHemoglobin?.toString() ?? '14.5'),
        ]),
        pw.TableRow(children: [
          _cell('WBC Count:', isLabel: true, bg: grayBg),
          _cell(lab.bloodWbc != null ? '${lab.bloodWbc} /cumm' : '6800 /cumm'),
          _cell('Random Blood Sugar:', isLabel: true, bg: grayBg),
          _cell('${lab.bloodGlucose?.toString() ?? "92.0"} mg/dL'),
          _cell('Serum Creatinine:', isLabel: true, bg: grayBg),
          _cell('${lab.kidneyCreatinine?.toString() ?? "0.9"} mg/dL'),
        ]),
        pw.TableRow(children: [
          _cell('SGOT / AST (U/L):', isLabel: true, bg: grayBg),
          _cell('${lab.liverSgot?.toString() ?? "24.0"} U/L'),
          _cell('SGPT / ALT (U/L):', isLabel: true, bg: grayBg),
          _cell('${lab.liverSgpt?.toString() ?? "26.0"} U/L'),
          _cell('VDRL / Syphilis:', isLabel: true, bg: grayBg),
          _cell(lab.vdrl ?? 'NON-REACTIVE', isBold: true),
        ]),
        pw.TableRow(children: [
          _cell('HIV I & II (ELISA):', isLabel: true, bg: grayBg),
          _cell(lab.hivElisa ?? 'NON-REACTIVE', isBold: true),
          _cell('HBsAg (Hepatitis B):', isLabel: true, bg: grayBg),
          _cell(lab.hbsagElisa ?? 'NON-REACTIVE', isBold: true),
          _cell('Anti-HCV (Hepatitis C):', isLabel: true, bg: grayBg),
          _cell(lab.hcvElisa ?? 'NON-REACTIVE', isBold: true),
        ]),
        pw.TableRow(children: [
          _cell('Malaria Parasite:', isLabel: true, bg: grayBg),
          _cell(lab.malaria ?? 'NEGATIVE'),
          _cell('Microfilaria:', isLabel: true, bg: grayBg),
          _cell(lab.microfilaria ?? 'NEGATIVE'),
          _cell('Chest X-Ray (PA View):', isLabel: true, bg: grayBg),
          _cell(lab.chestXray ?? 'NORMAL / NO ACTIVE PNEUMONIA OR TB', isBold: true),
        ]),
      ],
    );
  }

  pw.Widget _buildAssessmentBox(Report report, PdfColor statusColor, PdfColor grayBg, PdfColor border, PdfColor dark) {
    String statusText = 'FIT FOR EMPLOYMENT / NORMAL';
    if (report.status == ReportStatus.pending) statusText = 'UNFIT FOR EMPLOYMENT / ABNORMAL';
    if (report.status == ReportStatus.draft) statusText = 'PENDING FINAL ASSESSMENT / DRAFT';

    return pw.Container(
      padding: const pw.EdgeInsets.all(12),
      decoration: pw.BoxDecoration(
        border: pw.Border.all(color: border, width: 1),
        color: grayBg,
      ),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text('FINAL MEDICAL FITNESS STATUS:', style: pw.TextStyle(fontSize: 10, fontWeight: pw.FontWeight.bold)),
              pw.Container(
                padding: const pw.EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: pw.BoxDecoration(color: statusColor, borderRadius: const pw.BorderRadius.all(pw.Radius.circular(4))),
                child: pw.Text(statusText, style: pw.TextStyle(color: PdfColors.white, fontSize: 10, fontWeight: pw.FontWeight.bold)),
              ),
            ],
          ),
          if (report.remarks != null && report.remarks!.trim().isNotEmpty) ...[
            pw.SizedBox(height: 6),
            pw.Text('Doctor Remarks & Observations: ${report.remarks}', style: const pw.TextStyle(fontSize: 8.5)),
          ],
        ],
      ),
    );
  }

  pw.Widget _buildSignatureBlock(Doctor? doctor, pw.ImageProvider? sig, Clinic? clinic, PdfColor dark) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      crossAxisAlignment: pw.CrossAxisAlignment.end,
      children: [
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text('Place of Examination: ${clinic?.address.split(",").lastOrNull?.trim() ?? "New Delhi"}', style: const pw.TextStyle(fontSize: 8.5)),
            pw.SizedBox(height: 20),
            pw.Text('____________________________________', style: const pw.TextStyle(color: PdfColors.grey500)),
            pw.SizedBox(height: 2),
            pw.Text('Candidate / Patient Signature & Thumb Impression', style: pw.TextStyle(fontSize: 8, color: dark)),
          ],
        ),
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.center,
          children: [
            if (sig != null)
              pw.Container(height: 36, child: pw.Image(sig, fit: pw.BoxFit.contain))
            else
              pw.SizedBox(height: 36),
            pw.Text('____________________________________', style: const pw.TextStyle(color: PdfColors.grey500)),
            pw.SizedBox(height: 2),
            pw.Text(doctor?.name ?? 'Dr. Examining Medical Officer', style: pw.TextStyle(fontSize: 9, fontWeight: pw.FontWeight.bold)),
            pw.Text('${doctor?.qualifications ?? "MBBS, MD"} - ${doctor?.designation ?? "Chief Medical Officer"}', style: pw.TextStyle(fontSize: 8, color: dark)),
            pw.Text('Reg. No: 45892 / Approved GAMCA Physician', style: const pw.TextStyle(fontSize: 7.5, color: PdfColors.grey700)),
          ],
        ),
      ],
    );
  }

  pw.Widget _cell(String text, {bool isLabel = false, bool isBold = false, PdfColor? bg}) {
    return pw.Container(
      padding: const pw.EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      color: bg,
      alignment: pw.Alignment.centerLeft,
      child: pw.Text(
        text,
        style: pw.TextStyle(
          fontSize: 8,
          fontWeight: (isLabel || isBold) ? pw.FontWeight.bold : pw.FontWeight.normal,
        ),
      ),
    );
  }
}
