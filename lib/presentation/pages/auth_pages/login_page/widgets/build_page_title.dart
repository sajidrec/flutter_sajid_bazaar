import 'package:flutter/material.dart';
import 'package:sajid_bazaar/presentation/utils/app_colors_util.dart';

class BuildPageTitle extends StatelessWidget {
  const BuildPageTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Sign In to Sajid Bazaar",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 26,
          ),
        ),
        Text(
          "Enter email and password to continue",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: AppColorsUtil.foreGroundGray,
          ),
        ),
      ],
    );
  }
}
