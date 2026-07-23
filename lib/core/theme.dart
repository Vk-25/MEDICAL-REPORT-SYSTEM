import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Enterprise Healthcare Color Palette & Tokens.
class AppColors {
  AppColors._();

  // Primary palette (Deep Medical Teal & Indigo Accent)
  static const Color primaryLight = Color(0xFF0F766E); // Deep Teal
  static const Color primaryContainerLight = Color(0xFFCCFBF1); // Soft Teal Tint
  static const Color onPrimaryLight = Color(0xFFFFFFFF);
  static const Color onPrimaryContainerLight = Color(0xFF115E59);

  static const Color primaryDark = Color(0xFF2DD4BF); // Luminous Teal
  static const Color primaryContainerDark = Color(0xFF134E4A);
  static const Color onPrimaryDark = Color(0xFF042F2E);
  static const Color onPrimaryContainerDark = Color(0xFFF0FDFA);

  // Secondary Accent (Warm Indigo)
  static const Color secondaryLight = Color(0xFF4F46E5);
  static const Color secondaryContainerLight = Color(0xFFE0E7FF);
  static const Color onSecondaryLight = Color(0xFFFFFFFF);
  static const Color onSecondaryContainerLight = Color(0xFF3730A3);

  static const Color secondaryDark = Color(0xFF818CF8);
  static const Color secondaryContainerDark = Color(0xFF312E81);
  static const Color onSecondaryDark = Color(0xFF1E1B4B);
  static const Color onSecondaryContainerDark = Color(0xFFEEF2FF);

  // Surface & Backgrounds (Warm off-white for light, deep slate for dark)
  static const Color surfaceLight = Color(0xFFF8FAFC);
  static const Color cardLight = Color(0xFFFFFFFF);
  static const Color onSurfaceLight = Color(0xFF0F172A);
  static const Color onSurfaceVariantLight = Color(0xFF64748B);
  static const Color outlineLight = Color(0xFFE2E8F0);

  static const Color surfaceDark = Color(0xFF0B1120);
  static const Color cardDark = Color(0xFF1E293B);
  static const Color onSurfaceDark = Color(0xFFF1F5F9);
  static const Color onSurfaceVariantDark = Color(0xFF94A3B8);
  static const Color outlineDark = Color(0xFF334155);

  // Status & Severity Colors (Sophisticated clinical tints)
  static const Color success = Color(0xFF16A34A);
  static const Color successLight = Color(0xFFDCFCE7);
  static const Color error = Color(0xFFDC2626);
  static const Color errorLight = Color(0xFFFEE2E2);
  static const Color warning = Color(0xFFD97706);
  static const Color warningLight = Color(0xFFFEF3C7);
  static const Color info = Color(0xFF0284C7);
  static const Color infoLight = Color(0xFFE0F2FE);

  // Chart & KPI Palette
  static const List<Color> chartColors = [
    Color(0xFF0F766E), // Teal
    Color(0xFF4F46E5), // Indigo
    Color(0xFFD97706), // Amber
    Color(0xFF16A34A), // Emerald
    Color(0xFFDC2626), // Ruby
    Color(0xFF9333EA), // Purple
    Color(0xFF0284C7), // Sky Blue
  ];
}

