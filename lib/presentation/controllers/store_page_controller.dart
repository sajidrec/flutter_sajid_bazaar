
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sajid_bazaar/data/models/item_card_model.dart';
import 'package:sajid_bazaar/utils/app_colors_util.dart';
import 'package:sajid_bazaar/utils/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class StorePageController extends GetxController {
  //index 0 title index 1 icons
  final List<List> _listOfAllCategories = [
    [
      const Text("Vegetables"),
      FaIcon(
        FontAwesomeIcons.carrot,
        color: AppColorsUtil.backgroundGreen,
      ),
    ],
    [
      const Text("Fruits"),
      FaIcon(
        FontAwesomeIcons.apple,
        color: AppColorsUtil.backgroundGreen,
      ),
    ],
    [
      const Text("Candies"),
      FaIcon(
        FontAwesomeIcons.candyCane,
        color: AppColorsUtil.backgroundGreen,
      ),
    ],
    [
      const Text("Ice Creams"),
      FaIcon(
        FontAwesomeIcons.iceCream,
        color: AppColorsUtil.backgroundGreen,
      ),
    ],
    [
      const Text("Dairy"),
      FaIcon(
        FontAwesomeIcons.cheese,
        color: AppColorsUtil.backgroundGreen,
      ),
    ],
    [
      const Text("Eggs"),
      FaIcon(
        FontAwesomeIcons.egg,
        color: AppColorsUtil.backgroundGreen,
      ),
    ],
    [
      const Text("Others"),
      FaIcon(
        FontAwesomeIcons.box,
        color: AppColorsUtil.backgroundGreen,
      ),
    ],
  ];
  List<ItemCardModel> _listOfRecommendedItems = [];

  List<List> get getListOfAllCategories => _listOfAllCategories;

  List<ItemCardModel> get getListOfRecommendedItems => _listOfRecommendedItems;

  Future<void> fetchRecommendedItems() async {
    final supabase = Supabase.instance.client;
    final data = await supabase
        .from(Constants.recommendedItemsTableName)
        .select(Constants.recommendedItemsColumnName);
    _listOfRecommendedItems = [];
    for (int i = 0; i < data.length; i++) {
      _listOfRecommendedItems.add(
        ItemCardModel.fromJson(
          data[i][Constants.recommendedItemsColumnName],
        ),
      );
      // print();
    }
    update();
  }
}
