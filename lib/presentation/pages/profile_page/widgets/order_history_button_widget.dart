import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sajid_bazaar/presentation/pages/order_history_page/order_history_page.dart';
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
        onPressed: () {
          Get.to(() => const OrderHistoryPage());
        },
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
