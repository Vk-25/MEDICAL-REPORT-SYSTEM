import 'dart:convert';
import 'package:isar/isar.dart';
import 'database.dart';
import 'models.dart';

/// Base repository interface defining standard CRUD operations.
abstract class BaseRepository<D, C> {
  final IsarDatabase db;
  const BaseRepository(this.db);

  Future<List<D>> findAll();
  Future<D?> findById(int id);
  Future<int> create(D item);
  Future<void> update(D item);
  Future<bool> delete(int id);
  Stream<List<D>> watchAll();
  Future<int> count();
}

/// Patient repository implementation using Isar.
class PatientRepository extends BaseRepository<Patient, PatientCollection> {
  const PatientRepository(super.db);

  @override
  Future<List<Patient>> findAll() async {
    final isar = db.instance;
    final cols = await isar.patientCollections.where().sortByName().findAll();
    return cols.map((c) => Patient.fromCollection(c)).toList();
  }

  @override
  Future<Patient?> findById(int id) async {
    final isar = db.instance;
    final col = await isar.patientCollections.get(id);
    return col != null ? Patient.fromCollection(col) : null;
  }

  @override
  Future<int> create(Patient item) async {
    final isar = db.instance;
    final col = item.toCollection();
    return isar.writeTxn(() async => await isar.patientCollections.put(col));
  }

  @override
  Future<void> update(Patient item) async {
    final isar = db.instance;
    final col = item.toCollection();
    await isar.writeTxn(() async => await isar.patientCollections.put(col));
  }

  Future<void> save(Patient item) async {
    if (item.id == null || item.id == 0) {
      await create(item);
    } else {
      await update(item);
    }
  }

  @override
  Future<bool> delete(int id) async {
    final isar = db.instance;
    return isar.writeTxn(() async => await isar.patientCollections.delete(id));
  }

  @override
  Stream<List<Patient>> watchAll() {
    final isar = db.instance;
    return isar.patientCollections.where().sortByName().watch(fireImmediately: true).map(
          (cols) => cols.map((c) => Patient.fromCollection(c)).toList(),
        );
  }

  @override
  Future<int> count() async {
    final isar = db.instance;
    return isar.patientCollections.count();
  }

  Future<List<Patient>> searchByNameOrPassport(String query) async {
    if (query.trim().isEmpty) return findAll();
    final isar = db.instance;
    final cols = await isar.patientCollections
        .filter()
        .nameContains(query, caseSensitive: false)
        .or()
        .passportNumberContains(query, caseSensitive: false)
        .or()
        .phoneContains(query, caseSensitive: false)
        .findAll();
    return cols.map((c) => Patient.fromCollection(c)).toList();
  }
}

/// Report repository implementation using Isar.
class ReportRepository extends BaseRepository<Report, ReportCollection> {
  const ReportRepository(super.db);

  @override
  Future<List<Report>> findAll() async {
    final isar = db.instance;
    final cols = await isar.reportCollections.where().sortByExamDateDesc().findAll();
    return cols.map((c) => Report.fromCollection(c)).toList();
  }

  @override
  Future<Report?> findById(int id) async {
    final isar = db.instance;
    final col = await isar.reportCollections.get(id);
    return col != null ? Report.fromCollection(col) : null;
  }

  @override
  Future<int> create(Report item) async {
    final isar = db.instance;
    final col = item.toCollection();
    return isar.writeTxn(() async => await isar.reportCollections.put(col));
  }

  @override
  Future<void> update(Report item) async {
    final isar = db.instance;
    final col = item.toCollection();
    await isar.writeTxn(() async => await isar.reportCollections.put(col));
  }

  Future<void> save(Report item) async {
    if (item.id == null || item.id == 0) {
      await create(item);
    } else {
      await update(item);
    }
  }

  @override
  Future<bool> delete(int id) async {
    final isar = db.instance;
    return isar.writeTxn(() async => await isar.reportCollections.delete(id));
  }

  @override
  Stream<List<Report>> watchAll() {
    final isar = db.instance;
    return isar.reportCollections.where().sortByExamDateDesc().watch(fireImmediately: true).map(
          (cols) => cols.map((c) => Report.fromCollection(c)).toList(),
        );
  }

  @override
  Future<int> count() async {
    final isar = db.instance;
    return isar.reportCollections.count();
  }

  Future<List<Report>> findByStatus(ReportStatus status) async {
    final isar = db.instance;
    final cols = await isar.reportCollections.filter().statusEqualTo(status.name.toUpperCase()).sortByExamDateDesc().findAll();
    return cols.map((c) => Report.fromCollection(c)).toList();
  }

