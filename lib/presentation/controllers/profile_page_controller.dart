import 'dart:convert';

import 'package:get/get.dart';
import 'package:sajid_bazaar/data/models/user_model.dart';
import 'package:sajid_bazaar/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePageController extends GetxController {
  UserModel? _userModel;

  UserModel? get getUserModel => _userModel;

  Future<void> logout() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();

    await sharedPref.setString(Constants.userInfoKey, "");
  }

  Future<void> fetchProfileData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    String userInfoInString =
        sharedPreferences.getString(Constants.userInfoKey) ?? "";

    UserModel? userModel = UserModel.fromJson(jsonDecode(userInfoInString));

    _userModel = userModel;

    update();
  }
}
