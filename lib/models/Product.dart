import 'package:flutter/material.dart';

class Product {
  final String title, description;
  final String image;
  final double rating, price;
  final bool isFavourite;
  Product({
    @required this.image,
    this.rating = 0.0,
    this.isFavourite = false,

    @required this.title,
    @required this.price,
    @required this.description,
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    image: "assets/images/hulk.png",
    title: "Wireless Controller for PS4™",
    price: 64.99,
    description: description,
    rating: 4.8,
    isFavourite: true,
  ),
  Product(
    image: "assets/images/hulk.png",
    title: "Nike Sport White - Man Pant",
    price: 50.5,
    description: description,
    rating: 4.1,
  ),
  Product(
    image: "assets/images/hulk.png",
    title: "Gloves XC Omega - Polygon",
    price: 36.55,
    description: description,
    rating: 4.1,
  ),
  Product(
    image: "assets/images/hulk.png",
    title: "Logitech Head",
    price: 20.20,
    description: description,
    rating: 4.1,
  ),
];

const String description =
    "Wireless Controller for PS4™ gives you what you want in your gaming from over precision control your games to sharing …";
