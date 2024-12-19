import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sajid_bazaar/presentation/controllers/profile_page_controller.dart';
import 'package:sajid_bazaar/presentation/pages/profile_page/widgets/log_out_button_widget.dart';
import 'package:sajid_bazaar/utils/app_colors_util.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback(
      (timeStamp) async {
        await Get.find<ProfilePageController>().fetchProfileData();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              top: 5,
            ),
            child: GetBuilder<ProfilePageController>(
                builder: (profilePageController) {
              return Column(
                children: [
                  Center(
                    child: SizedBox(
                      width: Get.height / 5.8,
                      height: Get.height / 5.8,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColorsUtil.foreGroundGreen,
                            width: 3,
                          ),
                        ),
                        child: ClipOval(
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: profilePageController
                                    .getUserModel?.profilePic ??
                                "",
                            placeholder: (context, url) =>
                                CircularProgressIndicator(
                              color: AppColorsUtil.foreGroundGreen,
                            ),
                            errorWidget: (context, url, error) => Icon(
                              Icons.error,
                              size: Get.width / 5.5,
                              color: AppColorsUtil.foreGroundRed,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    profilePageController.getUserModel?.name ?? "",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    profilePageController.getUserModel?.email ?? "",
                    style: const TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                            AppColorsUtil.backgroundGreen),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Order History",
                        style: TextStyle(
                          color: AppColorsUtil.foreGroundWhite,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                            AppColorsUtil.backgroundGreen),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Customize profile",
                        style: TextStyle(
                          color: AppColorsUtil.foreGroundWhite,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const LogOutButtonWidget(),
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}
