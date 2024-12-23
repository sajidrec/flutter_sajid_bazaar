/// name : "Ostrich egg"
/// description : "Large, sturdy ostrich egg, perfect for cooking, art, or decoration. Weighs ~3 pounds (equal to 24 chicken eggs) with a durable shell ideal for crafting or painting. Great for unique gifts or culinary adventures.Available fresh or as empty shells. Specify preference when ordering."
/// price : 30
/// stocks : 7
/// photo : "https://mwqlqdcwkbcwwoijdkjw.supabase.co/storage/v1/object/public/bazaar_items/reccomended_items/ostrich_egg.jpg"
library;

class ItemCardModel {
  ItemCardModel({
    String? name,
    String? description,
    num? price,
    num? stocks,
    String? photo,
  }) {
    _name = name;
    _description = description;
    _price = price;
    _stocks = stocks;
    _photo = photo;
  }

  ItemCardModel.fromJson(dynamic json) {
    _name = json['name'];
    _description = json['description'];
    _price = json['price'];
    _stocks = json['stocks'];
    _photo = json['photo'];
  }

  String? _name;
  String? _description;
  num? _price;
  num? _stocks;
  String? _photo;

  ItemCardModel copyWith({
    String? name,
    String? description,
    num? price,
    num? stocks,
    String? photo,
  }) =>
      ItemCardModel(
        name: name ?? _name,
        description: description ?? _description,
        price: price ?? _price,
        stocks: stocks ?? _stocks,
        photo: photo ?? _photo,
      );

  String? get name => _name;

  String? get description => _description;

  num? get price => _price;

  num? get stocks => _stocks;

  String? get photo => _photo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['description'] = _description;
    map['price'] = _price;
    map['stocks'] = _stocks;
    map['photo'] = _photo;
    return map;
  }
}
