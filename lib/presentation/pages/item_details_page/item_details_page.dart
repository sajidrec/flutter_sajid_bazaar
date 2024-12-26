import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sajid_bazaar/data/models/item_card_model.dart';
import 'package:sajid_bazaar/presentation/controllers/item_details_page_controller.dart';
import 'package:sajid_bazaar/presentation/pages/item_details_page/widgets/quantity_counter_widget.dart';
import 'package:sajid_bazaar/utils/app_colors_util.dart';

class ItemDetailsPage extends StatefulWidget {
  final ItemCardModel itemDetailsData;

  const ItemDetailsPage({
    super.key,
    required this.itemDetailsData,
  });

  @override
  State<ItemDetailsPage> createState() => _ItemDetailsPageState();
}

class _ItemDetailsPageState extends State<ItemDetailsPage> {
  @override
  void initState() {
    super.initState();
    Get.find<ItemDetailsPageController>().setItemQuantity = 1;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColorsUtil.backgroundGreen,
          foregroundColor: AppColorsUtil.foreGroundWhite,
          centerTitle: true,
          title: Text("Buy ${widget.itemDetailsData.name ?? ""}"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _buildProductImage(),
              _buildProductDetails(),
              const SizedBox(height: 5),
              QuantityCounterWidget(
                stocks: widget.itemDetailsData.stocks?.toInt() ?? 0,
              ),
              const SizedBox(height: 5),
              _buildBuyButton(),
              _buildAddToCartButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductDetails() {
    return Column(
      children: [
        Text(
          widget.itemDetailsData.name ?? "",
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          "Unit price \$${widget.itemDetailsData.price.toString()}",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            "${widget.itemDetailsData.description}",
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProductImage() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 8,
        ),
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: widget.itemDetailsData.photo ?? "",
          placeholder: (context, url) => CircularProgressIndicator(
            color: AppColorsUtil.foreGroundGreen,
          ),
          errorWidget: (context, url, error) => Center(
            child: SizedBox(
              height: Get.height / 4,
              width: Get.height / 4,
              child: Icon(
                Icons.broken_image,
                color: AppColorsUtil.foreGroundRed,
                size: Get.height / 4,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAddToCartButton() {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          AppColorsUtil.backgroundGreen,
        ),
        foregroundColor: WidgetStatePropertyAll(
          AppColorsUtil.foreGroundWhite,
        ),
      ),
      onPressed: () {},
      child: const Text("Add to cart"),
    );
  }

  Widget _buildBuyButton() {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          AppColorsUtil.backgroundGreen,
        ),
        foregroundColor: WidgetStatePropertyAll(
          AppColorsUtil.foreGroundWhite,
        ),
      ),
      onPressed: () {},
      child: const Text("Buy"),
    );
  }
}
