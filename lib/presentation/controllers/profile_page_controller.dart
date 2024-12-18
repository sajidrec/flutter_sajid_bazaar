
import 'package:get/get.dart';
import 'package:sajid_bazaar/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePageController extends GetxController {
  Future<void> logout() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();

    await sharedPref.setString(Constants.userInfoKey, "");
  }
}
