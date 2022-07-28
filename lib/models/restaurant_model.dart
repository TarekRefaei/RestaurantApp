import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'models.dart';

class Restaurant extends Equatable {
  final int id;
  final String name;
  final Image restaurantImage;
  final List<String> tags;
  final List<MenuItem> menuItems;
  final int deliveryTime;
  final double deliveryFee;
  final double distance;

  Restaurant(
      {required this.id,
      required this.name,
      required this.menuItems,
      required this.restaurantImage,
      required this.tags,
      required this.deliveryTime,
      required this.deliveryFee,
      required this.distance});

  @override
  List<Object?> get props =>
      [id, name, restaurantImage, tags, deliveryFee, deliveryTime, distance];

  static List<Restaurant> restaurants = [
    Restaurant(
      id: 1,
      name: "PAPAJones",
      restaurantImage: Image.asset("assets/logo/papajohnes.png"),
      tags: const ["Pizza", "Pasta"],
      deliveryTime: 10,
      deliveryFee: 0.2,
      distance: 30,
      menuItems: MenuItem.menuItems
          .where((menuitem) => menuitem.restaurantId == 1)
          .toList(),
    ),
    Restaurant(
      id: 2,
      name: "jhony Rocket",
      restaurantImage: Image.asset("assets/logo/jhony rocket.png"),
      tags: const ["burger", "FastFood"],
      deliveryTime: 15,
      deliveryFee: 0.5,
      distance: 10,
      menuItems: MenuItem.menuItems
          .where((menuitem) => menuitem.restaurantId == 2)
          .toList(),
    ),
    Restaurant(
      id: 3,
      name: "StarBucks",
      restaurantImage: Image.asset("assets/logo/starbucks.png"),
      tags: const ["cola", "Drinks"],
      deliveryTime: 50,
      deliveryFee: 1.5,
      distance: 19,
      menuItems: MenuItem.menuItems
          .where((menuitem) => menuitem.restaurantId == 3)
          .toList(),
    ),
    Restaurant(
      id: 4,
      name: "Denny",
      restaurantImage: Image.asset("assets/logo/denny.png"),
      tags: const ["Pizza", "Drinks", "Fast Food", "Ice Cream", "Deserts"],
      deliveryTime: 30,
      deliveryFee: 0.4,
      distance: 14,
      menuItems: MenuItem.menuItems
          .where((menuItem) => menuItem.restaurantId == 4)
          .toList(),
    ),
  ];
}
