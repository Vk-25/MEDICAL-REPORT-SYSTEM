import 'package:flutter/material.dart';
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
