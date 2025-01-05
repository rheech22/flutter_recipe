import 'package:flutter/material.dart';
import 'package:flutter_recipe/ui/color_styles.dart';

class ElevatedIconButton extends StatelessWidget {
  final void Function() onPressed;
  final Widget icon;

  const ElevatedIconButton({
    super.key,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.15),
            blurRadius: 3,
            spreadRadius: 0,
            offset: Offset(
              0,
              0,
            ),
          ),
        ],
      ),
      child: IconButton(
        padding: EdgeInsets.all(10),
        style: IconButton.styleFrom(
          backgroundColor: ColorStyles.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          onPressed();
        },
        icon: icon,
      ),
    );
  }
}

