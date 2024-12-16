import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sajid_bazaar/utils/app_colors_util.dart';

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

  List<List> get getListOfAllCategories => _listOfAllCategories;
}
