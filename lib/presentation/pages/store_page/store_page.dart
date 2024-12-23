import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sajid_bazaar/presentation/controllers/store_page_controller.dart';
import 'package:sajid_bazaar/presentation/pages/store_page/widgets/all_categories_widget.dart';
import 'package:sajid_bazaar/utils/app_colors_util.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback(
      (timeStamp) async {
        await Get.find<StorePageController>().fetchRecommendedItems();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AllCategoriesWidget(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Items you may like",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: Get.height / 3.9,
                      width: double.infinity,
                      child: GetBuilder<StorePageController>(
                        builder: (storePageController) {
                          return ListView.separated(
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: AppColorsUtil.backgroundLightGreen,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                width: Get.height / 5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(12),
                                        topLeft: Radius.circular(12),
                                      ),
                                      child: CachedNetworkImage(
                                        placeholder: (context, url) =>
                                            CircularProgressIndicator(
                                          color: AppColorsUtil.foreGroundGreen,
                                        ),
                                        fit: BoxFit.cover,
                                        imageUrl: storePageController
                                                .getListOfRecommendedItems[
                                                    index]
                                                .photo ??
                                            "",
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Wrap(
                                            children: [
                                              Text(
                                                storePageController
                                                        .getListOfRecommendedItems[
                                                            index]
                                                        .name ??
                                                    "",
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Wrap(
                                            children: [
                                              Text(
                                                "\$${storePageController.getListOfRecommendedItems[index].price.toString()}",
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Wrap(
                                            children: [
                                              Text(
                                                "Stock : ${storePageController.getListOfRecommendedItems[index].stocks.toString()}",
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, index) =>
                                SizedBox(width: Get.width / 45),
                            itemCount: storePageController
                                .getListOfRecommendedItems.length,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
