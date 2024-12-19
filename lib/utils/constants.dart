class Constants {
  static RegExp emailRegExp =
      RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');

  static const String userInfoKey = "userInfoKey";
  static const String userInfoBucketName = "user_info";
}
