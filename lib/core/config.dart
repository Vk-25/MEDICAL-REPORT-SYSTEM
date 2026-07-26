import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/shell.dart';
import '../features/dashboard_page.dart';
import '../features/report_form_page.dart';
import '../features/report_preview_page.dart';
import '../features/report_history_page.dart';
import '../features/patients_page.dart';
import '../features/templates_page.dart';
import '../features/template_designer_page.dart';
import '../features/master_data_page.dart';
import '../features/settings_page.dart';
import '../features/backup_page.dart';

/// Application configuration constants.
class AppConfig {
  AppConfig._();

  static const String appName = 'Medical Report System';
  static const String appSubtitle = 'Enterprise Occupational Health Platform';
  static const String version = '1.0.0';
  static const int buildNumber = 1;

  static const double minWindowWidth = 1200.0;
  static const double minWindowHeight = 800.0;
  static const double defaultWindowWidth = 1440.0;
  static const double defaultWindowHeight = 900.0;

  static const Duration autoSaveInterval = Duration(seconds: 30);
  static const String defaultSerialFormat = 'YYYY/NNNN';
}

/// Route paths constants.
class AppRoutes {
  AppRoutes._();

  static const String dashboard = '/dashboard';
  static const String reportGenerate = '/reports/generate';
  static const String reportPreview = '/reports/preview/:id';
  static const String reportHistory = '/reports/history';
  static const String patients = '/patients';
  static const String templates = '/templates';
  static const String templateDesigner = '/templates/designer/:id';
  static const String masterData = '/master-data';
  static const String settings = '/settings';
  static const String backup = '/backup';
}

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

/// Main GoRouter definition with ShellRoute wrapping navigation rail destinations.
final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: AppRoutes.dashboard,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return AppShell(currentLocation: state.uri.toString(), child: child);
      },
      routes: [
        GoRoute(
          path: AppRoutes.dashboard,
          builder: (context, state) => const DashboardPage(),
        ),
        GoRoute(
          path: AppRoutes.reportGenerate,
          builder: (context, state) => const ReportFormPage(),
        ),
        GoRoute(
          path: AppRoutes.reportHistory,
          builder: (context, state) => const ReportHistoryPage(),
        ),
        GoRoute(
          path: AppRoutes.patients,
          builder: (context, state) => const PatientsPage(),
        ),
        GoRoute(
          path: AppRoutes.templates,
          builder: (context, state) => const TemplatesPage(),
        ),
        GoRoute(
          path: AppRoutes.templateDesigner,
          builder: (context, state) {
            final id = state.pathParameters['id'] ?? 'new';
            return TemplateDesignerPage(templateId: id);
          },
        ),
        GoRoute(
          path: AppRoutes.masterData,
          builder: (context, state) => const MasterDataPage(),
        ),
        GoRoute(
          path: AppRoutes.settings,
          builder: (context, state) => const SettingsPage(),
        ),
        GoRoute(
          path: AppRoutes.backup,
          builder: (context, state) => const BackupPage(),
        ),
      ],
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: AppRoutes.reportPreview,
      builder: (context, state) {
        final id = state.pathParameters['id'] ?? 'new';
        return ReportPreviewPage(reportId: id);
      },
    ),
  ],
);
