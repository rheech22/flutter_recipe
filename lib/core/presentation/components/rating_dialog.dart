import 'package:flutter/material.dart';
import 'package:flutter_recipe/core/presentation/components/button.dart';
import 'package:flutter_recipe/ui/color_styles.dart';
import 'package:flutter_recipe/ui/text_styles.dart';

class RatingDialog extends StatefulWidget {
  final int initialRating;
  final void Function(int rating) onSendPressed;

  const RatingDialog({
    super.key,
    required this.initialRating,
    required this.onSendPressed,
  });

  @override
  State<RatingDialog> createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {
  final int fixedWidth = 170;
  int _rating = 0;

  @override
  void initState() {
    super.initState();
    _rating = widget.initialRating;
  }

  void _onIconTapDown(int index) {
    setState(() {
      _rating = index + 1;
    });
  }

  void _onSendPressed() {
    widget.onSendPressed(_rating);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      backgroundColor: ColorStyles.white,
      titlePadding: const EdgeInsets.only(top: 10),
      contentPadding: const EdgeInsets.symmetric(vertical: 7),
      actionsPadding: const EdgeInsets.only(bottom: 10),
      insetPadding: EdgeInsets.symmetric(
        horizontal: (MediaQuery.of(context).size.width - fixedWidth) / 2,
      ),
      title: Center(
        child: Text(
          'Rate Recipe',
          style: TextStyles.smallTextRegular,
        ),
      ),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: List.generate(
          5,
          (index) => GestureDetector(
            onTapDown: (_) {
              _onIconTapDown(index);
            },
            child: Icon(
              index < _rating ? Icons.star : Icons.star_border,
              color: ColorStyles.rating,
              size: 20,
            ),
          ),
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 61,
              child: Button(
                'Send',
                variant: ButtonVariants.rating,
                onPressed: () {
                  _onSendPressed();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
