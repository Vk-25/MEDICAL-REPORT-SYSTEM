import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'core/config.dart';
import 'core/theme.dart';
import 'core/providers.dart';

class MedicalReportApp extends ConsumerWidget {
  const MedicalReportApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<dynamic>>(appSettingsProvider, (previous, next) {
      if (next.hasValue && next.value != null) {
        final settings = next.value!;
        final savedModeStr = settings.themeMode;
        final savedMode = ThemeMode.values.firstWhere(
          (e) => e.name == savedModeStr,
          orElse: () => ThemeMode.light,
        );
        if (ref.read(themeModeProvider) != savedMode) {
          ref.read(themeModeProvider.notifier).state = savedMode;
        }
      }
    });

    final themeMode = ref.watch(themeModeProvider);

    return MaterialApp.router(
      title: AppConfig.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: themeMode,
      routerConfig: appRouter,
      builder: (context, child) => ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: const [
          Breakpoint(start: 0, end: 768, name: MOBILE),
          Breakpoint(start: 769, end: 1199, name: TABLET),
          Breakpoint(start: 1200, end: 1920, name: DESKTOP),
          Breakpoint(start: 1921, end: double.infinity, name: '4K'),
        ],
      ),
    );
  }
}
