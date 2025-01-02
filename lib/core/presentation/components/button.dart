import 'package:flutter/material.dart';
import 'package:flutter_recipe/ui/color_styles.dart';
import 'package:flutter_recipe/ui/text_styles.dart';

enum ButtonVariants { big, medium, small }

class Button extends StatefulWidget {
  static const Map<ButtonVariants, double> heightMap = {
    ButtonVariants.big: 60,
    ButtonVariants.medium: 54,
    ButtonVariants.small: 37,
  };

  final String text;
  final ButtonVariants variant;
  final void Function() onPressed;

  const Button(
    this.text, {
    super.key,
    required this.onPressed,
    this.variant = ButtonVariants.small,
  });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          isPressed = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          isPressed = false;
        });
        widget.onPressed();
      },
      // ? 화면 밖으로 나가는 경우
      onTapCancel: () {
        setState(() {
          isPressed = false;
        });
      },
      child: Container(
        height: Button.heightMap[widget.variant],
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isPressed ? ColorStyles.gray4 : ColorStyles.primary100,
        ),
        child: widget.variant == ButtonVariants.small
            ? Center(
                child: Text(
                  widget.text,
                  style: TextStyles.smallerTextBold.copyWith(
                      color: Colors
                          .white // ! copyWith는 런타임에 호출되어 성능에 영향을 미칠 수 있다고 함
                      ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ! Container보다 SizedBox가 성능 면에서 더 좋다고 함
                  SizedBox(
                    width: 114,
                    child: Text(
                      widget.text,
                      style: TextStyles.normalTextBold
                          .copyWith(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: widget.variant == ButtonVariants.big ? 11 : 9,
                  ),
                  const Icon(
                    Icons.arrow_forward,
                    size: 20,
                    color: Colors.white,
                  ),
                ],
              ),
      ),
    );
  }
}
