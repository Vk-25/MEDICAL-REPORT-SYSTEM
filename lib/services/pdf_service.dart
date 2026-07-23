import 'dart:io';
import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../core/models.dart';
import '../core/utils.dart';

class PdfService {
  Future<Uint8List> generateGamcaReport(Report report, Clinic? clinic, Doctor? doctor) async {
    final pdf = pw.Document();
    final patient = report.patientInfo;
    final exam = report.medicalExam;
    final lab = report.labInvestigation;

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
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              pw.SizedBox(height: 3),
              _buildReportInfo(report, patient),
              pw.SizedBox(height: 3),
              _buildMainTable(exam, lab),
              pw.SizedBox(height: 4),
              _buildFooter(doctor, doctorSig),
            ],
          );
        },
      ),
    );

    return pdf.save();
  }

  pw.Widget _buildHeader() {
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
                    'SHANTI CLINIC',
                    style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
                  ),
                  pw.Text(
                    'OCCUPATIONAL HEALTH CENTER',
                    style: pw.TextStyle(fontSize: 8.5, fontWeight: pw.FontWeight.bold),
                  ),
                  pw.Text(
                    '(A UNIT OF SHANTI CHARITABLE TRUST)',
                    style: pw.TextStyle(fontSize: 7.5, fontWeight: pw.FontWeight.bold),
                  ),
                ],
              ),
            ),
            pw.Expanded(
              flex: 1,
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Text('(Reg. No. - 11453)', style: const pw.TextStyle(fontSize: 6.5)),
                  pw.Text('(Reg. No. - B-27/879)', style: const pw.TextStyle(fontSize: 6.5)),
                  pw.Text('Trus No : F/3162/Vadodara', style: const pw.TextStyle(fontSize: 6.5)),
                  pw.Text('Reg. No : Guj/3477/Vadodara', style: const pw.TextStyle(fontSize: 6.5)),
                  pw.Text('Mob. : 9327680307', style: const pw.TextStyle(fontSize: 6.5)),
                ],
              ),
            ),
          ],
        ),
        pw.SizedBox(height: 1),
        pw.Center(
          child: pw.Text(
            'Dr. Abdhesh J Mhto',
            style: pw.TextStyle(fontSize: 8.5, fontWeight: pw.FontWeight.bold),
          ),
        ),
        pw.Center(
          child: pw.Text(
            '(M.B.B.S., M.D., (H&H Megnt.), M.B.A. P.G.C.I.H.(Ind. Health))',
            style: const pw.TextStyle(fontSize: 6.5),
          ),
        ),
        pw.Center(
          child: pw.Text(
            'A.F.I.H. (Ind. Health), M.R.S.H (LONDON), F.R.H.S (UK)',
            style: const pw.TextStyle(fontSize: 6.5),
          ),
        ),
        pw.Center(
          child: pw.Text(
            'Consultants Occupational Health Physician & Diabetology',
            style: const pw.TextStyle(fontSize: 6.5),
          ),
        ),
        pw.Center(
          child: pw.Text(
            'T.B., Typhoid, B.P., Diabetic, Malaria, Asthma, Chest infection, Sexual Disease Specialist',
            style: const pw.TextStyle(fontSize: 6.5),
          ),
        ),
        pw.Center(
          child: pw.Text(
            'F/102, Jalanand Township, Panchvati Refinery Road, Gorwa, Vadodara - 390 016 Gujarat.',
            style: const pw.TextStyle(fontSize: 6.5),
          ),
        ),
        pw.Center(
          child: pw.Text(
            'E-mail ID :- shanticlinicohc26@gmail.com, dr.abdhesh.mahto@gmail.com',
            style: const pw.TextStyle(fontSize: 6.5),
          ),
        ),
        pw.SizedBox(height: 3),
        pw.Container(
          width: double.infinity,
          padding: const pw.EdgeInsets.symmetric(vertical: 1.5),
          decoration: pw.BoxDecoration(border: pw.Border.all(width: 0.5)),
          child: pw.Center(
            child: pw.Text(
              'MEDICAL REPORT',
              style: pw.TextStyle(fontSize: 9, fontWeight: pw.FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  pw.Widget _buildReportInfo(Report report, PatientInfo patient) {
    return pw.Table(
      border: pw.TableBorder.all(width: 0.5),
      columnWidths: const {
        0: pw.FlexColumnWidth(1),
        1: pw.FlexColumnWidth(1),
      },
      children: [
        pw.TableRow(children: [
          pw.Padding(
            padding: const pw.EdgeInsets.all(2),
            child: pw.Text('Exam Date :- ${report.examDate.toDisplayDate()}', style: pw.TextStyle(fontSize: 7.5, fontWeight: pw.FontWeight.bold)),
          ),
          pw.Padding(
            padding: const pw.EdgeInsets.all(2),
            child: pw.Text('Serial Number :- ${report.serialNumber}', style: pw.TextStyle(fontSize: 7.5, fontWeight: pw.FontWeight.bold)),
          ),
        ]),
        pw.TableRow(children: [
          pw.Padding(
            padding: const pw.EdgeInsets.all(2),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                _infoRow('Name', patient.name ?? 'Makwana Vikashkumar Rajeshbhai'),
                _infoRow('Height', '${patient.height != null ? patient.height!.toStringAsFixed(0) : "165"} Cm'),
                _infoRow('Weight', '${patient.weight != null ? patient.weight!.toStringAsFixed(0) : "74"} Kg'),
                _infoRow('Age', '${patient.age ?? "36"} Years'),
                _infoRow('Blood Group', patient.bloodGroup ?? 'B (+) Positive'),
              ],
            ),
          ),
          pw.Padding(
            padding: const pw.EdgeInsets.all(2),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                _infoRow('Passport No', patient.passportNumber ?? 'W 9144648'),
                _infoRow('Date of Issue', patient.issueDate?.toDisplayDate() ?? '26.12.2022'),
                _infoRow('Place of Issue', patient.placeOfIssue ?? 'Ahmedabad, Gujarat'),
                _infoRow('Nationality', patient.nationality ?? 'Indian'),
                _infoRow('Position applied for', patient.position ?? 'General Fitter ( Mechanical )'),
                _infoRow('Visa No', patient.visaNumber ?? ''),
              ],
            ),
          ),
        ]),
      ],
    );
  }

  pw.Widget _infoRow(String label, String value) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 0.2),
      child: pw.Row(
        children: [
          pw.SizedBox(
            width: 80,
            child: pw.Text(label, style: const pw.TextStyle(fontSize: 7.0)),
          ),
          pw.Expanded(
            child: pw.Text(
              value,
              style: pw.TextStyle(fontSize: 7.0, fontWeight: pw.FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  pw.Widget _buildMainTable(MedicalExam exam, LabInvestigation lab) {
    return pw.Column(
      children: [
        // Main Top Banner
        pw.Container(
          decoration: pw.BoxDecoration(border: pw.Border.all(width: 0.5)),
          child: pw.Row(
            children: [
              pw.Expanded(
                flex: 5,
                child: pw.Padding(
                  padding: const pw.EdgeInsets.symmetric(vertical: 1.5),
                  child: pw.Center(
                    child: pw.Text(
                      'MEDICAL EXAMINATION',
                      style: pw.TextStyle(fontSize: 7.5, fontWeight: pw.FontWeight.bold),
                    ),
                  ),
                ),
              ),
              pw.Container(width: 0.5, height: 12, color: PdfColors.black),
              pw.Expanded(
                flex: 5,
                child: pw.Padding(
                  padding: const pw.EdgeInsets.symmetric(vertical: 1.5),
                  child: pw.Center(
                    child: pw.Text(
                      'LABORATORY INVESTIGATION',
                      style: pw.TextStyle(fontSize: 7.5, fontWeight: pw.FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Sub Header Row
        pw.Table(
          border: const pw.TableBorder(
            left: pw.BorderSide(width: 0.5),
            right: pw.BorderSide(width: 0.5),
            bottom: pw.BorderSide(width: 0.5),
            verticalInside: pw.BorderSide(width: 0.5),
          ),
          columnWidths: const {
            0: pw.FlexColumnWidth(3.2),
            1: pw.FlexColumnWidth(2.0),
            2: pw.FlexColumnWidth(3.2),
            3: pw.FlexColumnWidth(2.0),
          },
          children: [
            pw.TableRow(
              children: [
                pw.Padding(
                  padding: const pw.EdgeInsets.symmetric(vertical: 1.5, horizontal: 2),
                  child: pw.Center(
                    child: pw.Text(
                      'TYPE OF MEDICAL EXAMINATION',
                      style: pw.TextStyle(fontSize: 6.8, fontWeight: pw.FontWeight.bold),
                    ),
                  ),
                ),
                pw.Padding(
                  padding: const pw.EdgeInsets.symmetric(vertical: 1.5, horizontal: 2),
                  child: pw.Center(
                    child: pw.Text(
                      'RESULTS',
                      style: pw.TextStyle(fontSize: 6.8, fontWeight: pw.FontWeight.bold),
                    ),
                  ),
                ),
                pw.Padding(
                  padding: const pw.EdgeInsets.symmetric(vertical: 1.5, horizontal: 2),
                  child: pw.Center(
                    child: pw.Text(
                      'TYPE OF INVESTIGATIONS',
                      style: pw.TextStyle(fontSize: 6.8, fontWeight: pw.FontWeight.bold),
                    ),
                  ),
                ),
                pw.Padding(
                  padding: const pw.EdgeInsets.symmetric(vertical: 1.5, horizontal: 2),
                  child: pw.Center(
                    child: pw.Text(
                      'RRESULTS',
                      style: pw.TextStyle(fontSize: 6.8, fontWeight: pw.FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        // Block 1: EYE / EAR | URINE
        _buildBlockTable(
          leftItems: [
            const MapEntry('EYE', ''),
            MapEntry('  R. EYE', exam.eyeRight ?? 'NORMAL'),
            MapEntry('  L. EYE', exam.eyeLeft ?? 'NORMAL'),
            const MapEntry('EAR', ''),
            MapEntry('  R. EYE', exam.earRight ?? 'NAD'),
            MapEntry('  L. EYE', exam.earLeft ?? 'NAD'),
          ],
          rightItems: [
            const MapEntry('URINE', ''),
            MapEntry('  SUGAR', lab.urineSugar ?? 'ABSENT'),
            MapEntry('  ALBUMIN', lab.urineAlbumin ?? 'ABSENT'),
            MapEntry('  BILHZIASIS IF ENDEMIC', lab.urineBilharziasis ?? 'ABSENT'),
          ],
        ),
        // Block 2: SYSTEMIC EXAM / RESPIRATORY SYSTEM | STOOL ROUTINE
        _buildBlockTable(
          leftItems: [
            const MapEntry('SYSTEMIC EXAM', ''),
            MapEntry('  CARDIP-VASULAR', exam.cardiovascular ?? 'NAD'),
            MapEntry('  B. P.', exam.bloodPressure ?? '130/82 mmHg'),
            MapEntry('  HEART', exam.heart ?? 'NAD'),
            const MapEntry('RESPIRATORY SYSTEM', ''),
            MapEntry('  LUNGS-CHEST X-RAY', exam.chestXRay ?? 'CLEAR'),
            MapEntry('  TUBERCULOSIS', exam.tuberculosis ?? 'ABSENT'),
          ],
          rightItems: [
            const MapEntry('STOOL          ROUTINE', ''),
            MapEntry('1. OVA', lab.stoolOva ?? 'NIL'),
            MapEntry('2. CYST', lab.stoolCyst ?? 'NIL'),
            MapEntry('3. BLOOD', lab.stoolBlood ?? 'ABSENT'),
            MapEntry('4. HELMINTHES', lab.stoolHelminthes ?? 'NIL'),
            MapEntry('5. GIARDIA%', lab.stoolGiardia ?? '0'),
            MapEntry('6. BILHARZIASIS (IF ENDEMIC) CULT', lab.stoolBilharziasis ?? 'NIL'),
            MapEntry('7. SALMONELLA', lab.stoolSalmonella ?? 'NIL'),
            MapEntry('  SHIGELLA', lab.stoolShigella ?? '0'),
            MapEntry('  V CHOLERA (IF ENDEMIC)', lab.stoolCholera ?? '0'),
          ],
        ),
        // Block 3: GASTRO INTESTINAL | BLOOD
        _buildBlockTable(
          leftItems: [
            const MapEntry('GASTRO INTESTINAL', ''),
            MapEntry('  ABDOMEN', exam.abdomen ?? 'NAD'),
          ],
          rightItems: [
            const MapEntry('BLOOD', ''),
            MapEntry('  HEMOGLOBIN', lab.bloodHemoglobin?.toString() ?? '15.5'),
            MapEntry('  1. TLC', lab.bloodTlc?.toString() ?? '9430'),
            MapEntry('  2. W B C', lab.bloodWbc?.toString() ?? '50 / 54 / 01 / 01 / 000'),
            MapEntry('  3. E S R', lab.bloodEsr?.toString() ?? '10'),
            MapEntry('  4. S G P T', lab.bloodSgpt?.toString() ?? '38'),
            MapEntry('  5. BLOOD UREA', lab.bloodUrea?.toString() ?? '36'),
            MapEntry('  6. S-URICACID', lab.bloodUricAcid?.toString() ?? '4.5'),
            const MapEntry('  THICK FILM FOR', ''),
            MapEntry('  1. MALARIA', lab.bloodMalaria ?? 'NIL'),
            MapEntry('  2. MICRO FILARIA', lab.bloodMicroFilaria ?? 'NIL'),
          ],
        ),
        // Block 4: OTHER | SEROLOGY
        _buildBlockTable(
          leftItems: [
            const MapEntry('OTHER', ''),
            MapEntry('  HERNIA', exam.hernia ?? 'NIL'),
            MapEntry('  VARICOSE VEINS', exam.varicoseVeins ?? 'NIL'),
          ],
          rightItems: [
            const MapEntry('SEROLOGY', ''),
            MapEntry('  1. P P 2 B S', lab.serologyPp2bs?.toString() ?? '97%'),
            MapEntry('  2. F. B. S.', lab.serologyFbs?.toString() ?? '86%'),
            MapEntry('  3. L. F. T.', lab.serologyLft ?? 'NORMAL'),
            MapEntry('  4. CREATINE', lab.serologyCreatinine?.toString() ?? '1.020mg%'),
            MapEntry('  5. PLATELET COUNT', lab.serologyPlateletCount?.toString() ?? '2,99,410'),
          ],
        ),
        // Block 5: EXTREMITIES / DEFORMITIES / SKIN | LIPID PROFILE
        _buildBlockTable(
          leftItems: [
            MapEntry('  EXTREMITIES', exam.extremities ?? 'NAD'),
            MapEntry('  DEFORMITIES', exam.deformities ?? 'NAD'),
            MapEntry('  SKIN', exam.skin ?? 'NAD'),
          ],
          rightItems: [
            const MapEntry('LIPID PROFILE', ''),
            MapEntry('  1. S-CHO', lab.lipidCholesterol?.toString() ?? '89%'),
            MapEntry('  2. T R Y', lab.lipidTry?.toString() ?? '164%'),
            MapEntry('  3. H D L', lab.lipidHdl?.toString() ?? '72%'),
            MapEntry('  4. L D L', lab.lipidLdl?.toString() ?? '165'),
            MapEntry('  5. G6 PD', lab.lipidG6pd ?? '12.60%'),
          ],
        ),
        // Block 6: HERNIAVENEREAL DISEASES | ELISA
        _buildBlockTable(
          leftItems: [
            const MapEntry('HERNIAVENEREAL DISEASES', ''),
            MapEntry('  CLINICAL', exam.clinicalRemarks ?? 'NIL'),
          ],
          rightItems: [
            const MapEntry('ELISA', ''),
            MapEntry('  1. H.I.V. 1 & 2', lab.elisaHiv ?? 'Negative'),
            MapEntry('  2. Hbs Ag%', lab.elisaHbsAg ?? 'Non - Reacti'),
            MapEntry('  3. Anti HCV%', lab.elisaAntiHcv ?? 'Non - Reacti'),
            MapEntry('  V D R L', lab.elisaVdrl ?? 'Negative'),
            MapEntry('  TPHA(IF VDRL TPH Wedal Test)', lab.elisaTpha ?? 'Negative'),
          ],
        ),
      ],
    );
  }

  pw.Widget _buildBlockTable({
    required List<MapEntry<String, String>> leftItems,
    required List<MapEntry<String, String>> rightItems,
  }) {
    final maxLen = leftItems.length > rightItems.length ? leftItems.length : rightItems.length;

    final rows = <pw.TableRow>[];
    for (int i = 0; i < maxLen; i++) {
      final left = i < leftItems.length ? leftItems[i] : const MapEntry('', '');
      final right = i < rightItems.length ? rightItems[i] : const MapEntry('', '');

      final isLeftBold = left.key.isNotEmpty && !left.key.startsWith(' ');
      final isRightBold = right.key.isNotEmpty && !right.key.startsWith(' ');

      rows.add(
        pw.TableRow(
          children: [
            pw.Padding(
              padding: const pw.EdgeInsets.symmetric(horizontal: 3, vertical: 0.3),
              child: pw.Text(
                left.key,
                style: pw.TextStyle(
                  fontSize: 6.8,
                  fontWeight: isLeftBold ? pw.FontWeight.bold : pw.FontWeight.normal,
                ),
              ),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.symmetric(horizontal: 3, vertical: 0.3),
              child: pw.Center(
                child: pw.Text(
                  left.value,
                  style: const pw.TextStyle(fontSize: 6.8),
                ),
              ),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.symmetric(horizontal: 3, vertical: 0.3),
              child: pw.Text(
                right.key,
                style: pw.TextStyle(
                  fontSize: 6.8,
                  fontWeight: isRightBold ? pw.FontWeight.bold : pw.FontWeight.normal,
                ),
              ),
            ),
            pw.Padding(
              padding: const pw.EdgeInsets.symmetric(horizontal: 3, vertical: 0.3),
              child: pw.Center(
                child: pw.Text(
                  right.value,
                  style: const pw.TextStyle(fontSize: 6.8),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return pw.Table(
      border: const pw.TableBorder(
        left: pw.BorderSide(width: 0.5),
        right: pw.BorderSide(width: 0.5),
        bottom: pw.BorderSide(width: 0.5),
        verticalInside: pw.BorderSide(width: 0.5),
      ),
      columnWidths: const {
        0: pw.FlexColumnWidth(3.2),
        1: pw.FlexColumnWidth(2.0),
        2: pw.FlexColumnWidth(3.2),
        3: pw.FlexColumnWidth(2.0),
      },
      children: rows,
    );
  }

  pw.Widget _buildFooter(Doctor? doctor, pw.ImageProvider? sig) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.end,
      children: [
        pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Text('For SHANTI CLINIC (OHC)', style: pw.TextStyle(fontSize: 8.5, fontWeight: pw.FontWeight.bold)),
            pw.Text('Occupational Health Center', style: const pw.TextStyle(fontSize: 6.5)),
            pw.Text('Dr. Abdhesh J Mahto', style: const pw.TextStyle(fontSize: 6.5)),
            pw.Text('M.b.b.s,m.d (blo) M.b.a.(h&m)', style: const pw.TextStyle(fontSize: 6.5)),
            pw.Text('P.g.c.i.h.(afih)ind. Health', style: const pw.TextStyle(fontSize: 6.5)),
            pw.SizedBox(height: 5), 
            pw.Stack(
              alignment: pw.Alignment.center,
              children: [
                pw.Text('Authorised Signatory', style: pw.TextStyle(fontSize: 7.5, fontWeight: pw.FontWeight.bold)),
                if (sig != null) pw.Container(height: 24, child: pw.Image(sig)),
              ],
            ),
            pw.Text('Consultants Occupational Health Physician', style: const pw.TextStyle(fontSize: 6.5)),
            pw.Text('Add. F-102 Jalanand Township', style: const pw.TextStyle(fontSize: 6.5)),
            pw.Text('Panchvati Gorwa Vadodara 390016', style: const pw.TextStyle(fontSize: 6.5)),
            pw.Text('M.:- 9327680307/8849793270', style: const pw.TextStyle(fontSize: 6.5)),
          ],
        ),
      ],
    );
  }
}
