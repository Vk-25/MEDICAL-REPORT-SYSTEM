import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../core/models.dart';
import '../core/providers.dart';
import '../core/theme.dart';
import '../core/utils.dart';
import '../widgets/common_widgets.dart';

/// Report Layout Templates & PDF Structure Designer Page.
class TemplatesPage extends ConsumerStatefulWidget {
  const TemplatesPage({super.key});

  @override
  ConsumerState<TemplatesPage> createState() => _TemplatesPageState();
}

class _TemplatesPageState extends ConsumerState<TemplatesPage> {
  void _showTemplateDialog(BuildContext context, {ReportTemplate? template}) {
    showDialog(
      context: context,
      builder: (context) => _TemplateEditDialog(template: template),
    );
  }

  Future<void> _deleteTemplate(ReportTemplate template) {
    return AppDialog.showConfirmation(
      context: context,
      title: 'Delete Layout Template',
      message: 'Are you sure you want to delete template "${template.name}"? If this is your active default layout, the system will revert to the Standard GAMCA layout.',
      confirmLabel: 'Delete Template',
      isDestructive: true,
    ).then((confirmed) async {
      if (confirmed == true && mounted) {
        await ref.read(templateRepositoryProvider).delete(int.tryParse(template.id) ?? 0);
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Template "${template.name}" deleted.'),
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      }
    });
  }

  Future<void> _setDefaultTemplate(ReportTemplate template) async {
    final all = await ref.read(templateRepositoryProvider).getAll();
    for (final t in all) {
      if (t.isDefault && t.id?.toString() != template.id) {
        await ref.read(templateRepositoryProvider).save(t.copyWith(isDefault: false));
      }
    }
    await ref.read(templateRepositoryProvider).save(template.copyWith(isDefault: true));
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('"${template.name}" is now the active default PDF layout for all new examinations.'),
          behavior: SnackBarBehavior.floating,
          backgroundColor: const Color(0xFF0F766E),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final templatesAsync = ref.watch(templateListProvider);

    return Scaffold(
      body: templatesAsync.when(
        loading: () => const Padding(padding: EdgeInsets.all(32), child: AppLoading(height: 400)),
        error: (err, stack) => Padding(
          padding: const EdgeInsets.all(32),
          child: AppEmptyState(
            icon: Icons.error_outline_rounded,
            title: 'Error Loading Layout Templates',
            message: err.toString(),
            actionLabel: 'Refresh Templates',
            onAction: () => ref.refresh(templateListProvider),
          ),
        ),
        data: (templatesList) {
          final templates = templatesList.map((t) => ReportTemplate.fromTemplate(t)).toList();
          final defaultTemplate = templates.cast<ReportTemplate?>().firstWhere(
            (t) => t?.isDefault == true,
            orElse: () => templates.isNotEmpty ? templates.first : null,
          );

          return SingleChildScrollView(
            padding: const EdgeInsets.all(28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionHeader(
                  title: 'Report Layout Templates & PDF Styling',
                  subtitle: 'Select, customize, and preview structural layout variations for GAMCA / GCC medical certificates',
                  action: ElevatedButton.icon(
                    onPressed: () => _showTemplateDialog(context),
                    icon: const Icon(Icons.add_to_photos_rounded, size: 18),
                    label: const Text('Create Custom Template'),
                  ),
                ),

                // Active Default Banner
                if (defaultTemplate != null) ...[
                  _ActiveTemplateBanner(
                    template: defaultTemplate,
                    onCustomize: () => _showTemplateDialog(context, template: defaultTemplate),
                  ),
                  const SizedBox(height: 28),
                ],

                // Layout Grid
                const SectionHeader(
                  title: 'Available Clinical Layouts',
                  subtitle: 'Click any card to inspect block hierarchy or set as the active default for PDF generation',
                ),
                if (templates.isEmpty)
                  AppCard(
                    child: AppEmptyState(
                      icon: Icons.dashboard_customize_outlined,
                      title: 'No Templates Found',
                      message: 'You have no active layout templates. Click "Create Custom Template" to configure your first layout.',
                      actionLabel: 'Create Custom Template',
                      onAction: () => _showTemplateDialog(context),
                    ),
                  )
                else
                  _buildTemplatesGrid(context, templates),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTemplatesGrid(BuildContext context, List<ReportTemplate> templates) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final crossAxisCount = constraints.maxWidth > 1100
            ? 3
            : constraints.maxWidth > 700
                ? 2
                : 1;

        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: constraints.maxWidth > 1100 ? 1.05 : 1.1,
          ),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: templates.length,
          itemBuilder: (context, index) {
            final template = templates[index];
            return _TemplateCard(
              template: template,
              onSelectDefault: () => _setDefaultTemplate(template),
              onCustomize: () => _showTemplateDialog(context, template: template),
              onDelete: template.isDefault ? null : () => _deleteTemplate(template),
            );
          },
        );
      },
    );
  }
}

class _ActiveTemplateBanner extends StatelessWidget {
  final ReportTemplate template;
  final VoidCallback onCustomize;

