import 'package:get/get.dart';

class LoginPageController extends GetxController {
  bool _showPassword = true;

  bool get showPassword => _showPassword;

  void togglePasswordHideShow() {
    _showPassword = !_showPassword;
    update();
  }
}
