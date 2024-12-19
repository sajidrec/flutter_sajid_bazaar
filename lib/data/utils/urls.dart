class Urls {
  static String profilePicUrl({
    required String email,
  }) {
    return "profilePics/$email.png";
  }
}