  Future<List<Report>> findByPatientId(int patientId) async {
    final isar = db.instance;
    final cols = await isar.reportCollections.filter().patientIdEqualTo(patientId).sortByExamDateDesc().findAll();
    return cols.map((c) => Report.fromCollection(c)).toList();
  }

  Future<List<Report>> findByDateRange(DateTime start, DateTime end) async {
    final isar = db.instance;
    final cols = await isar.reportCollections.filter().examDateBetween(start, end).sortByExamDateDesc().findAll();
    return cols.map((c) => Report.fromCollection(c)).toList();
  }
}

/// Doctor repository implementation.
class DoctorRepository extends BaseRepository<Doctor, DoctorCollection> {
  const DoctorRepository(super.db);

  @override
  Future<List<Doctor>> findAll() async {
    final isar = db.instance;
    final cols = await isar.doctorCollections.where().sortByName().findAll();
    return cols.map((c) => Doctor.fromCollection(c)).toList();
  }

  @override
  Future<Doctor?> findById(int id) async {
    final isar = db.instance;
    final col = await isar.doctorCollections.get(id);
    return col != null ? Doctor.fromCollection(col) : null;
  }

  @override
  Future<int> create(Doctor item) async {
    final isar = db.instance;
    final col = item.toCollection();
    return isar.writeTxn(() async => await isar.doctorCollections.put(col));
  }

  @override
  Future<void> update(Doctor item) async {
    final isar = db.instance;
    final col = item.toCollection();
    await isar.writeTxn(() async => await isar.doctorCollections.put(col));
  }

  @override
  Future<bool> delete(int id) async {
    final isar = db.instance;
    return isar.writeTxn(() async => await isar.doctorCollections.delete(id));
  }

  @override
  Stream<List<Doctor>> watchAll() {
    final isar = db.instance;
    return isar.doctorCollections.where().sortByName().watch(fireImmediately: true).map(
          (cols) => cols.map((c) => Doctor.fromCollection(c)).toList(),
        );
  }

  @override
  Future<int> count() async {
    final isar = db.instance;
    return isar.doctorCollections.count();
  }

  Future<List<Doctor>> getActiveDoctors() async {
    final isar = db.instance;
    final cols = await isar.doctorCollections.filter().isActiveEqualTo(true).sortByName().findAll();
    return cols.map((c) => Doctor.fromCollection(c)).toList();
  }
}

/// Clinic repository implementation.
class ClinicRepository extends BaseRepository<Clinic, ClinicCollection> {
  const ClinicRepository(super.db);

  @override
  Future<List<Clinic>> findAll() async {
    final isar = db.instance;
    final cols = await isar.clinicCollections.where().findAll();
    return cols.map((c) => Clinic.fromCollection(c)).toList();
  }

  @override
  Future<Clinic?> findById(int id) async {
    final isar = db.instance;
    final col = await isar.clinicCollections.get(id);
    return col != null ? Clinic.fromCollection(col) : null;
  }

  @override
  Future<int> create(Clinic item) async {
    final isar = db.instance;
    final col = item.toCollection();
    return isar.writeTxn(() async => await isar.clinicCollections.put(col));
  }

  @override
  Future<void> update(Clinic item) async {
    final isar = db.instance;
    final col = item.toCollection();
    await isar.writeTxn(() async => await isar.clinicCollections.put(col));
  }

  @override
  Future<bool> delete(int id) async {
    final isar = db.instance;
    return isar.writeTxn(() async => await isar.clinicCollections.delete(id));
  }

  @override
  Stream<List<Clinic>> watchAll() {
    final isar = db.instance;
    return isar.clinicCollections.where().watch(fireImmediately: true).map(
          (cols) => cols.map((c) => Clinic.fromCollection(c)).toList(),
        );
  }

  @override
  Future<int> count() async {
    final isar = db.instance;
    return isar.clinicCollections.count();
  }

  Future<Clinic?> getDefaultClinic() async {
    final list = await findAll();
    return list.isNotEmpty ? list.first : null;
  }
}

/// Template repository implementation.
class TemplateRepository extends BaseRepository<Template, TemplateCollection> {
  const TemplateRepository(super.db);

  @override
  Future<List<Template>> findAll() async {
    final isar = db.instance;
    final cols = await isar.templateCollections.where().sortByName().findAll();
    return cols.map((c) => Template.fromCollection(c)).toList();
  }

  @override
  Future<Template?> findById(int id) async {
    final isar = db.instance;
    final col = await isar.templateCollections.get(id);
    return col != null ? Template.fromCollection(col) : null;
  }

