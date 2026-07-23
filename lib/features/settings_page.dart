import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../core/config.dart';
import '../core/models.dart';
import '../core/providers.dart';
import '../core/utils.dart';
import '../widgets/common_widgets.dart';

/// System Settings & Operational Preferences Page.
class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _prefixController;
  late TextEditingController _nextSerialController;
  late TextEditingController _clinicNameController;
  late TextEditingController _clinicAddressController;
  late TextEditingController _doctorNameController;
  late TextEditingController _doctorQualController;
  bool _enableAutoBackup = true;
  bool _isDirty = false;

  @override
  void initState() {
    super.initState();
    _prefixController = TextEditingController();
    _nextSerialController = TextEditingController();
    _clinicNameController = TextEditingController();
    _clinicAddressController = TextEditingController();
    _doctorNameController = TextEditingController();
    _doctorQualController = TextEditingController();
  }

  @override
  void dispose() {
    _prefixController.dispose();
    _nextSerialController.dispose();
    _clinicNameController.dispose();
    _clinicAddressController.dispose();
    _doctorNameController.dispose();
    _doctorQualController.dispose();
    super.dispose();
  }

  void _initForm(AppSettings settings) {
    if (_prefixController.text.isEmpty && !_isDirty) {
      _prefixController.text = settings.serialPrefix;
      _nextSerialController.text = settings.nextSerialNumber.toString();
      _clinicNameController.text = settings.clinicName;
      _clinicAddressController.text = settings.clinicAddress;
      _doctorNameController.text = settings.defaultDoctorName;
      _doctorQualController.text = settings.doctorQualifications;
      _enableAutoBackup = settings.enableAutoBackup;
    }
  }

  Future<void> _saveSettings(AppSettings current) async {
    if (!_formKey.currentState!.validate()) return;

    final nextNum = int.tryParse(_nextSerialController.text.trim()) ?? current.nextSerialNumber;
    final updated = current.copyWith(
      serialPrefix: _prefixController.text.trim(),
      nextSerialNumber: nextNum,
      clinicName: _clinicNameController.text.trim(),
      clinicAddress: _clinicAddressController.text.trim(),
      defaultDoctorName: _doctorNameController.text.trim(),
      doctorQualifications: _doctorQualController.text.trim(),
      enableAutoBackup: _enableAutoBackup,
      themeMode: ref.read(themeModeProvider).name,
    );

    await ref.read(settingsRepositoryProvider).save(updated);
    setState(() => _isDirty = false);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('System configuration and serial preferences saved successfully.'),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Color(0xFF0F766E),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final settingsAsync = ref.watch(appSettingsProvider);
    final currentThemeMode = ref.watch(themeModeProvider);

    return Scaffold(
      body: settingsAsync.when(
        loading: () => const Padding(padding: EdgeInsets.all(32), child: AppLoading(height: 400)),
        error: (err, stack) => Padding(
          padding: const EdgeInsets.all(32),
          child: AppEmptyState(
            icon: Icons.error_outline_rounded,
            title: 'Error Loading Settings',
            message: err.toString(),
            actionLabel: 'Reload Settings',
            onAction: () => ref.refresh(appSettingsProvider),
          ),
        ),
        data: (settings) {
          _initForm(settings);

          return Form(
            key: _formKey,
            onChanged: () => setState(() => _isDirty = true),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(28),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionHeader(
                    title: 'System Configuration & Operational Settings',
                    subtitle: 'Configure UI aesthetics, serial number generation rules, and clinical letterhead defaults',
                    action: Row(
                      children: [
                        if (_isDirty)
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                            margin: const EdgeInsets.only(right: 12),
                            decoration: BoxDecoration(
                              color: context.isDark ? const Color(0xFF422006) : const Color(0xFFFEF3C7),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: context.isDark ? const Color(0xFFF59E0B) : const Color(0xFFD97706)),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.edit_attributes_rounded, size: 14, color: context.isDark ? const Color(0xFFFBBF24) : const Color(0xFFB45309)),
                                const SizedBox(width: 4),
                                Text('Unsaved Changes', style: context.textTheme.labelLarge?.copyWith(fontSize: 11, color: context.isDark ? const Color(0xFFFBBF24) : const Color(0xFFB45309))),
                              ],
                            ),
                          ),
                        ElevatedButton.icon(
                          onPressed: () => _saveSettings(settings),
                          icon: const Icon(Icons.save_rounded, size: 18),
                          label: const Text('Save Configuration'),
                        ),
                      ],
                    ),
                  ),

                  // Section 1: UI Theme Choice
                  Text('Interface Appearance & Theme Mode', style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
                  const SizedBox(height: 12),
                  _ThemeSelectionCard(
                    currentMode: currentThemeMode,
                    onChanged: (mode) {
                      ref.read(themeModeProvider.notifier).state = mode;
                      ref.read(settingsRepositoryProvider).setValue('themeMode', mode.name);
                    },
                  ),
                  const SizedBox(height: 28),

                  // Section 2: Serial Number Rules
                  Text('Examination Report Serial Numbering', style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
                  const SizedBox(height: 12),
                  _SerialSettingsCard(
                    prefixController: _prefixController,
                    nextSerialController: _nextSerialController,
                    onChanged: () => setState(() {}),
                  ),
                  const SizedBox(height: 28),

                  // Section 3: Letterhead & Physician Info
                  Text('Official Clinic & Chief Physician Letterhead', style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
                  const SizedBox(height: 12),
                  _ClinicSettingsCard(
                    clinicNameController: _clinicNameController,
                    clinicAddressController: _clinicAddressController,
                    doctorNameController: _doctorNameController,
                    doctorQualController: _doctorQualController,
                  ),
                  const SizedBox(height: 28),

                  // Section 4: Backup Preference Shortcut
                  Text('Automated Storage & Data Health', style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
                  const SizedBox(height: 12),
                  AppCard(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: context.colorScheme.primary.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(Icons.health_and_safety_rounded, color: context.colorScheme.primary, size: 28),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Encrypted Database Backups', style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold)),
                              Text(
                                'Manage daily snapshot policies, verify Isar storage health, and perform restoration or JSON exports.',
                                style: context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant),
                              ),
                            ],
                          ),
                        ),
                        Switch(
                          value: _enableAutoBackup,
                          onChanged: (val) {
                            setState(() {
                              _enableAutoBackup = val;
                              _isDirty = true;
                            });
                          },
                        ),
                        const SizedBox(width: 12),
                        OutlinedButton.icon(
                          onPressed: () => context.go(AppRoutes.backup),
                          icon: const Icon(Icons.launch_rounded, size: 16),
                          label: const Text('Open Backup Center'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _ThemeSelectionCard extends StatelessWidget {
  final ThemeMode currentMode;
  final ValueChanged<ThemeMode> onChanged;

  const _ThemeSelectionCard({required this.currentMode, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          children: [
            Expanded(
              child: _ThemeOptionTile(
                title: 'Light Clinical Mode',
                subtitle: 'High-contrast medical off-white',
                icon: Icons.light_mode_rounded,
                color: const Color(0xFF0F766E),
                isSelected: currentMode == ThemeMode.light,
                onTap: () => onChanged(ThemeMode.light),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _ThemeOptionTile(
                title: 'Dark Slate Mode',
                subtitle: 'Low-glare deep indigo and slate',
                icon: Icons.dark_mode_rounded,
                color: const Color(0xFF4F46E5),
                isSelected: currentMode == ThemeMode.dark,
                onTap: () => onChanged(ThemeMode.dark),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _ThemeOptionTile(
                title: 'System Auto Mode',
                subtitle: 'Syncs with operating system',
                icon: Icons.settings_system_daydream_rounded,
                color: const Color(0xFF0284C7),
                isSelected: currentMode == ThemeMode.system,
                onTap: () => onChanged(ThemeMode.system),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _ThemeOptionTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  const _ThemeOptionTile({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDark;
    return AppCard(
      onTap: onTap,
      padding: const EdgeInsets.all(18),
      backgroundColor: isSelected ? color : null,
      border: Border.all(
        color: isSelected ? color : context.colorScheme.outline.withValues(alpha: 0.4),
        width: isSelected ? 2 : 1,
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isSelected
                  ? Colors.white.withValues(alpha: 0.2)
                  : color.withValues(alpha: isDark ? 0.2 : 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: isSelected ? Colors.white : color, size: 24),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: isSelected ? Colors.white : context.colorScheme.onSurface,
                  ),
                ),
                Text(
                  subtitle,
                  style: context.textTheme.bodySmall?.copyWith(
                    color: isSelected ? Colors.white.withValues(alpha: 0.85) : context.colorScheme.onSurfaceVariant,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            isSelected ? Icons.check_circle_rounded : Icons.circle_outlined,
            color: isSelected ? Colors.white : context.colorScheme.onSurfaceVariant.withValues(alpha: 0.3),
            size: 22,
          ),
        ],
      ),
    );
  }
}

class _SerialSettingsCard extends StatelessWidget {
  final TextEditingController prefixController;
  final TextEditingController nextSerialController;
  final VoidCallback onChanged;

  const _SerialSettingsCard({
    required this.prefixController,
    required this.nextSerialController,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDark;
    final livePreview = '${prefixController.text.trim()}${nextSerialController.text.trim()}';

    return AppCard(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: TextFormField(
                  controller: prefixController,
                  decoration: const InputDecoration(
                    labelText: 'Report Serial Prefix *',
                    prefixIcon: Icon(Icons.qr_code_2_rounded, size: 20),
                    hintText: 'e.g., GAMCA-2026-',
                  ),
                  onChanged: (_) => onChanged(),
                  validator: (v) => v == null || v.trim().isEmpty ? 'Required' : null,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                flex: 1,
                child: TextFormField(
                  controller: nextSerialController,
                  decoration: const InputDecoration(
                    labelText: 'Next Serial Counter *',
                    prefixIcon: Icon(Icons.numbers_rounded, size: 20),
                    hintText: 'e.g., 1001',
                  ),
                  keyboardType: TextInputType.number,
                  onChanged: (_) => onChanged(),
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) return 'Required';
                    if (int.tryParse(v.trim()) == null) return 'Must be valid number';
                    return null;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF0F172A) : const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: context.colorScheme.outline.withValues(alpha: 0.6)),
            ),
            child: Row(
              children: [
                const Icon(Icons.receipt_long_rounded, color: Color(0xFF0F766E)),
                const SizedBox(width: 14),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('LIVE BARCODE SERIAL PREVIEW', style: context.textTheme.labelLarge?.copyWith(fontSize: 10, letterSpacing: 0.8, color: context.colorScheme.onSurfaceVariant)),
                    Text(
                      livePreview.isNotEmpty ? livePreview : 'GAMCA-2026-1001',
                      style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800, fontFamily: 'monospace', color: context.colorScheme.primary),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ClinicSettingsCard extends StatelessWidget {
  final TextEditingController clinicNameController;
  final TextEditingController clinicAddressController;
  final TextEditingController doctorNameController;
  final TextEditingController doctorQualController;

  const _ClinicSettingsCard({
    required this.clinicNameController,
    required this.clinicAddressController,
    required this.doctorNameController,
    required this.doctorQualController,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: clinicNameController,
                  decoration: const InputDecoration(
                    labelText: 'Clinic / Institution Name *',
                    prefixIcon: Icon(Icons.business_rounded, size: 20),
                  ),
                  textCapitalization: TextCapitalization.characters,
                  validator: (v) => v == null || v.trim().isEmpty ? 'Required' : null,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: TextFormField(
                  controller: doctorNameController,
                  decoration: const InputDecoration(
                    labelText: 'Default Chief Physician Name *',
                    prefixIcon: Icon(Icons.medical_information_rounded, size: 20),
                  ),
                  validator: (v) => v == null || v.trim().isEmpty ? 'Required' : null,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: clinicAddressController,
                  decoration: const InputDecoration(
                    labelText: 'Clinic Address & Accreditation Line *',
                    prefixIcon: Icon(Icons.location_city_rounded, size: 20),
                  ),
                  validator: (v) => v == null || v.trim().isEmpty ? 'Required' : null,
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: TextFormField(
                  controller: doctorQualController,
                  decoration: const InputDecoration(
                    labelText: 'Physician Qualifications & Reg # *',
                    prefixIcon: Icon(Icons.workspace_premium_rounded, size: 20),
                  ),
                  validator: (v) => v == null || v.trim().isEmpty ? 'Required' : null,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
