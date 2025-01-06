import 'package:flutter/material.dart';
import 'package:flutter_recipe/core/presentation/components/button.dart';
import 'package:flutter_recipe/ui/text_styles.dart';

class SplashScreen extends StatelessWidget {
  final VoidCallback onTapStartCooking;

  const SplashScreen({
    super.key,
    required this.onTapStartCooking,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'images/splash_image.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Align(
            child: Column(
              children: [
                const SizedBox(height: 104),
                Image.asset(
                  'images/logo_image.png',
                  width: 79,
                  height: 79,
                ),
                const SizedBox(height: 14),
                Text(
                  '100K+ Premium Recipe',
                  style: TextStyles.mediumTextBold.copyWith(
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: 213,
                  child: Text(
                    'Get Cooking',
                    style: TextStyles.headerTextBold.copyWith(
                      color: Colors.white,
                      fontSize: 48,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Simple way to find Tasty Recipe',
                  style: TextStyles.normalTextRegular.copyWith(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 64),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 66),
                  child: Button(
                    'Start Cooking',
                    onPressed: onTapStartCooking,
                    variant: ButtonVariants.medium,
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
