// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
    Product({
        required this.id,
        required this.product,
        required this.userId,
        required this.price,
        required this.currency,
        required this.picture,
        required this.description,
        required this.category,
        required this.location,
        required this.user,
    });

    final int id;
    final String product;
    final int userId;
    final int price;
    final String currency;
    final String picture;
    final String description;
    final int category;
    final int location;
    final User user;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        product: json["product"],
        userId: json["user_id"],
        price: json["price"],
        currency: json["currency"],
        picture: json["picture"],
        description: json["description"],
        category: json["category"],
        location: json["location"],
        user: User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "product": product,
        "user_id": userId,
        "price": price,
        "currency": currency,
        "picture": picture,
        "description": description,
        "category": category,
        "location": location,
        "user": user.toJson(),
    };
}

class User {
    User({
        required this.id,
        required this.firstName,
        this.email,
        required this.phoneNumber,
        required this.picture,
    });

    final int id;
    final String firstName;
    final String? email;
    final String phoneNumber;
    final String? picture;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        firstName: json["first_name"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        picture: json["picture"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "email": email,
        "phoneNumber": phoneNumber,
        "picture": picture == null ? null : picture,
    };
}
