import 'package:flutter/material.dart';
import 'package:flutter_recipe/ui/color_styles.dart';
import 'package:flutter_recipe/ui/text_styles.dart';

class Tablist extends StatefulWidget {
  final List<String> labels;
  final void Function(int index) onPressed;
  final int initialIndex;
  final double height;
  final double spacing;

  const Tablist({
    super.key,
    required this.labels,
    required this.onPressed,
    this.initialIndex = 0,
    this.height = 33.0,
    this.spacing = 7.0,
  });

  @override
  State<Tablist> createState() => _TablistState();
}

class _TablistState extends State<Tablist> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex;
  }

  void _onPressed(int index) {
    widget.onPressed(index);
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: widget.spacing,
      children: [
        ...List.generate(widget.labels.length, (index) {
          return Expanded(
            child: GestureDetector(
              onTap: () => _onPressed(index),
              child: _TabItem(
                label: widget.labels[index],
                color: index == selectedIndex
                    ? ColorStyles.primary100
                    : ColorStyles.white,
                height: widget.height,
              ),
            ),
          );
        }),
      ],
    );
  }
}

class _TabItem extends StatelessWidget {
  final String label;
  final Color color;
  final double height;

  const _TabItem({
    required this.label,
    required this.color,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyles.smallerTextBold.copyWith(
            color: color == ColorStyles.white
                ? ColorStyles.primary80
                : ColorStyles.white,
          ),
        ),
      ),
    );
  }
}
