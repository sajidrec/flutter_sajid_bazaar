import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sajid_bazaar/utils/app_colors_util.dart';

Future<void> appExitDialog() async {
  return await Get.defaultDialog(
    title: "You want to exit?",
    cancel: TextButton(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          AppColorsUtil.backgroundGreen,
        ),
        foregroundColor: WidgetStatePropertyAll(
          AppColorsUtil.foreGroundWhite,
        ),
      ),
      onPressed: () {
        Get.back();
      },
      child: const Text("NO"),
    ),
    confirm: TextButton(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          AppColorsUtil.backgroundRed,
        ),
        foregroundColor: WidgetStatePropertyAll(
          AppColorsUtil.foreGroundWhite,
        ),
      ),
      onPressed: () {
        exit(0);
      },
      child: const Text("YES"),
    ),
  );
}
