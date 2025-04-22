class Constants {
  static RegExp emailRegExp =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

  static const String userInfoKey = "userInfoKey";
  static const String userInfoBucketName = "user_info";
  static const String recommendedItemsTableName = "recommended_items_info";
  static const String recommendedItemsColumnName = "item_data";
  static const String newArrivalItemsTableName = "new_arrival_items_info";
  static const String newArrivalItemsColumnName = "new_arrival_item_data";
}
