import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sajid_bazaar/presentation/controllers/store_page_controller.dart';
import 'package:sajid_bazaar/presentation/pages/item_details_page/item_details_page.dart';
import 'package:sajid_bazaar/presentation/pages/search_result_page/search_result_page.dart';
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
    initialPageSetup();
  }

  Future<void> initialPageSetup() async {
    await Get.find<StorePageController>().fetchRecommendedItems();
    await Get.find<StorePageController>().fetchNewArrivalItems();
  }

  final TextEditingController _searchTEController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _searchTEController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColorsUtil.backgroundWhite,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 10,
                  ),
                  child: _buildSearchForm(),
                ),
              ),
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
                    _buildItemsYouMayLike(),
                    const SizedBox(height: 12),
                    const Text(
                      "New Arrivals",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    _buildNewArrivals(),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSearchForm() {
    return Form(
      child: Column(
        children: [
          TextFormField(
            controller: _searchTEController,
            cursorColor: AppColorsUtil.foreGroundGreen,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: "Search any item",
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: AppColorsUtil.foreGroundGreen,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: AppColorsUtil.foreGroundGreen,
                ),
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  Get.to(
                    () => SearchResultPage(
                      searchedKeyWord: _searchTEController.text.toString(),
                    ),
                  );
                },
                icon: const Icon(Icons.search),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildItemsYouMayLike() {
    return SizedBox(
      height: Get.height / 3.9,
      width: Get.width,
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
                child: _buildRecommendedItemCard(
                  storePageController,
                  index,
                ),
              );
            },
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) =>
                SizedBox(width: Get.width / 45),
            itemCount: storePageController.getListOfRecommendedItems.length,
          );
        },
      ),
    );
  }

  Widget _buildNewArrivals() {
    return SizedBox(
      height: Get.height / 3.9,
      width: Get.width,
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
                child: _buildNewArrivalsItemCard(
                  storePageController,
                  index,
                ),
              );
            },
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) =>
                SizedBox(width: Get.width / 45),
            itemCount: storePageController.getListOfNewArrivalItems.length,
          );
        },
      ),
    );
  }

  Widget _buildRecommendedItemCard(
    StorePageController storePageController,
    int index,
  ) {
    return InkWell(
      onTap: () {
        Get.to(
          ItemDetailsPage(
            itemDetailsData:
                storePageController.getListOfRecommendedItems[index],
          ),
        );
      },
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
              placeholder: (context, url) => CircularProgressIndicator(
                color: AppColorsUtil.foreGroundGreen,
              ),
              fit: BoxFit.cover,
              height: 100,
              width: double.infinity,
              imageUrl:
                  storePageController.getListOfRecommendedItems[index].photo ??
                      "",
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Wrap(
                  children: [
                    Text(
                      storePageController
                              .getListOfRecommendedItems[index].name ??
                          "",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        overflow: TextOverflow.ellipsis,
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
                        overflow: TextOverflow.ellipsis,
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
                        overflow: TextOverflow.ellipsis,
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
  }

  Widget _buildNewArrivalsItemCard(
    StorePageController storePageController,
    int index,
  ) {
    return InkWell(
      onTap: () {
        Get.to(
          ItemDetailsPage(
            itemDetailsData:
                storePageController.getListOfNewArrivalItems[index],
          ),
        );
      },
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
              placeholder: (context, url) => CircularProgressIndicator(
                color: AppColorsUtil.foreGroundGreen,
              ),
              fit: BoxFit.cover,
              height: 100,
              width: double.infinity,
              imageUrl:
                  storePageController.getListOfNewArrivalItems[index].photo ??
                      "",
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Wrap(
                  children: [
                    Text(
                      storePageController
                              .getListOfNewArrivalItems[index].name ??
                          "",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Wrap(
                  children: [
                    Text(
                      "\$${storePageController.getListOfNewArrivalItems[index].price.toString()}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Wrap(
                  children: [
                    Text(
                      "Stock : ${storePageController.getListOfNewArrivalItems[index].stocks.toString()}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
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
  }
}
