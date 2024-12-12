/// name : ""
/// email : ""
/// profilePic : ""
library;

class UserModel {
  UserModel({
    String? name,
    String? email,
    String? profilePic,
  }) {
    _name = name;
    _email = email;
    _profilePic = profilePic;
  }

  UserModel.fromJson(dynamic json) {
    _name = json['name'];
    _email = json['email'];
    _profilePic = json['profilePic'];
  }

  String? _name;
  String? _email;
  String? _profilePic;

  UserModel copyWith({
    String? name,
    String? email,
    String? profilePic,
  }) =>
      UserModel(
        name: name ?? _name,
        email: email ?? _email,
        profilePic: profilePic ?? _profilePic,
      );

  String? get name => _name;

  String? get email => _email;

  String? get profilePic => _profilePic;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['email'] = _email;
    map['profilePic'] = _profilePic;
    return map;
  }
}