  const _ActiveTemplateBanner({required this.template, required this.onCustomize});

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDark;
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isDark
              ? [const Color(0xFF134E4A), const Color(0xFF1E293B)]
              : [const Color(0xFFCCFBF1), const Color(0xFFE0E7FF)],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? const Color(0xFF2DD4BF).withValues(alpha: 0.4) : const Color(0xFF0F766E).withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF0F766E) : Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(color: Colors.black.withValues(alpha: 0.1), blurRadius: 10, offset: const Offset(0, 4)),
              ],
            ),
            child: Icon(
              Icons.verified_rounded,
              size: 32,
              color: isDark ? Colors.white : const Color(0xFF0F766E),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'ACTIVE PDF LAYOUT:',
                      style: context.textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w800,
                        color: isDark ? const Color(0xFF5EEAD4) : const Color(0xFF0F766E),
                        letterSpacing: 1.0,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFF16A34A),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(width: 6, height: 6, decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle)),
                          const SizedBox(width: 6),
                          Text('DEFAULT FOR NEW REPORTS', style: context.textTheme.bodySmall?.copyWith(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  template.name,
                  style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 4),
                Text(
                  'Layout Style: ${template.layoutType.name.toUpperCase()} • Header Title: "${template.headerTitle}" • Clinic: "${template.clinicName}"',
                  style: context.textTheme.bodyMedium?.copyWith(color: context.colorScheme.onSurfaceVariant),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          ElevatedButton.icon(
            onPressed: onCustomize,
            style: ElevatedButton.styleFrom(
              backgroundColor: isDark ? const Color(0xFF2DD4BF) : const Color(0xFF0F766E),
              foregroundColor: isDark ? const Color(0xFF042F2E) : Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            ),
            icon: const Icon(Icons.tune_rounded, size: 18),
            label: const Text('Customize Active Layout'),
          ),
        ],
      ),
    );
  }
}

class _TemplateCard extends StatelessWidget {
  final ReportTemplate template;
  final VoidCallback onSelectDefault;
  final VoidCallback onCustomize;
  final VoidCallback? onDelete;

