import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sajid_bazaar/data/models/user_model.dart';
import 'package:sajid_bazaar/data/utils/urls.dart';
import 'package:sajid_bazaar/utils/app_colors_util.dart';
import 'package:sajid_bazaar/utils/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignupPageController extends GetxController {
  File? _profilePicture;
  String _fileName = "";
  bool _showPassword = false;

  bool get showPassword => _showPassword;

  String get getFileName => _fileName;

  File? get getProfilePicture => _profilePicture;

  bool _signUpInProgressStatus = false;

  bool get getSignUpInProgressStatus => _signUpInProgressStatus;

  void togglePass() {
    _showPassword = !_showPassword;
    update();
  }

  Future<void> signup({
    required String email,
    required String password,
    required String name,
  }) async {
    _signUpInProgressStatus = true;
    update();

    final supabase = Supabase.instance.client;

    try {
      await supabase.storage.from(Constants.userInfoBucketName).upload(
            Urls.profilePicUrl(
              email: email,
            ),
            _profilePicture!,
          );

      String profilePicPath =
          supabase.storage.from(Constants.userInfoBucketName).getPublicUrl(
                Urls.profilePicUrl(
                  email: email,
                ),
              );

      UserModel newUser = UserModel(
        email: email,
        name: name,
        profilePic: profilePicPath,
      );

      await supabase.auth.signUp(
        email: email,
        password: password,
        data: newUser.toJson(),
      );

      Fluttertoast.showToast(
        msg: "Account created successfully please login.",
        backgroundColor: AppColorsUtil.backgroundGreen,
        textColor: AppColorsUtil.foreGroundWhite,
      );

      Get.back();
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        backgroundColor: AppColorsUtil.backgroundRed,
        textColor: AppColorsUtil.foreGroundWhite,
      );
    }

    _profilePicture = null;
    _fileName = "";

    _signUpInProgressStatus = false;
    update();
  }

  Future<void> selectProfilePicture() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
    );
    if (result != null) {
      _profilePicture = File(result.files.single.path!);
      _fileName = result.files.single.name;
      update();
    } else {
      // User canceled the picker
    }
  }
}
