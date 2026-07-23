import 'package:excel/excel.dart';
import '../core/models.dart';

/// Print and Excel export engine stub for Phase 2 and Phase 3.
class ExportService {
  Future<List<int>> exportReportsToExcel(List<Report> reports) async {
    final excel = Excel.createExcel();
    final sheet = excel['Reports'];
    sheet.appendRow([
      TextCellValue('Serial No'),
      TextCellValue('Patient Name'),
      TextCellValue('Passport'),
      TextCellValue('Exam Date'),
      TextCellValue('Status'),
    ]);
    for (final r in reports) {
      sheet.appendRow([
        TextCellValue(r.serialNumber),
        TextCellValue(r.patientInfo.name ?? ''),
        TextCellValue(r.patientInfo.passportNumber ?? ''),
        TextCellValue(r.examDate.toIso8601String()),
        TextCellValue(r.status.name),
      ]);
    }
    return excel.encode() ?? [];
  }

  Future<List<int>> exportPatientsToExcel(List<Patient> patients) async {
    final excel = Excel.createExcel();
    final sheet = excel['Patients'];
    sheet.appendRow([
      TextCellValue('ID'),
      TextCellValue('Candidate Name'),
      TextCellValue('Passport Number'),
      TextCellValue('Nationality'),
      TextCellValue('Age'),
      TextCellValue('Gender'),
      TextCellValue('Blood Group'),
      TextCellValue('Phone'),
      TextCellValue('Email'),
      TextCellValue('Registration Date'),
    ]);
    for (final p in patients) {
      sheet.appendRow([
        TextCellValue('${p.id ?? ""}'),
        TextCellValue(p.name),
        TextCellValue(p.passportNumber),
        TextCellValue(p.nationality),
        TextCellValue('${p.age}'),
        TextCellValue(p.gender),
        TextCellValue(p.bloodGroup),
        TextCellValue(p.phone ?? ''),
        TextCellValue(p.email ?? ''),
        TextCellValue(p.createdAt.toIso8601String().split('T').first),
      ]);
    }
    return excel.encode() ?? [];
  }
}