/// Custom Theme Extension for enterprise status colors and rich UI tokens.
class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  final Color statusFitBg;
  final Color statusFitText;
  final Color statusUnfitBg;
  final Color statusUnfitText;
  final Color statusPendingBg;
  final Color statusPendingText;
  final Color statusDraftBg;
  final Color statusDraftText;
  final Color tableHeaderBg;

  // New visual styling tokens
  final Color cardBorderColor;
  final Color cardHoverBorderColor;
  final Color sidebarGradientStart;
  final Color sidebarGradientEnd;
  final Color sidebarText;
  final Color sidebarTextSelected;
  final Color topBarBackground;

  // Rich badge color pairs
  final Color badgeTealBg;
  final Color badgeTealText;
  final Color badgeAmberBg;
  final Color badgeAmberText;
  final Color badgePurpleBg;
  final Color badgePurpleText;
  final Color badgeOrangeBg;
  final Color badgeOrangeText;
  final Color badgeBlueBg;
  final Color badgeBlueText;

  const AppThemeExtension({
    required this.statusFitBg,
    required this.statusFitText,
    required this.statusUnfitBg,
    required this.statusUnfitText,
    required this.statusPendingBg,
    required this.statusPendingText,
    required this.statusDraftBg,
    required this.statusDraftText,
    required this.tableHeaderBg,
    required this.cardBorderColor,
    required this.cardHoverBorderColor,
    required this.sidebarGradientStart,
    required this.sidebarGradientEnd,
    required this.sidebarText,
    required this.sidebarTextSelected,
    required this.topBarBackground,
    required this.badgeTealBg,
    required this.badgeTealText,
    required this.badgeAmberBg,
    required this.badgeAmberText,
    required this.badgePurpleBg,
    required this.badgePurpleText,
    required this.badgeOrangeBg,
    required this.badgeOrangeText,
    required this.badgeBlueBg,
    required this.badgeBlueText,
  });

  static const light = AppThemeExtension(
    statusFitBg: Color(0xFFDCFCE7),
    statusFitText: Color(0xFF15803D),
    statusUnfitBg: Color(0xFFFEE2E2),
    statusUnfitText: Color(0xFFB91C1C),
    statusPendingBg: Color(0xFFFEF3C7),
    statusPendingText: Color(0xFFB45309),
    statusDraftBg: Color(0xFFF1F5F9),
    statusDraftText: Color(0xFF475569),
    tableHeaderBg: Color(0xFFF8FAFC),
    cardBorderColor: Color(0xFFE2E8F0),
    cardHoverBorderColor: Color(0xFF0F766E),
    sidebarGradientStart: Color(0xFF0F172A),
    sidebarGradientEnd: Color(0xFF1E293B),
    sidebarText: Color(0xFF94A3B8),
    sidebarTextSelected: Color(0xFFFFFFFF),
    topBarBackground: Color(0xFFFFFFFF),
    badgeTealBg: Color(0xFFCCFBF1),
    badgeTealText: Color(0xFF0F766E),
    badgeAmberBg: Color(0xFFFEF3C7),
    badgeAmberText: Color(0xFFD97706),
    badgePurpleBg: Color(0xFFF3E8FF),
    badgePurpleText: Color(0xFF7E22CE),
    badgeOrangeBg: Color(0xFFFFEDD5),
    badgeOrangeText: Color(0xFFC2410C),
    badgeBlueBg: Color(0xFFE0F2FE),
    badgeBlueText: Color(0xFF0284C7),
  );

  static const dark = AppThemeExtension(
    statusFitBg: Color(0xFF14532D),
    statusFitText: Color(0xFF86EFAC),
    statusUnfitBg: Color(0xFF7F1D1D),
    statusUnfitText: Color(0xFFFCA5A5),
    statusPendingBg: Color(0xFF78350F),
    statusPendingText: Color(0xFFFDE68A),
    statusDraftBg: Color(0xFF334155),
    statusDraftText: Color(0xFFCBD5E1),
    tableHeaderBg: Color(0xFF1E293B),
    cardBorderColor: Color(0xFF334155),
    cardHoverBorderColor: Color(0xFF2DD4BF),
    sidebarGradientStart: Color(0xFF020617),
    sidebarGradientEnd: Color(0xFF0F172A),
    sidebarText: Color(0xFF94A3B8),
    sidebarTextSelected: Color(0xFF2DD4BF),
    topBarBackground: Color(0xFF1E293B),
    badgeTealBg: Color(0xFF134E4A),
    badgeTealText: Color(0xFF5EEAD4),
    badgeAmberBg: Color(0xFF78350F),
    badgeAmberText: Color(0xFFFDE68A),
    badgePurpleBg: Color(0xFF581C87),
    badgePurpleText: Color(0xFFD8B4FE),
    badgeOrangeBg: Color(0xFF7C2D12),
    badgeOrangeText: Color(0xFFFDBA74),
    badgeBlueBg: Color(0xFF0C4A6E),
    badgeBlueText: Color(0xFF7DD3FC),
  );

  @override
  AppThemeExtension copyWith({
    Color? statusFitBg,
    Color? statusFitText,
    Color? statusUnfitBg,
    Color? statusUnfitText,
    Color? statusPendingBg,
    Color? statusPendingText,
    Color? statusDraftBg,
    Color? statusDraftText,
    Color? tableHeaderBg,
    Color? cardBorderColor,
    Color? cardHoverBorderColor,
    Color? sidebarGradientStart,
    Color? sidebarGradientEnd,
    Color? sidebarText,
    Color? sidebarTextSelected,
    Color? topBarBackground,
    Color? badgeTealBg,
    Color? badgeTealText,
    Color? badgeAmberBg,
    Color? badgeAmberText,
    Color? badgePurpleBg,
    Color? badgePurpleText,
    Color? badgeOrangeBg,
    Color? badgeOrangeText,
    Color? badgeBlueBg,
    Color? badgeBlueText,
  }) {
    return AppThemeExtension(
      statusFitBg: statusFitBg ?? this.statusFitBg,
      statusFitText: statusFitText ?? this.statusFitText,
      statusUnfitBg: statusUnfitBg ?? this.statusUnfitBg,
      statusUnfitText: statusUnfitText ?? this.statusUnfitText,
      statusPendingBg: statusPendingBg ?? this.statusPendingBg,
      statusPendingText: statusPendingText ?? this.statusPendingText,
      statusDraftBg: statusDraftBg ?? this.statusDraftBg,
      statusDraftText: statusDraftText ?? this.statusDraftText,
      tableHeaderBg: tableHeaderBg ?? this.tableHeaderBg,
      cardBorderColor: cardBorderColor ?? this.cardBorderColor,
      cardHoverBorderColor: cardHoverBorderColor ?? this.cardHoverBorderColor,
      sidebarGradientStart: sidebarGradientStart ?? this.sidebarGradientStart,
      sidebarGradientEnd: sidebarGradientEnd ?? this.sidebarGradientEnd,
      sidebarText: sidebarText ?? this.sidebarText,
      sidebarTextSelected: sidebarTextSelected ?? this.sidebarTextSelected,
      topBarBackground: topBarBackground ?? this.topBarBackground,
      badgeTealBg: badgeTealBg ?? this.badgeTealBg,
      badgeTealText: badgeTealText ?? this.badgeTealText,
      badgeAmberBg: badgeAmberBg ?? this.badgeAmberBg,
      badgeAmberText: badgeAmberText ?? this.badgeAmberText,
      badgePurpleBg: badgePurpleBg ?? this.badgePurpleBg,
      badgePurpleText: badgePurpleText ?? this.badgePurpleText,
      badgeOrangeBg: badgeOrangeBg ?? this.badgeOrangeBg,
      badgeOrangeText: badgeOrangeText ?? this.badgeOrangeText,
      badgeBlueBg: badgeBlueBg ?? this.badgeBlueBg,
      badgeBlueText: badgeBlueText ?? this.badgeBlueText,
    );
  }

  @override
  AppThemeExtension lerp(ThemeExtension<AppThemeExtension>? other, double t) {
    if (other is! AppThemeExtension) return this;
    return AppThemeExtension(
      statusFitBg: Color.lerp(statusFitBg, other.statusFitBg, t)!,
      statusFitText: Color.lerp(statusFitText, other.statusFitText, t)!,
      statusUnfitBg: Color.lerp(statusUnfitBg, other.statusUnfitBg, t)!,
      statusUnfitText: Color.lerp(statusUnfitText, other.statusUnfitText, t)!,
      statusPendingBg: Color.lerp(statusPendingBg, other.statusPendingBg, t)!,
      statusPendingText: Color.lerp(statusPendingText, other.statusPendingText, t)!,
      statusDraftBg: Color.lerp(statusDraftBg, other.statusDraftBg, t)!,
      statusDraftText: Color.lerp(statusDraftText, other.statusDraftText, t)!,
      tableHeaderBg: Color.lerp(tableHeaderBg, other.tableHeaderBg, t)!,
      cardBorderColor: Color.lerp(cardBorderColor, other.cardBorderColor, t)!,
      cardHoverBorderColor: Color.lerp(cardHoverBorderColor, other.cardHoverBorderColor, t)!,
      sidebarGradientStart: Color.lerp(sidebarGradientStart, other.sidebarGradientStart, t)!,
      sidebarGradientEnd: Color.lerp(sidebarGradientEnd, other.sidebarGradientEnd, t)!,
      sidebarText: Color.lerp(sidebarText, other.sidebarText, t)!,
      sidebarTextSelected: Color.lerp(sidebarTextSelected, other.sidebarTextSelected, t)!,
      topBarBackground: Color.lerp(topBarBackground, other.topBarBackground, t)!,
      badgeTealBg: Color.lerp(badgeTealBg, other.badgeTealBg, t)!,
      badgeTealText: Color.lerp(badgeTealText, other.badgeTealText, t)!,
      badgeAmberBg: Color.lerp(badgeAmberBg, other.badgeAmberBg, t)!,
      badgeAmberText: Color.lerp(badgeAmberText, other.badgeAmberText, t)!,
      badgePurpleBg: Color.lerp(badgePurpleBg, other.badgePurpleBg, t)!,
      badgePurpleText: Color.lerp(badgePurpleText, other.badgePurpleText, t)!,
      badgeOrangeBg: Color.lerp(badgeOrangeBg, other.badgeOrangeBg, t)!,
      badgeOrangeText: Color.lerp(badgeOrangeText, other.badgeOrangeText, t)!,
      badgeBlueBg: Color.lerp(badgeBlueBg, other.badgeBlueBg, t)!,
      badgeBlueText: Color.lerp(badgeBlueText, other.badgeBlueText, t)!,
    );
  }
}

