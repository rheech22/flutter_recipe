import 'package:flutter/material.dart';
import 'package:flutter_recipe/ui/text_styles.dart';
import 'package:flutter_recipe/ui/color_styles.dart';

class SearchField extends StatelessWidget {
  final String placeHolder;
  final TextEditingController? controller;

  const SearchField({
    super.key,
    required this.placeHolder,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            color: ColorStyles.gray4,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: ColorStyles.gray4),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: ColorStyles.primary80),
          ),
          hintText: placeHolder,
          hintStyle: TextStyles.smallTextRegular.copyWith(
            color: ColorStyles.gray4,
          ),
        ),
      ),
    );
  }
}
