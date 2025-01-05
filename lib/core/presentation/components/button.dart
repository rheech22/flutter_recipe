import 'package:flutter/material.dart';
import 'package:flutter_recipe/ui/color_styles.dart';
import 'package:flutter_recipe/ui/text_styles.dart';

enum ButtonVariants { large, medium, small, rating }

enum ButtonColors { primary, rating }

class ButtonProperties {
  final double height;
  final Color color;
  final TextStyle font;
  final double borderRadius;
  final bool showArrow;

  const ButtonProperties({
    required this.height,
    required this.color,
    required this.font,
    required this.borderRadius,
    required this.showArrow,
  });
}

class Button extends StatefulWidget {
  static const Map<ButtonVariants, ButtonProperties> variantMap = {
    ButtonVariants.large: ButtonProperties(
      height: 60,
      color: ColorStyles.primary100,
      font: TextStyles.normalTextBold,
      borderRadius: 10,
      showArrow: true,
    ),
    ButtonVariants.medium: ButtonProperties(
      height: 54,
      color: ColorStyles.primary100,
      font: TextStyles.normalTextBold,
      borderRadius: 10,
      showArrow: true,
    ),
    ButtonVariants.small: ButtonProperties(
      height: 37,
      color: ColorStyles.primary100,
      font: TextStyles.smallerTextBold,
      borderRadius: 10,
      showArrow: false,
    ),
    ButtonVariants.rating: ButtonProperties(
      height: 20,
      color: ColorStyles.rating,
      font: TextStyles.smallerTextLabel,
      borderRadius: 6,
      showArrow: false,
    ),
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
    // https://dart.dev/null-safety/understanding-null-safety#the-map-index-operator-is-nullable
    final properties = Button.variantMap[widget.variant]!;

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
      // NOTE: 화면 밖으로 나가는 경우
      onTapCancel: () {
        setState(() {
          isPressed = false;
        });
      },
      child: Container(
        height: properties.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(properties.borderRadius),
          color: isPressed ? ColorStyles.gray4 : properties.color,
        ),
        child: properties.showArrow
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // NOTE: Container보다 SizedBox가 성능 면에서 더 좋다고 함
                  Text(
                    widget.text,
                    style: properties.font.copyWith(color: Colors.white),
                  ),
                  SizedBox(
                    width: widget.variant == ButtonVariants.large ? 40 : 38,
                  ),
                  const Icon(
                    Icons.arrow_forward,
                    size: 20,
                    color: Colors.white,
                  ),
                ],
              )
            : Center(
                child: Text(
                  widget.text,
                  style: properties.font.copyWith(
                    color: Colors
                        .white, // NOTE: copyWith는 런타임에 호출되어 성능에 영향을 미칠 수 있다고 함
                  ),
                ),
              ),
      ),
    );
  }
}
