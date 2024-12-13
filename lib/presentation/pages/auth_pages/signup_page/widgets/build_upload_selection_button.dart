import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sajid_bazaar/presentation/controllers/auth_page_controllers/signup_page_controller.dart';
import 'package:sajid_bazaar/presentation/utils/app_colors_util.dart';

class BuildUploadSelectionButton extends StatelessWidget {
  const BuildUploadSelectionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await Get.find<SignupPageController>().selectProfilePicture();
      },
      child: Row(
        children: [
          Container(
            height: Get.height / 25,
            width: Get.width / 3.5,
            decoration: BoxDecoration(
              color: AppColorsUtil.backgroundBlack,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
            child: Icon(
              Icons.upload,
              color: AppColorsUtil.foreGroundWhite,
            ),
          ),
          Expanded(
            child: Container(
              height: Get.height / 25,
              width: Get.width / 3.5,
              decoration: BoxDecoration(
                color: AppColorsUtil.backgroundDefault,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: const Center(
                child: Text(
                  "Choose profile photo",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
