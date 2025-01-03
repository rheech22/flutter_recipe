import 'package:flutter/material.dart';
import 'package:flutter_recipe/ui/color_styles.dart';
import 'package:flutter_recipe/ui/text_styles.dart';

class InputField extends StatelessWidget {
  final String placeHolder;
  final String label;
  final TextEditingController? controller;

  const InputField({
    super.key,
    required this.label,
    required this.placeHolder,
    this.controller,
  });

  @override
  build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyles.smallTextRegular,
        ),
        SizedBox(height: 5),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: placeHolder,
            hintStyle: TextStyles.smallTextRegular.copyWith(
              color: ColorStyles.gray4,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: ColorStyles.gray4,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: ColorStyles.primary80,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
