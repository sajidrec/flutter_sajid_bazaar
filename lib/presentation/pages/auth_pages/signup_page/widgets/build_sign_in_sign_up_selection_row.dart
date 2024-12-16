import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sajid_bazaar/utils/app_colors_util.dart';

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
          onPressed: () {
            Get.back();
          },
          child: Text(
            "Sign In",
            style: TextStyle(
              color: AppColorsUtil.foreGroundBlack,
              fontSize: 18,
            ),
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {},
          style: ButtonStyle(
            padding: WidgetStateProperty.all(EdgeInsets.zero),
            minimumSize: WidgetStateProperty.all<Size>(Size.zero),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            "Sign Up",
            style: TextStyle(
              color: AppColorsUtil.foreGroundGreen,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
