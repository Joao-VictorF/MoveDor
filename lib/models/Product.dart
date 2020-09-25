import 'package:flutter/material.dart';

class Product {
  final String title, description;
  final String image;
  final double rating, price;
  bool haveStock, isFavourite, inCart;
  Product({
    @required this.image,
    this.rating = 0.0,
    this.isFavourite = false,
    this.inCart = false,

    @required this.title,
    @required this.price,
    @required this.haveStock,
    @required this.description,
  });
}

// Our demo Products

List<Product> demoProducts = [
  Product(
    image: "assets/images/hulk.png",
    title: "Quarteto Fantástico - Coisa VS. Imortal Hulk",
    price: 64.99,
    haveStock: true,
    description: description,
    rating: 4.8,
    isFavourite: true,
    inCart: true,
  ),
  Product(
    image: "assets/images/hulk.png",
    title: "Quarteto Fantástico - Coisa VS. Imortal Hulk",
    price: 50.50,
    haveStock: false,
    description: description,
    rating: 4.1,
  ),
  Product(
    image: "assets/images/hulk.png",
    title: "Quarteto Fantástico - Coisa VS. Imortal Hulk",
    price: 36.55,
    inCart: true,
    haveStock: true,
    description: description,
    rating: 4.1,
  ),
  Product(
    image: "assets/images/hulk.png",
    title: "Quarteto Fantástico - Coisa VS. Imortal Hulk",
    price: 20.20,
    haveStock: false,
    description: description,
    rating: 4.1,
  ),
];

const String description =
    "Em sua tão sonhada lua de mel, Ben Grimm e Alícia Masters viajam para um remoto paraíso tropical - até que alguém aparece para estragar tudo!";
