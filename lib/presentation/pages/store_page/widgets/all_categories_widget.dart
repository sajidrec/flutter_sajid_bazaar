import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sajid_bazaar/presentation/controllers/store_page_controller.dart';
import 'package:sajid_bazaar/utils/app_colors_util.dart';

class AllCategoriesWidget extends StatelessWidget {
  const AllCategoriesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height / 5.8,
      color: AppColorsUtil.backgroundWhite,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "All Categories",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            _buildScrollableCategories(),
          ],
        ),
      ),
    );
  }

  Widget _buildScrollableCategories() {
    return SizedBox(
      width: Get.width,
      height: Get.height / 9,
      child: GetBuilder<StorePageController>(
        builder: (storePageController) {
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    width: Get.width / 6.5,
                    height: Get.width / 6.5,
                    decoration: BoxDecoration(
                      color: AppColorsUtil.backgroundLightGreen,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: storePageController.getListOfAllCategories[index]
                          [1],
                    ),
                  ),
                  storePageController.getListOfAllCategories[index][0],
                ],
              );
            },
            itemCount: storePageController.getListOfAllCategories.length,
            shrinkWrap: true,
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 8,
              );
            },
          );
        },
      ),
    );
  }
}
