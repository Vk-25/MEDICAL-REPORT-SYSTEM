import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'database.dart';
import 'models.dart';
import 'repositories.dart';
import '../services/pdf_service.dart';
import '../services/export_service.dart';

/// Singleton instance of IsarDatabase service.
final isarDatabaseProvider = Provider<IsarDatabase>((ref) {
  return IsarDatabase();
});

/// Async initializer ensuring the Isar database is open before repositories are accessed.
final isarInitProvider = FutureProvider<Isar>((ref) async {
  final dbService = ref.watch(isarDatabaseProvider);
  return await dbService.init();
});

// ------------------- REPOSITORY PROVIDERS -------------------

final patientRepositoryProvider = Provider<PatientRepository>((ref) {
  return PatientRepository(ref.watch(isarDatabaseProvider));
});

final reportRepositoryProvider = Provider<ReportRepository>((ref) {
  return ReportRepository(ref.watch(isarDatabaseProvider));
});

final doctorRepositoryProvider = Provider<DoctorRepository>((ref) {
  return DoctorRepository(ref.watch(isarDatabaseProvider));
});

final clinicRepositoryProvider = Provider<ClinicRepository>((ref) {
  return ClinicRepository(ref.watch(isarDatabaseProvider));
});

final templateRepositoryProvider = Provider<TemplateRepository>((ref) {
  return TemplateRepository(ref.watch(isarDatabaseProvider));
});

final settingsRepositoryProvider = Provider<SettingsRepository>((ref) {
  return SettingsRepository(ref.watch(isarDatabaseProvider));
});

final masterDataRepositoryProvider = Provider<MasterDataRepository>((ref) {
  return MasterDataRepository(ref.watch(isarDatabaseProvider));
});

final auditLogRepositoryProvider = Provider<AuditLogRepository>((ref) {
  return AuditLogRepository(ref.watch(isarDatabaseProvider));
});

// ------------------- SERVICE PROVIDERS -------------------

final pdfServiceProvider = Provider<PdfService>((ref) {
  return PdfService();
});

final exportServiceProvider = Provider<ExportService>((ref) {
  return ExportService();
});

// ------------------- STATE PROVIDERS -------------------

final themeModeProvider = StateProvider<ThemeMode>((ref) {
  return ThemeMode.system;
});

final searchQueryProvider = StateProvider<String>((ref) {
  return '';
});

// ------------------- STREAM/REACTIVE DATA PROVIDERS -------------------

final patientListProvider = StreamProvider<List<Patient>>((ref) {
  final repo = ref.watch(patientRepositoryProvider);
  return repo.watchAll();
});

final reportListProvider = StreamProvider<List<Report>>((ref) {
  final repo = ref.watch(reportRepositoryProvider);
  return repo.watchAll();
});

final doctorListProvider = StreamProvider<List<Doctor>>((ref) {
  final repo = ref.watch(doctorRepositoryProvider);
  return repo.watchAll();
});

final clinicListProvider = StreamProvider<List<Clinic>>((ref) {
  final repo = ref.watch(clinicRepositoryProvider);
  return repo.watchAll();
});

final labTestListProvider = StreamProvider<List<LabTest>>((ref) {
  final repo = ref.watch(masterDataRepositoryProvider);
  return repo.watchAllLabTests();
});

final companyListProvider = StreamProvider<List<Company>>((ref) {
  final repo = ref.watch(masterDataRepositoryProvider);
  return repo.watchAllCompanies();
});

final templateListProvider = StreamProvider<List<Template>>((ref) {
  final repo = ref.watch(templateRepositoryProvider);
  return repo.watchAll();
});

final auditLogListProvider = StreamProvider<List<AuditLog>>((ref) {
  final repo = ref.watch(auditLogRepositoryProvider);
  return repo.watchAllLogs();
});

final appSettingsProvider = StreamProvider<AppSettings>((ref) {
  final repo = ref.watch(settingsRepositoryProvider);
  return repo.watchAppSettings();
});

final masterDataListProvider = StreamProvider<List<MasterDataSetup>>((ref) {
  final repo = ref.watch(masterDataRepositoryProvider);
  return repo.watchAll();
});

