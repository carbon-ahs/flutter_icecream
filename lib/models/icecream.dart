import 'dart:convert';

class IcecreamData {
  List<Icecream>? icecreams;

  IcecreamData({
    this.icecreams,
  });

  factory IcecreamData.fromRawJson(String str) =>
      IcecreamData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory IcecreamData.fromJson(Map<String, dynamic> json) => IcecreamData(
        icecreams: List<Icecream>.from(
            json["icecreams"].map((x) => Icecream.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "icecreams": List<dynamic>.from(icecreams!.map((x) => x.toJson())),
      };
}

class Icecream {
  String flovor;
  String? description;
  List<String>? toppings;
  double price;
  String? image;
  List<Ingredience> ingrediences;

  Icecream({
    required this.flovor,
    this.description,
    this.toppings,
    required this.price,
    this.image,
    required this.ingrediences,
  });

  factory Icecream.fromRawJson(String str) =>
      Icecream.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Icecream.fromJson(Map<String, dynamic> json) => Icecream(
        flovor: json["flovor"],
        description: json["description"],
        toppings: json["toppings"] != null
            ? List<String>.from(json["toppings"].map((x) => x))
            : null,
        price: json["price"],
        image: json["image"],
        ingrediences: List<Ingredience>.from(
            json["ingrediences"].map((x) => Ingredience.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "flovor": flovor,
        "description": description,
        "toppings": toppings != null
            ? List<dynamic>.from(toppings!.map((x) => x))
            : null,
        "price": price,
        "image": image,
        "ingrediences": List<dynamic>.from(ingrediences.map((x) => x.toJson())),
      };
}

class Ingredience {
  String name;
  String quantity;

  Ingredience({
    required this.name,
    required this.quantity,
  });

  factory Ingredience.fromRawJson(String str) =>
      Ingredience.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Ingredience.fromJson(Map<String, dynamic> json) => Ingredience(
        name: json["name"],
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "quantity": quantity,
      };
}
