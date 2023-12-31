// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  String model;
  int pk;
  Fields fields;

  Product({
    required this.model,
    required this.pk,
    required this.fields,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    model: json["model"],
    pk: json["pk"],
    fields: Fields.fromJson(json["fields"]),
  );

  Map<String, dynamic> toJson() => {
    "model": model,
    "pk": pk,
    "fields": fields.toJson(),
  };
}

class Fields {
  String name;
  int amount;
  int price;
  int power;
  int energyCost;
  String description;
  DateTime dateAdded;
  int user;

  Fields({
    required this.name,
    required this.amount,
    required this.price,
    required this.power,
    required this.energyCost,
    required this.description,
    required this.dateAdded,
    required this.user,
  });

  factory Fields.fromJson(Map<String, dynamic> json) => Fields(
    name: json["name"],
    amount: json["amount"],
    price: json["price"],
    power: json["power"],
    energyCost: json["energy_cost"],
    description: json["description"],
    dateAdded: DateTime.parse(json["date_added"]),
    user: json["user"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "amount": amount,
    "price": price,
    "power": power,
    "energy_cost": energyCost,
    "description": description,
    "date_added": "${dateAdded.year.toString().padLeft(4, '0')}-${dateAdded.month.toString().padLeft(2, '0')}-${dateAdded.day.toString().padLeft(2, '0')}",
    "user": user,
  };
}