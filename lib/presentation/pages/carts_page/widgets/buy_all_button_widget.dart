import 'package:flutter/material.dart';
import 'package:sajid_bazaar/utils/app_colors_util.dart';

class BuyAllButtonWidget extends StatelessWidget {
  const BuyAllButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      left: 5,
      right: 5,
      child: SizedBox(
        // width: double.infinity,
        child: ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
              AppColorsUtil.backgroundLightGreen40,
            ),
            foregroundColor: WidgetStatePropertyAll(
              AppColorsUtil.foreGroundWhite,
            ),
          ),
          child: const Text("Buy all \$100000"),
        ),
      ),
    );
  }
}
