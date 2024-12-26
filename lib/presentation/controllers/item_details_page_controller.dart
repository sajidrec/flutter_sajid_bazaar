import 'package:get/get.dart';

class ItemDetailsPageController extends GetxController {
  int _itemQuantity = 1;

  set setItemQuantity(int value) {
    _itemQuantity = value;
  }

  int get getItemQuantity => _itemQuantity;

  void increaseItemQuantity({
    required int stocks,
  }) {
    if (_itemQuantity < stocks) {
      _itemQuantity++;
    }
    update();
  }

  void decreaseItemQuantity() {
    if (_itemQuantity > 1) {
      _itemQuantity--;
    }
    update();
  }
}
