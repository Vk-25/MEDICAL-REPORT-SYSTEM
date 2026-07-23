import 'package:flutter/material.dart';
import '../core/models.dart';
import '../core/theme.dart';
import '../core/utils.dart';

/// Standardized hover-interactive Card with smooth elevation and border glow.
class AppCard extends StatefulWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final double? elevation;
  final BorderRadiusGeometry? borderRadius;
  final Border? border;

  const AppCard({
    super.key,
    required this.child,
    this.padding,
    this.onTap,
    this.backgroundColor,
    this.elevation,
    this.borderRadius,
    this.border,
  });

  @override
  State<AppCard> createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final themeExt = Theme.of(context).extension<AppThemeExtension>() ?? AppThemeExtension.light;
    final isDark = context.isDark;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOutCubic,
        decoration: BoxDecoration(
          color: widget.backgroundColor ?? context.theme.cardTheme.color ?? (isDark ? const Color(0xFF1E293B) : Colors.white),
          borderRadius: widget.borderRadius ?? BorderRadius.circular(16),
          border: widget.border ??
              Border.all(
                color: _isHovered && widget.onTap != null
                    ? themeExt.cardHoverBorderColor
                    : themeExt.cardBorderColor,
                width: _isHovered && widget.onTap != null ? 1.5 : 1,
              ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: isDark ? (_isHovered ? 0.35 : 0.2) : (_isHovered ? 0.08 : 0.03)),
              blurRadius: _isHovered ? 16 : 8,
              offset: Offset(0, _isHovered ? 6 : 2),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: (widget.borderRadius ?? BorderRadius.circular(16)) as BorderRadius?,
          child: InkWell(
            onTap: widget.onTap,
            borderRadius: (widget.borderRadius ?? BorderRadius.circular(16)) as BorderRadius?,
            child: Padding(
              padding: widget.padding ?? const EdgeInsets.all(20),
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}

/// Standardized KPI/Statistic metric display card with gradient accent.
class KPICard extends StatelessWidget {
  final String title;
  final String value;
  final String? subtitle;
  final IconData icon;
  final Color color;

  const KPICard({
    super.key,
    required this.title,
    required this.value,
    this.subtitle,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDark;
    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E293B) : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.03),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            // Left vertical accent strip
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              width: 5,
              child: Container(color: color),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 16, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: context.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                            color: isDark ? context.colorScheme.onSurface : const Color(0xFF475569),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: color.withValues(alpha: isDark ? 0.2 : 0.1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(icon, color: color, size: 20),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    value,
                    style: context.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: isDark ? Colors.white : const Color(0xFF0F172A),
                    ),
                  ),
                  if (subtitle != null) ...[
                    const SizedBox(height: 4),
                    Text(
                      subtitle!,
                      style: context.textTheme.bodySmall?.copyWith(
                        color: context.colorScheme.onSurfaceVariant,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Standard dialog wrapper with confirmation and info presets.
class AppDialog {
  AppDialog._();

  static Future<bool?> showConfirmation({
    required BuildContext context,
    required String title,
    required String message,
    String confirmLabel = 'Confirm',
    String cancelLabel = 'Cancel',
    bool isDestructive = false,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
          title: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: (isDestructive ? AppColors.error : AppColors.primaryLight).withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isDestructive ? Icons.warning_amber_rounded : Icons.help_outline_rounded,
                  color: isDestructive ? AppColors.error : AppColors.primaryLight,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(title, style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          content: Text(message, style: context.textTheme.bodyMedium),
          actionsPadding: const EdgeInsets.all(20),
          actions: [
            OutlinedButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(cancelLabel),
            ),
            ElevatedButton(
              style: isDestructive
                  ? ElevatedButton.styleFrom(
                      backgroundColor: AppColors.error,
                      foregroundColor: Colors.white,
                    )
                  : null,
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(confirmLabel),
            ),
          ],
        );
      },
    );
  }
}

/// Reusable Section Header with optional action row.
class SectionHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? action;

  const SectionHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    subtitle!,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ],
            ),
          ),
          ?action,
        ],
      ),
    );
  }
}

/// Standard loading state with shimmering skeleton effect.
class AppLoading extends StatelessWidget {
  final double? height;
  final double? width;

