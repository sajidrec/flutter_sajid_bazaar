import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sajid_bazaar/presentation/pages/carts_page/carts_page.dart';
import 'package:sajid_bazaar/presentation/pages/favourite_page/favourite_page.dart';
import 'package:sajid_bazaar/presentation/pages/profile_page/profile_page.dart';
import 'package:sajid_bazaar/presentation/pages/store_page/store_page.dart';

class TopNavbarPageController extends GetxController {
  final List<Widget> _screens = [
    const StorePage(),
    const FavouritePage(),
    const CartsPage(),
    const ProfilePage(),
  ];

  int _index = 0;

  get getScreen => _screens[_index];

  void changeScreenNav({
    required int index,
  }) {
    _index = index;
    update();
  }
}