  const _TemplateCard({
    required this.template,
    required this.onSelectDefault,
    required this.onCustomize,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDark;
    final ext = Theme.of(context).extension<AppThemeExtension>() ?? AppThemeExtension.light;

    return AppCard(
      padding: const EdgeInsets.all(20),
      border: template.isDefault ? Border.all(color: context.colorScheme.primary, width: 2) : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  template.name,
                  style: context.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (template.isDefault)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: ext.statusFitBg,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: ext.statusFitText.withValues(alpha: 0.3)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.check_circle_rounded, size: 14, color: ext.statusFitText),
                      const SizedBox(width: 4),
                      Text('ACTIVE DEFAULT', style: context.textTheme.labelLarge?.copyWith(fontSize: 10, color: ext.statusFitText, fontWeight: FontWeight.bold)),
                    ],
                  ),
                )
              else if (onDelete != null)
                IconButton(
                  icon: Icon(Icons.delete_outline_rounded, size: 18, color: context.colorScheme.error),
                  tooltip: 'Delete Template',
                  onPressed: onDelete,
                ),
            ],
          ),
          const SizedBox(height: 12),

          // Miniature Visual Silhouette of Layout
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isDark ? const Color(0xFF0F172A) : const Color(0xFFF8FAFC),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: context.colorScheme.outline.withValues(alpha: 0.5)),
              ),
              child: Column(
                children: [
                  // Silhouette Header Strip
                  Container(
                    height: 16,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [context.colorScheme.primary, context.colorScheme.secondary]),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Candidate Info Bar
                  Container(
                    height: 12,
                    width: double.infinity,
                    decoration: BoxDecoration(color: context.colorScheme.outline.withValues(alpha: 0.7), borderRadius: BorderRadius.circular(3)),
                  ),
                  const SizedBox(height: 8),
                  // Two-Column Clinical Blocks Silhouette
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: context.colorScheme.outline.withValues(alpha: 0.3),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            padding: const EdgeInsets.all(6),
                            child: Column(
                              children: [
                                Container(height: 6, width: 40, color: context.colorScheme.onSurfaceVariant.withValues(alpha: 0.4)),
                                const SizedBox(height: 4),
                                Container(height: 4, width: double.infinity, color: context.colorScheme.onSurfaceVariant.withValues(alpha: 0.2)),
                                const SizedBox(height: 3),
                                Container(height: 4, width: double.infinity, color: context.colorScheme.onSurfaceVariant.withValues(alpha: 0.2)),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: context.colorScheme.outline.withValues(alpha: 0.3),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            padding: const EdgeInsets.all(6),
                            child: Column(
                              children: [
                                Container(height: 6, width: 40, color: context.colorScheme.onSurfaceVariant.withValues(alpha: 0.4)),
                                const SizedBox(height: 4),
                                Container(height: 4, width: double.infinity, color: context.colorScheme.onSurfaceVariant.withValues(alpha: 0.2)),
                                const SizedBox(height: 3),
                                Container(height: 4, width: double.infinity, color: context.colorScheme.onSurfaceVariant.withValues(alpha: 0.2)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Silhouette Stamp / Signature Footer
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(height: 10, width: 60, color: context.colorScheme.outline.withValues(alpha: 0.7)),
                      Container(
                        height: 16,
                        width: 32,
                        decoration: BoxDecoration(
                          color: const Color(0xFF16A34A).withValues(alpha: 0.4),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 14),

          // Template Metadata & Controls
          Text(
            'Layout: ${template.layoutType.name.toUpperCase()}',
            style: context.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w700, color: context.colorScheme.onSurface),
          ),
          Text(
            'Header: "${template.headerTitle}"',
            style: context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant, fontSize: 11),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: onCustomize,
                  style: OutlinedButton.styleFrom(minimumSize: const Size(0, 38), padding: const EdgeInsets.symmetric(horizontal: 10)),
                  child: const Text('Configure', style: TextStyle(fontSize: 12)),
                ),
              ),
              if (!template.isDefault) ...[
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: onSelectDefault,
                    style: ElevatedButton.styleFrom(minimumSize: const Size(0, 38), padding: const EdgeInsets.symmetric(horizontal: 10)),
                    child: const Text('Set Default', style: TextStyle(fontSize: 12)),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class _TemplateEditDialog extends ConsumerStatefulWidget {
  final ReportTemplate? template;

  const _TemplateEditDialog({this.template});

  @override
  ConsumerState<_TemplateEditDialog> createState() => _TemplateEditDialogState();
}

class _TemplateEditDialogState extends ConsumerState<_TemplateEditDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _headerTitleController;
  late final TextEditingController _clinicNameController;
  late final TextEditingController _clinicAddressController;
  late final TextEditingController _clinicPhoneController;
  late ReportLayoutType _layoutType;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.template?.name ?? '');
    _headerTitleController = TextEditingController(text: widget.template?.headerTitle ?? 'MEDICAL EXAMINATION REPORT');
    _clinicNameController = TextEditingController(text: widget.template?.clinicName ?? 'SHANTI CLINIC');
    _clinicAddressController = TextEditingController(text: widget.template?.clinicAddress ?? '');
    _clinicPhoneController = TextEditingController(text: widget.template?.clinicPhone ?? '');
    _layoutType = widget.template?.layoutType ?? ReportLayoutType.standard;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _headerTitleController.dispose();
    _clinicNameController.dispose();
    _clinicAddressController.dispose();
    _clinicPhoneController.dispose();
    super.dispose();
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    final template = ReportTemplate(
      id: widget.template?.id ?? const Uuid().v4(),
      name: _nameController.text.trim(),
      layoutType: _layoutType,
      headerTitle: _headerTitleController.text.trim().toUpperCase(),
      clinicName: _clinicNameController.text.trim().toUpperCase(),
      clinicAddress: _clinicAddressController.text.trim(),
      clinicPhone: _clinicPhoneController.text.trim(),
      isDefault: widget.template?.isDefault ?? false,
      createdAt: widget.template?.createdAt ?? DateTime.now(),
    );

    await ref.read(templateRepositoryProvider).save(template.toTemplate());
    if (mounted) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(widget.template == null ? 'Created custom layout "${template.name}".' : 'Updated template details.'),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEdit = widget.template != null;

    return AlertDialog(
      titlePadding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      contentPadding: const EdgeInsets.fromLTRB(24, 20, 24, 0),
      actionsPadding: const EdgeInsets.all(24),
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: context.colorScheme.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(isEdit ? Icons.tune_rounded : Icons.add_to_photos_rounded, color: context.colorScheme.primary),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(isEdit ? 'Customize Layout Template' : 'Create Custom Layout', style: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                Text('Configure PDF typography, layout structure, and clinic letterhead', style: context.textTheme.bodySmall?.copyWith(color: context.colorScheme.onSurfaceVariant)),
              ],
            ),
          ),
        ],
      ),
      content: SizedBox(
        width: 620,
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Template Identification & Structure', style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700)),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: 'Template Name *',
                          prefixIcon: Icon(Icons.label_outline_rounded, size: 20),
                        ),
                        validator: (v) => v == null || v.trim().isEmpty ? 'Required' : null,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 2,
                      child: DropdownButtonFormField<ReportLayoutType>(
                        value: _layoutType,
                        decoration: const InputDecoration(
                          labelText: 'Layout Style *',
                          prefixIcon: Icon(Icons.view_quilt_rounded, size: 20),
                        ),
                        items: const [
                          DropdownMenuItem(value: ReportLayoutType.standard, child: Text('Standard GAMCA Layout')),
                          DropdownMenuItem(value: ReportLayoutType.compact, child: Text('Compact 1-Page Summary')),
                          DropdownMenuItem(value: ReportLayoutType.detailed, child: Text('Detailed Clinical Layout')),
                        ],
                        onChanged: (val) {
                          if (val != null) setState(() => _layoutType = val);
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text('PDF Letterhead & Banner Details', style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700)),
                const SizedBox(height: 14),
                TextFormField(
                  controller: _headerTitleController,
                  decoration: const InputDecoration(
                    labelText: 'Document Header Title *',
                    prefixIcon: Icon(Icons.title_rounded, size: 20),
                    hintText: 'e.g., MEDICAL EXAMINATION REPORT FOR GCC / GAMCA',
                  ),
                  textCapitalization: TextCapitalization.characters,
                  validator: (v) => v == null || v.trim().isEmpty ? 'Required' : null,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        controller: _clinicNameController,
                        decoration: const InputDecoration(
                          labelText: 'Clinic / Medical Center Name *',
                          prefixIcon: Icon(Icons.local_hospital_outlined, size: 20),
                        ),
                        textCapitalization: TextCapitalization.characters,
                        validator: (v) => v == null || v.trim().isEmpty ? 'Required' : null,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        controller: _clinicPhoneController,
                        decoration: const InputDecoration(
                          labelText: 'Clinic Phone',
                          prefixIcon: Icon(Icons.phone_outlined, size: 20),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _clinicAddressController,
                  decoration: const InputDecoration(
                    labelText: 'Clinic Address / License Subtitle',
                    prefixIcon: Icon(Icons.location_on_outlined, size: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        OutlinedButton(onPressed: () => Navigator.of(context).pop(), child: const Text('Cancel')),
        ElevatedButton.icon(
          onPressed: _save,
          icon: const Icon(Icons.check_circle_outline_rounded, size: 18),
          label: Text(isEdit ? 'Save Template Changes' : 'Create Template'),
        ),
      ],
    );
  }
}