  const AppLoading({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDark;
    return Container(
      height: height ?? 140,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E293B) : const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: isDark ? const Color(0xFF334155) : const Color(0xFFE2E8F0)),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 32,
              height: 32,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation<Color>(context.colorScheme.primary),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Loading Medical Records...',
              style: context.textTheme.bodySmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: context.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Standard empty data state indicator with polished illustration box.
class AppEmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String message;
  final String? actionLabel;
  final VoidCallback? onAction;

  const AppEmptyState({
    super.key,
    required this.icon,
    required this.title,
    required this.message,
    this.actionLabel,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    context.colorScheme.primary.withValues(alpha: 0.15),
                    context.colorScheme.secondary.withValues(alpha: 0.08),
                  ],
                ),
                shape: BoxShape.circle,
                border: Border.all(color: context.colorScheme.primary.withValues(alpha: 0.3)),
              ),
              child: Icon(icon, size: 36, color: context.colorScheme.primary),
            ),
            const SizedBox(height: 16),
            Text(title, style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            SizedBox(
              width: 420,
              child: Text(
                message,
                style: context.textTheme.bodyMedium?.copyWith(color: context.colorScheme.onSurfaceVariant),
                textAlign: TextAlign.center,
              ),
            ),
            if (actionLabel != null && onAction != null) ...[
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: onAction,
                icon: const Icon(Icons.add_circle_outline, size: 18),
                label: Text(actionLabel!),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Status and severity colored chip using AppThemeExtension tokens.
class AppStatusBadge extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color textColor;
  final IconData? icon;

  const AppStatusBadge({
    super.key,
    required this.label,
    required this.backgroundColor,
    required this.textColor,
    this.icon,
  });

  factory AppStatusBadge.fromReportStatus(ReportStatus status, {BuildContext? context}) {
    Color bg = const Color(0xFFF1F5F9);
    Color text = const Color(0xFF475569);
    IconData ic = Icons.edit_note_rounded;

    if (context != null) {
      final ext = Theme.of(context).extension<AppThemeExtension>() ?? AppThemeExtension.light;
      switch (status) {
        case ReportStatus.draft:
          bg = ext.statusDraftBg;
          text = ext.statusDraftText;
          ic = Icons.edit_note_rounded;
          break;
        case ReportStatus.pending:
          bg = ext.statusPendingBg;
          text = ext.statusPendingText;
          ic = Icons.hourglass_top_rounded;
          break;
        case ReportStatus.completed:
          bg = ext.statusFitBg;
          text = ext.statusFitText;
          ic = Icons.check_circle_outline_rounded;
          break;
        case ReportStatus.printed:
          bg = ext.badgeBlueBg;
          text = ext.badgeBlueText;
          ic = Icons.print_rounded;
          break;
      }
    } else {
      switch (status) {
        case ReportStatus.draft:
          bg = const Color(0xFFF1F5F9);
          text = const Color(0xFF475569);
          ic = Icons.edit_note_rounded;
          break;
        case ReportStatus.pending:
          bg = const Color(0xFFFEF3C7);
          text = const Color(0xFFB45309);
          ic = Icons.hourglass_top_rounded;
          break;
        case ReportStatus.completed:
          bg = const Color(0xFFDCFCE7);
          text = const Color(0xFF15803D);
          ic = Icons.check_circle_outline_rounded;
          break;
        case ReportStatus.printed:
          bg = const Color(0xFFE0F2FE);
          text = const Color(0xFF0284C7);
          ic = Icons.print_rounded;
          break;
      }
    }

    return AppStatusBadge(
      label: status.name.toUpperCase(),
      backgroundColor: bg,
      textColor: text,
      icon: ic,
    );
  }

  factory AppStatusBadge.fromResult(String? result, {BuildContext? context}) {
    if (result == null || result.isEmpty) {
      return const AppStatusBadge(
        label: 'PENDING',
        backgroundColor: Color(0xFFF1F5F9),
        textColor: Color(0xFF64748B),
      );
    }
    final upper = result.toUpperCase().trim();
    final isFit = upper.contains('NORMAL') || upper.contains('FIT') || upper.contains('NAD') || upper.contains('NEGATIVE') || upper.contains('NON-REACTIVE');

    if (context != null) {
      final ext = Theme.of(context).extension<AppThemeExtension>() ?? AppThemeExtension.light;
      return AppStatusBadge(
        label: upper,
        backgroundColor: isFit ? ext.statusFitBg : ext.statusUnfitBg,
        textColor: isFit ? ext.statusFitText : ext.statusUnfitText,
        icon: isFit ? Icons.verified_rounded : Icons.report_problem_rounded,
      );
    }

    return AppStatusBadge(
      label: upper,
      backgroundColor: isFit ? const Color(0xFFDCFCE7) : const Color(0xFFFEE2E2),
      textColor: isFit ? const Color(0xFF15803D) : const Color(0xFFB91C1C),
      icon: isFit ? Icons.verified_rounded : Icons.report_problem_rounded,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: textColor.withValues(alpha: 0.25)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14, color: textColor),
            const SizedBox(width: 5),
          ] else ...[
            Container(
              width: 6,
              height: 6,
              decoration: BoxDecoration(color: textColor, shape: BoxShape.circle),
            ),
            const SizedBox(width: 6),
          ],
          Text(
            label,
            style: context.textTheme.labelLarge?.copyWith(
              color: textColor,
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}

/// Navigation breadcrumb trail.
class AppBreadcrumb extends StatelessWidget {
  final List<String> items;
  final ValueChanged<int>? onSelect;

  const AppBreadcrumb({super.key, required this.items, this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(items.length, (index) {
        final isLast = index == items.length - 1;
        return Row(
          children: [
            InkWell(
              onTap: onSelect != null && !isLast ? () => onSelect!(index) : null,
              borderRadius: BorderRadius.circular(4),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                child: Text(
                  items[index],
                  style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: isLast ? FontWeight.w700 : FontWeight.w500,
                    color: isLast ? context.colorScheme.primary : context.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ),
            if (!isLast)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Icon(Icons.chevron_right, size: 16, color: context.colorScheme.onSurfaceVariant),
              ),
          ],
        );
      }),
    );
  }
}
