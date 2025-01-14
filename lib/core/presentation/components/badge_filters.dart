import 'package:flutter/material.dart' hide Badge;
import 'package:flutter_recipe/core/presentation/components/badge.dart';

class BadgeFilters extends StatelessWidget {
  final List<String> items;
  final String selectedItem;
  final void Function(String item) onSelected;

  const BadgeFilters({
    super.key,
    required this.items,
    required this.selectedItem,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: items.expand((item) {
        return [
          GestureDetector(
            onTap: () => onSelected(item),
            child: Badge(
              item,
              isSelected: item == selectedItem,
            ),
          ),
        ];
      }).toList(),
    );
  }
}
