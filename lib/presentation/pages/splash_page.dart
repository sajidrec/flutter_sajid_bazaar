import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sajid_bazaar/presentation/pages/auth_pages/login_page/login_page.dart';
import 'package:sajid_bazaar/presentation/pages/home_page/home_page.dart';
import 'package:sajid_bazaar/presentation/utils/app_colors_util.dart';
import 'package:sajid_bazaar/presentation/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        await _moveToNextPage();
      },
    );
  }

  Future<void> _moveToNextPage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString(Constants.userInfoKey)?.isNotEmpty ?? true) {
      Timer(
        const Duration(seconds: 2),
        () => Get.offAll(() => const HomePage()),
      );
    } else {
      Timer(
        const Duration(seconds: 2),
        () => Get.offAll(() => const LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColorsUtil.backgroundGreen,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Sajid Bazaar",
                style: TextStyle(
                  fontSize: 50,
                  color: AppColorsUtil.foreGroundWhite,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Welcome to SajidBazaar\nFresh Groceries, Anytime!",
                style: TextStyle(
                  fontSize: 25,
                  color: AppColorsUtil.foreGroundWhite,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 5),
              CircularProgressIndicator(
                color: AppColorsUtil.foreGroundWhite,
                strokeWidth: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