  @override
  Future<int> create(Template item) async {
    final isar = db.instance;
    final col = item.toCollection();
    return isar.writeTxn(() async => await isar.templateCollections.put(col));
  }

  @override
  Future<void> update(Template item) async {
    final isar = db.instance;
    final col = item.toCollection();
    await isar.writeTxn(() async => await isar.templateCollections.put(col));
  }

  @override
  Future<bool> delete(int id) async {
    final isar = db.instance;
    return isar.writeTxn(() async => await isar.templateCollections.delete(id));
  }

  @override
  Stream<List<Template>> watchAll() {
    final isar = db.instance;
    return isar.templateCollections.where().sortByName().watch(fireImmediately: true).map(
          (cols) => cols.map((c) => Template.fromCollection(c)).toList(),
        );
  }

  @override
  Future<int> count() async {
    final isar = db.instance;
    return isar.templateCollections.count();
  }

  Future<void> setDefaultTemplate(int templateId) async {
    final all = await findAll();
    for (final t in all) {
      if (t.id != null) {
        final isTarget = t.id == templateId;
        if (t.isDefault != isTarget) {
          await update(t.copyWith(isDefault: isTarget));
        }
      }
    }
  }

  Future<List<Template>> getAll() => findAll();

  Future<void> save(dynamic t) async {
    Template item;
    if (t is ReportTemplate) {
      item = t.toTemplate();
    } else if (t is Template) {
      item = t;
    } else {
      return;
    }
    if (item.id == null || item.id == 0) {
      await create(item);
    } else {
      await update(item);
    }
  }
}

/// Settings repository for key-value storage.
class SettingsRepository {
  final IsarDatabase db;
  const SettingsRepository(this.db);

  Future<String?> getValue(String key) async {
    final isar = db.instance;
    final col = await isar.settingsCollections.filter().keyEqualTo(key).findFirst();
    return col?.value;
  }

  Future<void> setValue(String key, String value) async {
    final isar = db.instance;
    final col = SettingsCollection()
      ..key = key
      ..value = value;
    await isar.writeTxn(() async => await isar.settingsCollections.put(col));
  }

  Stream<String?> watchValue(String key) {
    final isar = db.instance;
    return isar.settingsCollections.filter().keyEqualTo(key).watch(fireImmediately: true).map(
          (cols) => cols.isNotEmpty ? cols.first.value : null,
        );
  }

  Future<AppSettings> getAppSettings() async {
    final prefix = await getValue('serialPrefix') ?? '2026/';
    final nextNumStr = await getValue('nextSerialNumber') ?? '1001';
    final clinicName = await getValue('clinicName') ?? 'SHANTI CLINIC';
    final clinicAddress = await getValue('clinicAddress') ?? '123 Medical Center Way, Health District';
    final docName = await getValue('defaultDoctorName') ?? 'Dr. Rajesh Sharma';
    final docQual = await getValue('doctorQualifications') ?? 'MBBS, MD (General Medicine)';
    final autoBackup = (await getValue('enableAutoBackup')) != 'false';
    final themeMode = await getValue('themeMode') ?? 'light';

    return AppSettings(
      serialPrefix: prefix,
      nextSerialNumber: int.tryParse(nextNumStr) ?? 1001,
      clinicName: clinicName,
      clinicAddress: clinicAddress,
      defaultDoctorName: docName,
      doctorQualifications: docQual,
      enableAutoBackup: autoBackup,
      themeMode: themeMode,
    );
  }

  Future<void> save(AppSettings settings) async {
    await setValue('serialPrefix', settings.serialPrefix);
    await setValue('nextSerialNumber', settings.nextSerialNumber.toString());
    await setValue('clinicName', settings.clinicName);
    await setValue('clinicAddress', settings.clinicAddress);
    await setValue('defaultDoctorName', settings.defaultDoctorName);
    await setValue('doctorQualifications', settings.doctorQualifications);
    await setValue('enableAutoBackup', settings.enableAutoBackup ? 'true' : 'false');
    await setValue('themeMode', settings.themeMode);
  }

  Stream<AppSettings> watchAppSettings() async* {
    yield await getAppSettings();
    final isar = db.instance;
    await for (final _ in isar.settingsCollections.watchLazy()) {
      yield await getAppSettings();
    }
  }
}

/// Master data repository for Lab tests, medical sections, and companies.
class MasterDataRepository {
  final IsarDatabase db;
  const MasterDataRepository(this.db);

  Future<List<LabTest>> getAllLabTests() async {
    final isar = db.instance;
    final cols = await isar.labTestCollections.where().sortByName().findAll();
    return cols.map((c) => LabTest.fromCollection(c)).toList();
  }

