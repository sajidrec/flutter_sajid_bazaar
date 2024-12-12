import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sajid_bazaar/controller_binder.dart';
import 'package:sajid_bazaar/presentation/pages/splash_page.dart';
import 'package:sajid_bazaar/presentation/utils/app_colors_util.dart';

class SajidBazaar extends StatelessWidget {
  const SajidBazaar({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: ControllerBinder(),
      theme: ThemeData(
        scaffoldBackgroundColor: AppColorsUtil.backgroundDefault,
      ),
      home: const SplashPage(),
    );
  }
}
