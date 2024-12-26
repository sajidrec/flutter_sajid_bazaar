import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sajid_bazaar/presentation/controllers/item_details_page_controller.dart';
import 'package:sajid_bazaar/utils/app_colors_util.dart';

class QuantityCounterWidget extends StatelessWidget {
  const QuantityCounterWidget({
    super.key,
    required this.stocks,
  });

  final int stocks;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemDetailsPageController>(
      builder: (itemDetailsPageController) {
        return Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            _buildDecreaseButton(
              itemDetailsPageController,
            ),
            Text(
              itemDetailsPageController.getItemQuantity.toString(),
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            _buildIncreaseButton(itemDetailsPageController),
          ],
        );
      },
    );
  }

  Widget _buildIncreaseButton(
    ItemDetailsPageController itemDetailsPageController,
  ) {
    return IconButton(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          AppColorsUtil.backgroundGreen,
        ),
        foregroundColor: WidgetStatePropertyAll(
          AppColorsUtil.foreGroundWhite,
        ),
      ),
      onPressed: () {
        if (itemDetailsPageController.getItemQuantity >= stocks) {
          Fluttertoast.showToast(msg: "Don't have more in stock");
        }
        itemDetailsPageController.increaseItemQuantity(stocks: stocks);
      },
      icon: const Icon(
        Icons.add,
      ),
    );
  }

  Widget _buildDecreaseButton(
    ItemDetailsPageController itemDetailsPageController,
  ) {
    return IconButton(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
          AppColorsUtil.backgroundRed,
        ),
        foregroundColor: WidgetStatePropertyAll(
          AppColorsUtil.foreGroundWhite,
        ),
      ),
      onPressed: () {
        if (itemDetailsPageController.getItemQuantity == 1) {
          Fluttertoast.showToast(msg: "At least 1 unit");
        }
        itemDetailsPageController.decreaseItemQuantity();
      },
      icon: const Icon(
        Icons.remove,
      ),
    );
  }
}