/// Enterprise typography scale combining Plus Jakarta Sans headings and Inter body.
class AppTypography {
  AppTypography._();

  static TextTheme textTheme(ColorScheme colorScheme) {
    final baseInter = GoogleFonts.interTextTheme();
    final baseJakarta = GoogleFonts.plusJakartaSansTextTheme();

    return baseInter.copyWith(
      displayLarge: baseJakarta.displayLarge?.copyWith(fontSize: 32, fontWeight: FontWeight.w800, color: colorScheme.onSurface, letterSpacing: -0.5),
      headlineMedium: baseJakarta.headlineMedium?.copyWith(fontSize: 24, fontWeight: FontWeight.w700, color: colorScheme.onSurface, letterSpacing: -0.3),
      titleLarge: baseJakarta.titleLarge?.copyWith(fontSize: 20, fontWeight: FontWeight.w700, color: colorScheme.onSurface),
      titleMedium: baseJakarta.titleMedium?.copyWith(fontSize: 16, fontWeight: FontWeight.w600, color: colorScheme.onSurface),
      bodyLarge: baseInter.bodyLarge?.copyWith(fontSize: 16, fontWeight: FontWeight.w400, color: colorScheme.onSurface),
      bodyMedium: baseInter.bodyMedium?.copyWith(fontSize: 14, fontWeight: FontWeight.w400, color: colorScheme.onSurface),
      bodySmall: baseInter.bodySmall?.copyWith(fontSize: 12, fontWeight: FontWeight.w400, color: colorScheme.onSurfaceVariant),
      labelLarge: baseInter.labelLarge?.copyWith(fontSize: 14, fontWeight: FontWeight.w600, color: colorScheme.onSurface),
    );
  }
}

