import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../core/config.dart';
import '../core/providers.dart';
import '../core/theme.dart';
import '../core/utils.dart';

/// Main navigation shell with custom gradient sidebar, glassmorphic top bar, and content area.
class AppShell extends ConsumerStatefulWidget {
  final String currentLocation;
  final Widget child;

  const AppShell({super.key, required this.currentLocation, required this.child});

  @override
  ConsumerState<AppShell> createState() => _AppShellState();
}

class _AppShellState extends ConsumerState<AppShell> {
  bool _isRailExpanded = true;

  void _toggleRail() {
    setState(() {
      _isRailExpanded = !_isRailExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          AppNavigationRail(
            currentLocation: widget.currentLocation,
            isExpanded: _isRailExpanded,
            onToggle: _toggleRail,
          ),
          Expanded(
            child: Column(
              children: [
                AppTopBar(currentLocation: widget.currentLocation, onToggleSidebar: _toggleRail),
                Expanded(
                  child: Container(
                    color: context.colorScheme.surface,
                    child: widget.child,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SidebarItem {
  final String label;
  final IconData icon;
  final IconData selectedIcon;
  final String route;
  final String? group;

  const _SidebarItem({
    required this.label,
    required this.icon,
    required this.selectedIcon,
    required this.route,
    this.group,
  });
}

/// Custom Gradient Navigation Sidebar with grouped destinations and animated selection pill.
class AppNavigationRail extends StatelessWidget {
  final String currentLocation;
  final bool isExpanded;
  final VoidCallback onToggle;

  const AppNavigationRail({
    super.key,
    required this.currentLocation,
    required this.isExpanded,
    required this.onToggle,
  });

  static const List<_SidebarItem> _items = [
    _SidebarItem(
      label: 'Dashboard',
      icon: Icons.dashboard_outlined,
      selectedIcon: Icons.dashboard,
      route: AppRoutes.dashboard,
      group: 'MAIN WORKSPACE',
    ),
    _SidebarItem(
      label: 'New Examination',
      icon: Icons.add_circle_outline,
      selectedIcon: Icons.add_circle,
      route: AppRoutes.reportGenerate,
    ),
    _SidebarItem(
      label: 'Report Archive',
      icon: Icons.folder_shared_outlined,
      selectedIcon: Icons.folder_shared,
      route: AppRoutes.reportHistory,
      group: 'CLINICAL RECORDS',
    ),
    _SidebarItem(
      label: 'Candidate Directory',
      icon: Icons.people_outline,
      selectedIcon: Icons.people,
      route: AppRoutes.patients,
    ),
    _SidebarItem(
      label: 'Layout Templates',
      icon: Icons.description_outlined,
      selectedIcon: Icons.description,
      route: AppRoutes.templates,
    ),
    _SidebarItem(
      label: 'Master Data Setup',
      icon: Icons.dataset_outlined,
      selectedIcon: Icons.dataset,
      route: AppRoutes.masterData,
      group: 'SYSTEM & CONFIG',
    ),
    _SidebarItem(
      label: 'System Settings',
      icon: Icons.settings_outlined,
      selectedIcon: Icons.settings,
      route: AppRoutes.settings,
    ),
    _SidebarItem(
      label: 'Backup & Health',
      icon: Icons.health_and_safety_outlined,
      selectedIcon: Icons.health_and_safety,
      route: AppRoutes.backup,
    ),
  ];

  bool _isSelected(_SidebarItem item) {
    if (item.route == AppRoutes.dashboard) return currentLocation == AppRoutes.dashboard;
    if (item.route == AppRoutes.reportGenerate) return currentLocation.startsWith('/reports/generate') || currentLocation.startsWith('/reports/preview');
    if (item.route == AppRoutes.reportHistory) return currentLocation.startsWith('/reports/history');
    return currentLocation.startsWith(item.route);
  }

  @override
  Widget build(BuildContext context) {
    final themeExt = Theme.of(context).extension<AppThemeExtension>() ?? AppThemeExtension.light;
    final isDark = context.isDark;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 240),
      curve: Curves.easeInOutCubic,
      width: isExpanded ? 260 : 80,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            themeExt.sidebarGradientStart,
            themeExt.sidebarGradientEnd,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.4 : 0.08),
            blurRadius: 16,
            offset: const Offset(2, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header / Brand Area
          Container(
            height: 64,
            padding: EdgeInsets.symmetric(horizontal: isExpanded ? 20 : 16),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.white.withValues(alpha: 0.08),
                  width: 1,
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: isExpanded ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
              children: [
                if (isExpanded)
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      child: SizedBox(
                        width: 160,
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [Color(0xFF2DD4BF), Color(0xFF0F766E)],
                                ),
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFF0F766E).withValues(alpha: 0.4),
                                    blurRadius: 8,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: const Icon(Icons.local_hospital, color: Colors.white, size: 20),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // TODO: Fetch clinic name from settings
                                  Text(
                                    'SHANTI CLINIC',
                                    style: context.textTheme.titleSmall?.copyWith(
                                      fontWeight: FontWeight.w800,
                                      color: Colors.white,
                                      letterSpacing: 0.8,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    'Enterprise EMR v1.0',
                                    style: context.textTheme.bodySmall?.copyWith(
                                      color: themeExt.sidebarText.withValues(alpha: 0.7),
                                      fontSize: 10,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                IconButton(
                  icon: Icon(
                    isExpanded ? Icons.menu_open_rounded : Icons.menu_rounded,
                    color: Colors.white.withValues(alpha: 0.8),
                  ),
                  onPressed: onToggle,
                  tooltip: isExpanded ? 'Collapse Sidebar' : 'Expand Sidebar',
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // Navigation Items List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              itemCount: _items.length,
              itemBuilder: (context, index) {
                final item = _items[index];
                final selected = _isSelected(item);

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (item.group != null && isExpanded) ...[
                      Padding(
                        padding: const EdgeInsets.only(left: 12, top: 16, bottom: 8),
                        child: Text(
                          item.group!,
                          style: context.textTheme.bodySmall?.copyWith(
                            color: themeExt.sidebarText.withValues(alpha: 0.55),
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ),
                    ] else if (item.group != null && !isExpanded && index != 0) ...[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Divider(color: Colors.white.withValues(alpha: 0.1), height: 1),
                      ),
                    ],
                    _SidebarTile(
                      item: item,
                      isSelected: selected,
                      isExpanded: isExpanded,
                      onTap: () => context.go(item.route),
                    ),
                  ],
                );
              },
            ),
          ),

          // Footer Profile Info
          if (isExpanded)
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const NeverScrollableScrollPhysics(),
                child: SizedBox(
                  width: 200,
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          const CircleAvatar(
                            radius: 18,
                            backgroundColor: Color(0xFF0F766E),
                            child: Text('DS', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12)),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Container(
                              width: 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: const Color(0xFF22C55E),
                                shape: BoxShape.circle,
                                border: Border.all(color: const Color(0xFF0F172A), width: 1.5),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // TODO: Fetch doctor name from settings
                            Text(
                              'Dr. A. Sharma',
                              style: context.textTheme.bodyMedium?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              'Chief Medical Officer',
                              style: context.textTheme.bodySmall?.copyWith(
                                color: themeExt.sidebarText.withValues(alpha: 0.7),
                                fontSize: 11,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _SidebarTile extends StatefulWidget {
  final _SidebarItem item;
  final bool isSelected;
  final bool isExpanded;
  final VoidCallback onTap;

  const _SidebarTile({
    required this.item,
    required this.isSelected,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  State<_SidebarTile> createState() => _SidebarTileState();
}

class _SidebarTileState extends State<_SidebarTile> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final themeExt = Theme.of(context).extension<AppThemeExtension>() ?? AppThemeExtension.light;

    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onTap,
            borderRadius: BorderRadius.circular(12),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              padding: EdgeInsets.symmetric(
                horizontal: widget.isExpanded ? 14 : 0,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                color: widget.isSelected
                    ? const Color(0xFF0F766E).withValues(alpha: 0.85)
                    : _isHovered
                        ? Colors.white.withValues(alpha: 0.08)
                        : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
                boxShadow: widget.isSelected
                    ? [
                        BoxShadow(
                          color: const Color(0xFF0F766E).withValues(alpha: 0.4),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ]
                    : null,
              ),
              child: Row(
                mainAxisAlignment: widget.isExpanded ? MainAxisAlignment.start : MainAxisAlignment.center,
                children: [
                  Icon(
                    widget.isSelected ? widget.item.selectedIcon : widget.item.icon,
                    size: 22,
                    color: widget.isSelected
                        ? Colors.white
                        : _isHovered
                            ? Colors.white
                            : themeExt.sidebarText,
                  ),
                  if (widget.isExpanded) ...[
                    const SizedBox(width: 14),
                    Expanded(
                      child: Text(
                        widget.item.label,
                        style: context.textTheme.bodyMedium?.copyWith(
                          fontWeight: widget.isSelected ? FontWeight.w700 : FontWeight.w500,
                          color: widget.isSelected
                              ? Colors.white
                              : _isHovered
                                  ? Colors.white
                                  : themeExt.sidebarText,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (widget.isSelected)
                      Container(
                        width: 6,
                        height: 6,
                        decoration: const BoxDecoration(
                          color: Color(0xFF5EEAD4),
                          shape: BoxShape.circle,
                        ),
                      ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Glassmorphic Top Bar featuring dynamic breadcrumbs, frosted search input, and quick tools.
class AppTopBar extends ConsumerWidget {
  final String currentLocation;
  final VoidCallback onToggleSidebar;

  const AppTopBar({super.key, required this.currentLocation, required this.onToggleSidebar});

  String _getTitle() {
    if (currentLocation == AppRoutes.dashboard) return 'Occupational Health Dashboard';
    if (currentLocation.startsWith('/reports/generate')) return 'GAMCA Medical Report Generator';
    if (currentLocation.startsWith('/reports/preview')) return 'Report PDF Verification & Print';
    if (currentLocation.startsWith('/reports/history')) return 'Report Archives & Audit History';
    if (currentLocation.startsWith(AppRoutes.patients)) return 'Patient Directory & Candidates';
    if (currentLocation.startsWith(AppRoutes.templates)) return 'Report Layout Templates';
    if (currentLocation.startsWith(AppRoutes.masterData)) return 'Master Data Setup & Catalog';
    if (currentLocation.startsWith(AppRoutes.settings)) return 'System Configuration & Preferences';
    if (currentLocation.startsWith(AppRoutes.backup)) return 'Database Snapshot & Health Center';
    return 'Enterprise Medical Report System';
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeModeProvider);
    final isDark = themeMode == ThemeMode.dark || (themeMode == ThemeMode.system && context.isDark);
    final themeExt = Theme.of(context).extension<AppThemeExtension>() ?? AppThemeExtension.light;

    return Container(
      height: 68,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: themeExt.topBarBackground,
        border: Border(
          bottom: BorderSide(color: context.colorScheme.outline, width: 1),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.2 : 0.03),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _getTitle(),
                  style: context.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: context.colorScheme.onSurface,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  'Shanti Clinic EMR • Medical Examination Portal',
                  style: context.textTheme.bodySmall?.copyWith(
                    fontSize: 11,
                    color: context.colorScheme.onSurfaceVariant,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),

          // Frosted Search Field
          Flexible(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 320),
              height: 42,
              decoration: BoxDecoration(
                color: isDark ? context.colorScheme.surfaceContainer : const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: context.colorScheme.outline.withValues(alpha: 0.6)),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Quick Search (Ctrl+F) candidate, serial #...',
                  hintStyle: context.textTheme.bodySmall?.copyWith(fontSize: 12),
                  prefixIcon: Icon(Icons.search_rounded, size: 18, color: context.colorScheme.onSurfaceVariant),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),
                ),
                onChanged: (value) {
                  ref.read(searchQueryProvider.notifier).state = value;
                },
              ),
            ),
          ),
          const SizedBox(width: 16),

          // Quick Action Tools
          Container(
            decoration: BoxDecoration(
              color: isDark ? context.colorScheme.surfaceContainer : const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: context.colorScheme.outline.withValues(alpha: 0.6)),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(
                    isDark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                    size: 20,
                    color: isDark ? const Color(0xFFFDE68A) : const Color(0xFF0F766E),
                  ),
                  tooltip: isDark ? 'Switch to Light Mode' : 'Switch to Dark Mode',
                  onPressed: () {
                    final newMode = isDark ? ThemeMode.light : ThemeMode.dark;
                    ref.read(themeModeProvider.notifier).state = newMode;
                    ref.read(settingsRepositoryProvider).setValue('themeMode', newMode.name);
                  },
                ),
                Container(width: 1, height: 24, color: context.colorScheme.outline),
                IconButton(
                  icon: Icon(Icons.notifications_outlined, size: 20, color: context.colorScheme.onSurfaceVariant),
                  tooltip: 'System Alerts & Notifications',
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('No pending clinical alerts or urgent system notifications.'),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: context.colorScheme.inverseSurface,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
