import 'package:flutter/material.dart';
import 'package:flutter_recipe/core/presentation/components/button.dart';
import 'package:flutter_recipe/core/presentation/components/elevated_icon_button.dart';
import 'package:flutter_recipe/core/presentation/components/input_field.dart';
import 'package:flutter_recipe/ui/color_styles.dart';
import 'package:flutter_recipe/ui/text_styles.dart';
import 'package:flutter_svg/svg.dart';

class SignUpScreen extends StatefulWidget {
  final void Function() onTapSignIn;

  const SignUpScreen({
    super.key,
    required this.onTapSignIn,
  });

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                const Text(
                  'Create an account',
                  style: TextStyles.largeTextBold,
                ),
                const SizedBox(
                  width: 200,
                  child: Text(
                    'Let’s help you set up your account, it won’t take long.',
                    style: TextStyles.smallerTextRegular,
                  ),
                ),
                const SizedBox(height: 20),
                const InputField(
                  label: 'Name',
                  placeHolder: 'Enter Name',
                ),
                const SizedBox(height: 20),
                const InputField(
                  label: 'Email',
                  placeHolder: 'Enter Email',
                ),
                const SizedBox(height: 20),
                const InputField(
                  label: 'Password',
                  placeHolder: 'Enter Password',
                ),
                const SizedBox(height: 20),
                const InputField(
                  label: 'Confirm Password',
                  placeHolder: 'Retype Password',
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Checkbox(
                      value: _isChecked,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      side: const BorderSide(
                        width: 1,
                        color: ColorStyles.secondary100,
                      ),
                      activeColor: ColorStyles.secondary100,
                      onChanged: (value) {
                        setState(() {
                          _isChecked = value!;
                        });
                      },
                    ),
                    Text(
                      'Accept terms & Condition',
                      style: TextStyles.smallerTextRegular.copyWith(
                        color: ColorStyles.secondary100,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 26),
                Button(
                  'Sign Up',
                  onPressed: () {},
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
                      style: TextStyles.smallerTextBold.copyWith(
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
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already a member? ',
                      style: TextStyles.smallerTextBold,
                    ),
                    GestureDetector(
                      onTap: widget.onTapSignIn,
                      child: Text(
                        'Sign In',
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
      ),
    );
  }
}
