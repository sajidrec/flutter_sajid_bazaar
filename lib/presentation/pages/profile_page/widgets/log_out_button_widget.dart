import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sajid_bazaar/presentation/controllers/profile_page_controller.dart';
import 'package:sajid_bazaar/presentation/pages/auth_pages/login_page/login_page.dart';
import 'package:sajid_bazaar/utils/app_colors_util.dart';

class LogOutButtonWidget extends StatelessWidget {
  const LogOutButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(
            AppColorsUtil.backgroundRed,
          ),
        ),
        onPressed: () {
          Get.defaultDialog(
            title: "You sure want to logout?",
            middleText: "",
            confirm: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  AppColorsUtil.backgroundRed,
                ),
              ),
              onPressed: () async {
                await Get.find<ProfilePageController>().logout();
                Get.offAll(() => const LoginPage());
              },
              child: Text(
                "Yes",
                style: TextStyle(
                  color: AppColorsUtil.foreGroundWhite,
                ),
              ),
            ),
            cancel: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  AppColorsUtil.backgroundGreen,
                ),
              ),
              onPressed: () {
                Get.back();
              },
              child: Text(
                "NO",
                style: TextStyle(
                  color: AppColorsUtil.foreGroundWhite,
                ),
              ),
            ),
          );
        },
        child: Text(
          "Log out",
          style: TextStyle(
            color: AppColorsUtil.foreGroundWhite,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
