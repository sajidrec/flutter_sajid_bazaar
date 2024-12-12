import 'package:get/get.dart';
import 'package:sajid_bazaar/presentation/controllers/auth_page_controllers/signup_page_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.put(SignupPageController());
  }
}
