import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sajid_bazaar/presentation/pages/auth_pages/signup_page/signup_page.dart';
import 'package:sajid_bazaar/presentation/utils/app_colors_util.dart';

class BuildSignInSignUpSelectionRow extends StatelessWidget {
  const BuildSignInSignUpSelectionRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          style: ButtonStyle(
            padding: WidgetStateProperty.all(EdgeInsets.zero),
            minimumSize: WidgetStateProperty.all<Size>(Size.zero),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          onPressed: () {},
          child: Text(
            "Sign In",
            style: TextStyle(
              color: AppColorsUtil.foreGroundGreen,
              fontSize: 18,
            ),
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {
            Get.to(() => const SignupPage());
          },
          style: ButtonStyle(
            padding: WidgetStateProperty.all(EdgeInsets.zero),
            minimumSize: WidgetStateProperty.all<Size>(Size.zero),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            "Sign Up",
            style: TextStyle(
              color: AppColorsUtil.foreGroundBlack,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}