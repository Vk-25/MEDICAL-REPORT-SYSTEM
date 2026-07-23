import 'dart:io';
import 'package:isar/isar.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

/// Service responsible for managing database backups and snapshots.
class BackupService {
  const BackupService();

  Future<Directory> _getBackupDir() async {
    final dir = await getApplicationDocumentsDirectory();
    final backupPath = Directory('${dir.path}/MedicalReportSystem/backups');
    if (!await backupPath.exists()) {
      await backupPath.create(recursive: true);
    }
    return backupPath;
  }

  /// Retrieves all available backup `.isar` files sorted by last modified descending.
  Future<List<File>> getAvailableBackups() async {
    final dir = await _getBackupDir();
    final entities = await dir.list().toList();
    final files = entities.whereType<File>().where((f) => f.path.endsWith('.isar')).toList();
    files.sort((a, b) => b.lastModifiedSync().compareTo(a.lastModifiedSync()));
    return files;
  }

  /// Creates a new backup snapshot from the running Isar instance.
  Future<File> createBackup(Isar isar) async {
    final dir = await _getBackupDir();
    final timestamp = DateTime.now().toIso8601String().replaceAll(':', '-').split('.').first;
    final fileName = 'snapshot_$timestamp.isar';
    final targetPath = p.join(dir.path, fileName);

    await isar.copyToFile(targetPath);
    return File(targetPath);
  }

  /// Restores database from the selected snapshot file.
  Future<void> restoreBackup(Isar isar, File backupFile) async {
    if (!await backupFile.exists()) {
      throw Exception('Selected backup file no longer exists.');
    }
    
    // Get the database directory path
    final dbDir = isar.directory;
    if (dbDir == null) {
      throw Exception('Could not determine database directory.');
    }
    
    // Close the current Isar instance (requires app restart to re-initialize)
    await isar.close();
    
    // Copy backup file to the database location
    final dbFile = File(p.join(dbDir, 'default.isar'));
    await backupFile.copy(dbFile.path);
  }

  /// Deletes a specific backup snapshot file from disk.
  Future<void> deleteBackup(File file) async {
    if (await file.exists()) {
      await file.delete();
    }
  }
}
