import 'package:flutter/material.dart';
import 'package:sajid_bazaar/utils/app_colors_util.dart';

class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Order History"),
          backgroundColor: AppColorsUtil.backgroundGreen,
          foregroundColor: AppColorsUtil.foreGroundWhite,
        ),
        body: ListView.separated(
          itemBuilder: (context, index) => Container(
            color: (index % 2 != 0)
                ? AppColorsUtil.backgroundGreen
                : AppColorsUtil.backgroundLightGreen40,
            child: ListTile(
              title: Text(
                "Item name",
                style: TextStyle(
                  color: AppColorsUtil.foreGroundWhite,
                ),
              ),
              subtitle: Text("Item unit price",
                  style: TextStyle(
                    color: AppColorsUtil.foreGroundWhite,
                  )),
              trailing: Text(
                "Total ordered 1000",
                style: TextStyle(
                  color: AppColorsUtil.foreGroundWhite,
                ),
              ),
            ),
          ),
          separatorBuilder: (context, index) => const SizedBox(height: 2),
          itemCount: 20,
        ),
      ),
    );
  }
}