  Future<int> saveLabTest(LabTest test) async {
    final isar = db.instance;
    final col = test.toCollection();
    return isar.writeTxn(() async => await isar.labTestCollections.put(col));
  }

  Future<bool> deleteLabTest(int id) async {
    final isar = db.instance;
    return isar.writeTxn(() async => await isar.labTestCollections.delete(id));
  }

  Future<List<Company>> getAllCompanies() async {
    final isar = db.instance;
    final cols = await isar.companyCollections.where().sortByName().findAll();
    return cols.map((c) => Company.fromCollection(c)).toList();
  }

  Future<int> saveCompany(Company company) async {
    final isar = db.instance;
    final col = company.toCollection();
    return isar.writeTxn(() async => await isar.companyCollections.put(col));
  }

  Future<bool> deleteCompany(int id) async {
    final isar = db.instance;
    return isar.writeTxn(() async => await isar.companyCollections.delete(id));
  }

  Stream<List<LabTest>> watchAllLabTests() {
    final isar = db.instance;
    return isar.labTestCollections.where().sortByName().watch(fireImmediately: true).map(
          (cols) => cols.map((c) => LabTest.fromCollection(c)).toList(),
        );
  }

  Stream<List<Company>> watchAllCompanies() {
    final isar = db.instance;
    return isar.companyCollections.where().sortByName().watch(fireImmediately: true).map(
          (cols) => cols.map((c) => Company.fromCollection(c)).toList(),
        );
  }

  Future<List<MasterDataSetup>> getAll() async {
    final settingsRepo = SettingsRepository(db);
    final medHistJson = await settingsRepo.getValue('master_medical_history_options');
    final physExamJson = await settingsRepo.getValue('master_physical_exam_parameters');
    final labTests = await getAllLabTests();

    final defaults = MasterDataSetup.defaults();
    List<String> medHist = defaults.medicalHistoryOptions;
    if (medHistJson != null) {
      try {
        medHist = (jsonDecode(medHistJson) as List).cast<String>();
      } catch (_) {}
    }

    List<String> physExam = defaults.physicalExamParameters;
    if (physExamJson != null) {
      try {
        physExam = (jsonDecode(physExamJson) as List).cast<String>();
      } catch (_) {}
    }

    final finalLabTests = labTests.isNotEmpty ? labTests : defaults.labTests;
    return [
      MasterDataSetup(
        id: 'master',
        medicalHistoryOptions: medHist,
        physicalExamParameters: physExam,
        labTests: finalLabTests,
      )
    ];
  }

  Stream<List<MasterDataSetup>> watchAll() async* {
    yield await getAll();
    final isar = db.instance;
    await for (final _ in isar.labTestCollections.watchLazy()) {
      yield await getAll();
    }
  }

  Future<void> save(MasterDataSetup setup) async {
    final settingsRepo = SettingsRepository(db);
    await settingsRepo.setValue('master_medical_history_options', jsonEncode(setup.medicalHistoryOptions));
    await settingsRepo.setValue('master_physical_exam_parameters', jsonEncode(setup.physicalExamParameters));

    final isar = db.instance;
    await isar.writeTxn(() async {
      await isar.labTestCollections.clear();
      for (final test in setup.labTests) {
        await isar.labTestCollections.put(test.toCollection());
      }
    });
  }
}

/// Audit log repository.
class AuditLogRepository {
  final IsarDatabase db;
  const AuditLogRepository(this.db);

  Future<void> logEvent({
    required String action,
    required String entityType,
    required int entityId,
    required String details,
    String userId = 'system',
  }) async {
    final isar = db.instance;
    final log = AuditLogCollection()
      ..action = action
      ..entityType = entityType
      ..entityId = entityId
      ..userId = userId
      ..details = details
      ..timestamp = DateTime.now();
    await isar.writeTxn(() async => await isar.auditLogCollections.put(log));
  }

  Future<List<AuditLog>> getRecentLogs({int limit = 50}) async {
    final isar = db.instance;
    final cols = await isar.auditLogCollections.where().sortByTimestampDesc().limit(limit).findAll();
    return cols.map((c) => AuditLog.fromCollection(c)).toList();
  }

  Stream<List<AuditLog>> watchAllLogs({int limit = 100}) {
    final isar = db.instance;
    return isar.auditLogCollections.where().sortByTimestampDesc().limit(limit).watch(fireImmediately: true).map(
          (cols) => cols.map((c) => AuditLog.fromCollection(c)).toList(),
        );
  }

  Future<void> clearLogs() async {
    final isar = db.instance;
    await isar.writeTxn(() async => await isar.auditLogCollections.clear());
  }
}