/// Complete enterprise light & dark ThemeData definitions with premium UI polish.
class AppTheme {
  AppTheme._();

  static ThemeData light() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.primaryLight,
      primary: AppColors.primaryLight,
      primaryContainer: AppColors.primaryContainerLight,
      onPrimary: AppColors.onPrimaryLight,
      onPrimaryContainer: AppColors.onPrimaryContainerLight,
      secondary: AppColors.secondaryLight,
      secondaryContainer: AppColors.secondaryContainerLight,
      onSecondary: AppColors.onSecondaryLight,
      onSecondaryContainer: AppColors.onSecondaryContainerLight,
      surface: AppColors.surfaceLight,
      onSurface: AppColors.onSurfaceLight,
      onSurfaceVariant: AppColors.onSurfaceVariantLight,
      outline: AppColors.outlineLight,
      error: AppColors.error,
      brightness: Brightness.light,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.surfaceLight,
      textTheme: AppTypography.textTheme(colorScheme),
      extensions: const [AppThemeExtension.light],
      cardTheme: CardThemeData(
        color: AppColors.cardLight,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: AppColors.outlineLight, width: 1),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.cardLight,
        elevation: 0,
        scrolledUnderElevation: 0.5,
        centerTitle: false,
        iconTheme: const IconThemeData(color: AppColors.onSurfaceLight),
        titleTextStyle: GoogleFonts.plusJakartaSans(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: AppColors.onSurfaceLight,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.cardLight,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.outlineLight)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.outlineLight)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.primaryLight, width: 2)),
        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.error)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryLight,
          foregroundColor: AppColors.onPrimaryLight,
          elevation: 0,
          minimumSize: const Size(0, 46),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          textStyle: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primaryLight,
          minimumSize: const Size(0, 46),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          side: const BorderSide(color: AppColors.primaryLight, width: 1.5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          textStyle: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primaryLight,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.cardLight,
        elevation: 12,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  static ThemeData dark() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.primaryDark,
      primary: AppColors.primaryDark,
      primaryContainer: AppColors.primaryContainerDark,
      onPrimary: AppColors.onPrimaryDark,
      onPrimaryContainer: AppColors.onPrimaryContainerDark,
      secondary: AppColors.secondaryDark,
      secondaryContainer: AppColors.secondaryContainerDark,
      onSecondary: AppColors.onSecondaryDark,
      onSecondaryContainer: AppColors.onSecondaryContainerDark,
      surface: AppColors.surfaceDark,
      onSurface: AppColors.onSurfaceDark,
      onSurfaceVariant: AppColors.onSurfaceVariantDark,
      outline: AppColors.outlineDark,
      error: AppColors.errorLight,
      brightness: Brightness.dark,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: AppColors.surfaceDark,
      textTheme: AppTypography.textTheme(colorScheme),
      extensions: const [AppThemeExtension.dark],
      cardTheme: CardThemeData(
        color: AppColors.cardDark,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: AppColors.outlineDark, width: 1),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.cardDark,
        elevation: 0,
        scrolledUnderElevation: 0.5,
        centerTitle: false,
        iconTheme: const IconThemeData(color: AppColors.onSurfaceDark),
        titleTextStyle: GoogleFonts.plusJakartaSans(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: AppColors.onSurfaceDark,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.cardDark,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.outlineDark)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.outlineDark)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.primaryDark, width: 2)),
        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppColors.errorLight)),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryDark,
          foregroundColor: AppColors.onPrimaryDark,
          elevation: 0,
          minimumSize: const Size(0, 46),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          textStyle: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: AppColors.primaryDark,
          minimumSize: const Size(0, 46),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          side: const BorderSide(color: AppColors.primaryDark, width: 1.5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          textStyle: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primaryDark,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          textStyle: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600),
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: AppColors.cardDark,
        elevation: 12,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
    );
  }
}
