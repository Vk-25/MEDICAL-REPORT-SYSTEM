import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:window_manager/window_manager.dart';
import 'app.dart';
import 'core/config.dart';
import 'core/database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Window Manager for Windows/macOS/Linux Desktop
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    await windowManager.ensureInitialized();
    const windowOptions = WindowOptions(
      size: Size(AppConfig.defaultWindowWidth, AppConfig.defaultWindowHeight),
      minimumSize: Size(AppConfig.minWindowWidth, AppConfig.minWindowHeight),
      center: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      title: '${AppConfig.appName} - v${AppConfig.version}',
    );
    await windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.maximize();
      await windowManager.show();
      await windowManager.focus();
    });
  }

  // Pre-initialize Isar database singleton
  try {
    await IsarDatabase().init();
  } catch (e) {
    debugPrint('Database initialization warning or error: $e');
  }

  runApp(
    const ProviderScope(
      child: MedicalReportApp(),
    ),
  );
}
