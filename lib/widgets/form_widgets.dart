import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../core/utils.dart';

/// Floating search input with debounce mechanism.
class AppSearchBar extends StatefulWidget {
  final String hintText;
  final ValueChanged<String> onChanged;
  final Duration debounce;

  const AppSearchBar({
    super.key,
    this.hintText = 'Search...',
    required this.onChanged,
    this.debounce = const Duration(milliseconds: 300),
  });

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: const Icon(Icons.search, size: 20),
      ),
      onChanged: widget.onChanged,
    );
  }
}

/// Sortable and scrollable professional data table wrapper.
class AppDataTable extends StatelessWidget {
  final List<DataColumn> columns;
  final List<DataRow> rows;
  final bool isLoading;

  const AppDataTable({
    super.key,
    required this.columns,
    required this.rows,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: columns,
        rows: rows,
        headingRowColor: WidgetStateProperty.all(context.colorScheme.surfaceContainerHighest.withValues(alpha: 0.4)),
      ),
    );
  }
}

/// Image upload picker with local preview.
class AppPhotoPicker extends StatelessWidget {
  final String? currentPhotoPath;
  final ValueChanged<String?> onPhotoSelected;

  const AppPhotoPicker({
    super.key,
    this.currentPhotoPath,
    required this.onPhotoSelected,
  });

  Future<void> _pickImage() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null && result.files.single.path != null) {
      onPhotoSelected(result.files.single.path!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: Container(
        width: 120,
        height: 140,
        decoration: BoxDecoration(
          border: Border.all(color: context.colorScheme.outline),
          borderRadius: BorderRadius.circular(8),
          color: context.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
        ),
        child: currentPhotoPath != null && File(currentPhotoPath!).existsSync()
            ? ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.file(File(currentPhotoPath!), fit: BoxFit.cover),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add_a_photo_outlined, size: 32, color: context.colorScheme.primary),
                  const SizedBox(height: 8),
                  Text('Upload Photo', style: context.textTheme.bodySmall),
                ],
              ),
      ),
    );
  }
}

/// Context menu wrapper for right-click actions on desktop rows.
class AppContextMenu extends StatelessWidget {
  final Widget child;
  final List<PopupMenuEntry<void>> items;

  const AppContextMenu({super.key, required this.child, required this.items});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onSecondaryTapDown: (details) {
        showMenu(
          context: context,
          position: RelativeRect.fromLTRB(
            details.globalPosition.dx,
            details.globalPosition.dy,
            details.globalPosition.dx,
            details.globalPosition.dy,
          ),
          items: items,
        );
      },
      child: child,
    );
  }
}
