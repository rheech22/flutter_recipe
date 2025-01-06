import 'package:flutter/material.dart';
import 'package:flutter_recipe/core/presentation/components/button.dart';
import 'package:flutter_recipe/core/presentation/components/elevated_icon_button.dart';
import 'package:flutter_recipe/core/presentation/components/input_field.dart';
import 'package:flutter_recipe/ui/text_styles.dart';
import 'package:flutter_recipe/ui/color_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SigninScreen extends StatelessWidget {
  final VoidCallback onTapSignIn;
  final VoidCallback onTabSignUp;

  const SigninScreen({
    super.key,
    required this.onTapSignIn,
    required this.onTabSignUp,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              const Text('Hello,', style: TextStyles.headerTextBold),
              const Text('Welcome Back!', style: TextStyles.largeTextRegular),
              const SizedBox(height: 57),
              const InputField(
                label: 'Email',
                placeHolder: 'Enter Email',
              ),
              const SizedBox(height: 30),
              const InputField(
                label: 'Password',
                placeHolder: 'Enter Password',
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Text(
                  'Forgot Password?',
                  style: TextStyles.smallerTextRegular.copyWith(
                    color: ColorStyles.secondary100,
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Button(
                'Sign In',
                variant: ButtonVariants.large,
                onPressed: onTapSignIn,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50,
                    height: 1,
                    color: ColorStyles.gray4,
                  ),
                  const SizedBox(width: 7),
                  Text(
                    'Or Sign in With',
                    style: TextStyles.smallerTextRegular.copyWith(
                      color: ColorStyles.gray4,
                    ),
                  ),
                  const SizedBox(width: 7),
                  Container(
                    width: 50,
                    height: 1,
                    color: ColorStyles.gray4,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                spacing: 25,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedIconButton(
                    onPressed: () {
                      print('Google Sign In');
                    },
                    icon: SvgPicture.asset('icons/google_icon.svg'),
                  ),
                  ElevatedIconButton(
                    onPressed: () {
                      print('Facebook Sign In');
                    },
                    icon: SvgPicture.asset('icons/facebook_icon.svg'),
                  ),
                ],
              ),
              const SizedBox(height: 55),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 4,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: TextStyles.smallerTextBold.copyWith(
                      color: ColorStyles.black,
                    ),
                  ),
                  GestureDetector(
                    onTap: onTabSignUp,
                    child: Text(
                      'Sign up',
                      style: TextStyles.smallerTextBold.copyWith(
                        color: ColorStyles.secondary100,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
