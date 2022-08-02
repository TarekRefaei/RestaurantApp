import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Category extends Equatable {
  final int id;
  final String name;
  final Image image;

  const Category({required this.id, required this.name, required this.image});

  @override
  List<Object?> get props => [id, name, image];

  static List<Category> categories = [
    Category(
      id: 1,
      name: "Sandwich",
      image: Image.asset("assets/logo/burger.png"),
    ),
    Category(
      id: 2,
      name: "Pizza",
      image: Image.asset("assets/logo/pizza.png"),
    ),
    Category(
      id: 3,
      name: "Deserts",
      image: Image.asset("assets/logo/deserts.png"),
    ),
    Category(
      id: 4,
      name: "Ice Cream",
      image: Image.asset("assets/logo/ice.png"),
    ),
    Category(
      id: 5,
      name: "Vegetable",
      image: Image.asset("assets/logo/vege.png"),
    ),
    Category(
      id: 6,
      name: "Cola",
      image: Image.asset("assets/logo/cola.png"),
    ),
  ];
}
