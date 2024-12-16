import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sajid_bazaar/presentation/models/user_model.dart';
import 'package:sajid_bazaar/presentation/pages/top_navbar_page/top_navbar_page.dart';
import 'package:sajid_bazaar/presentation/utils/app_colors_util.dart';
import 'package:sajid_bazaar/presentation/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginPageController extends GetxController {
  bool _showPassword = true;

  bool get showPassword => _showPassword;

  bool _loginInProgress = false;

  bool get getLoginInProgressStatus => _loginInProgress;

  void togglePasswordHideShow() {
    _showPassword = !_showPassword;
    update();
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    _loginInProgress = true;
    update();

    final supabase = Supabase.instance.client;

    try {
      final AuthResponse res = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      UserModel currentUser = UserModel.fromJson(res.user!.userMetadata!);

      final SharedPreferences prefs = await SharedPreferences.getInstance();

      await prefs.setString(
        Constants.userInfoKey,
        currentUser.toJson().toString(),
      );

      await Fluttertoast.showToast(
        msg: "Login success",
        backgroundColor: AppColorsUtil.backgroundGreen,
        textColor: AppColorsUtil.foreGroundWhite,
      );

      Get.offAll(() => const TopNavbarPage());
    } catch (e) {
      await Fluttertoast.showToast(
        msg: e.toString(),
        backgroundColor: AppColorsUtil.backgroundRed,
        textColor: AppColorsUtil.foreGroundWhite,
      );
    }

    _loginInProgress = false;
    update();
  }
}
