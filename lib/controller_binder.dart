import 'package:get/get.dart';
import 'package:sajid_bazaar/presentation/controllers/auth_page_controllers/login_page_controller.dart';
import 'package:sajid_bazaar/presentation/controllers/auth_page_controllers/signup_page_controller.dart';
import 'package:sajid_bazaar/presentation/controllers/profile_page_controller.dart';
import 'package:sajid_bazaar/presentation/controllers/store_page_controller.dart';
import 'package:sajid_bazaar/presentation/controllers/top_navbar_page_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(SignupPageController());
    Get.put(LoginPageController());
    Get.put(TopNavbarPageController());
    Get.put(StorePageController());
    Get.put(ProfilePageController());
  }
}
