import 'package:flutter/material.dart';
import 'package:flutter_recipe/ui/color_styles.dart';
import 'package:flutter_recipe/ui/text_styles.dart';

enum BadgeVariants { text, rating }

class Badge extends StatelessWidget {
  final String text;
  final BadgeVariants variant;
  final bool isSelected;

  const Badge(
    this.text, {
    super.key,
    this.variant = BadgeVariants.text,
    this.isSelected = false,
  });

  @override
  build(BuildContext context) {
    return Chip(
      backgroundColor: isSelected ? ColorStyles.primary100 : ColorStyles.white,
      side: BorderSide(
        color: isSelected ? ColorStyles.white : ColorStyles.primary80,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyles.smallTextRegular.copyWith(
              color: isSelected ? ColorStyles.white : ColorStyles.primary80,
            ),
          ),
          if (variant == BadgeVariants.rating) ...[
            SizedBox(width: 5),
            Icon(
              Icons.star,
              size: 18,
              color: isSelected ? ColorStyles.white : ColorStyles.primary80,
            ),
          ],
        ],
      ),
    );
  }
}
