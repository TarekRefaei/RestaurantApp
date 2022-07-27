import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'models.dart';

class Restaurent extends Equatable {
  final int id;
  final String name;
  final Image restaurentImage;
  final List<String> tags;
  final List<MenuItem> menuItems;
  final int deliveryTime;
  final double deliveryFee;
  final double destance;

  Restaurent(
      {required this.id,
      required this.name,
      required this.menuItems,
      required this.restaurentImage,
      required this.tags,
      required this.deliveryTime,
      required this.deliveryFee,
      required this.destance});

  @override
  List<Object?> get props =>
      [id, name, restaurentImage, tags, deliveryFee, deliveryTime, destance];

  static List<Restaurent> restaurants = [
    Restaurent(
      id: 1,
      name: "PAPAJones",
      restaurentImage: Image.asset("assets/logo/papajohnes.png"),
      tags: const ["Pizza", "Pasta"],
      deliveryTime: 10,
      deliveryFee: 0.2,
      destance: 30,
      menuItems: MenuItem.menuItems
          .where((menuitem) => menuitem.restaurantId == 1)
          .toList(),
    ),
    Restaurent(
      id: 2,
      name: "jhony Rocket",
      restaurentImage: Image.asset("assets/logo/jhony rocket.png"),
      tags: const ["burger", "FastFood"],
      deliveryTime: 15,
      deliveryFee: 0.5,
      destance: 10,
      menuItems: MenuItem.menuItems
          .where((menuitem) => menuitem.restaurantId == 2)
          .toList(),
    ),
    Restaurent(
      id: 3,
      name: "StarBucks",
      restaurentImage: Image.asset("assets/logo/starbucks.png"),
      tags: const ["cola", "Drinks"],
      deliveryTime: 50,
      deliveryFee: 1.5,
      destance: 19,
      menuItems: MenuItem.menuItems
          .where((menuitem) => menuitem.restaurantId == 3)
          .toList(),
    ),
    Restaurent(
      id: 4,
      name: "Denny",
      restaurentImage: Image.asset("assets/logo/denny.png"),
      tags: const ["Pizza", "Drinks", "Fast Food", "Ice Cream", "Deserts"],
      deliveryTime: 30,
      deliveryFee: 0.4,
      destance: 14,
      menuItems: MenuItem.menuItems
          .where((menuitem) => menuitem.restaurantId == 4)
          .toList(),
    ),
  ];
}
