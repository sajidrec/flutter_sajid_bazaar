import 'package:flutter/material.dart';
import 'package:sajid_bazaar/utils/app_colors_util.dart';

class OrderHistoryButtonWidget extends StatelessWidget {
  const OrderHistoryButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            AppColorsUtil.backgroundGreen,
          ),
        ),
        onPressed: () {},
        child: Text(
          "Order History",
          style: TextStyle(
            color: AppColorsUtil.foreGroundWhite,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
