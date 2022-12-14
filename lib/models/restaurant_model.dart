import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/menu_item_model.dart';

class Restaurant extends Equatable {
  final int id;
  final String name;
  final Image restaurantImage;
  final List<String> tags;
  final List<MenuElement> menuElements;
  final int deliveryTime;
  final double deliveryFee;
  final double distance;
  final String imageUrl;
  final String priceCategory;

  const Restaurant({
    required this.id,
    required this.name,
    required this.menuElements,
    required this.restaurantImage,
    required this.tags,
    required this.deliveryTime,
    required this.deliveryFee,
    required this.distance,
    required this.imageUrl,
    required this.priceCategory,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        restaurantImage,
        tags,
        deliveryFee,
        deliveryTime,
        distance,
        priceCategory,
      ];

  static List<Restaurant> restaurants = [
    Restaurant(
      id: 1,
      name: "PAPAJones",
      restaurantImage: Image.asset("assets/logo/papajohnes.png"),
      tags: MenuElement.menuElements
          .where((menuElement) => menuElement.restaurantId == 1)
          .map((menuElement) => menuElement.category)
          .toSet()
          .toList(),
      deliveryTime: 10,
      deliveryFee: 0.2,
      distance: 30,
      menuElements: MenuElement.menuElements
          .where((menuElement) => menuElement.restaurantId == 1)
          .toList(),
      imageUrl:
          'https://media-cdn.tripadvisor.com/media/photo-s/06/25/66/66/papa-john-s.jpg',
      priceCategory: '\$',
    ),
    Restaurant(
      id: 2,
      name: "Johnny Rocket",
      restaurantImage: Image.asset("assets/logo/jhony rocket.png"),
      tags: MenuElement.menuElements
          .where((menuElement) => menuElement.restaurantId == 2)
          .map((menuElement) => menuElement.category)
          .toSet()
          .toList(),
      deliveryTime: 15,
      deliveryFee: 0.5,
      distance: 10,
      menuElements: MenuElement.menuElements
          .where((menuElement) => menuElement.restaurantId == 2)
          .toList(),
      imageUrl:
          'https://images.squarespace-cdn.com/content/v1/53cc1616e4b0f4361f8ace24/5a55aef9-39b6-4b51-ac43-af5da32d8747/Johnny+Rockets-dining+room-1-3.jpg',
      priceCategory: '\$\$',
    ),
    Restaurant(
      id: 3,
      name: "Star Bucks",
      restaurantImage: Image.asset("assets/logo/starbucks.png"),
      tags: MenuElement.menuElements
          .where((menuElement) => menuElement.restaurantId == 3)
          .map((menuElement) => menuElement.category)
          .toSet()
          .toList(),
      deliveryTime: 50,
      deliveryFee: 1.5,
      distance: 19,
      menuElements: MenuElement.menuElements
          .where((menuElement) => menuElement.restaurantId == 3)
          .toList(),
      imageUrl:
          'https://media-cdn.tripadvisor.com/media/photo-s/1a/9f/86/0f/caption.jpg',
      priceCategory: '\$\$\$',
    ),
    Restaurant(
      id: 4,
      name: "Denny",
      restaurantImage: Image.asset("assets/logo/denny.png"),
      tags: MenuElement.menuElements
          .where((menuElement) => menuElement.restaurantId == 4)
          .map((menuElement) => menuElement.category)
          .toSet()
          .toList(),
      deliveryTime: 30,
      deliveryFee: 0.4,
      distance: 14,
      menuElements: MenuElement.menuElements
          .where((menuElement) => menuElement.restaurantId == 4)
          .toList(),
      imageUrl:
          'https://www.mashed.com/img/gallery/the-untold-truth-of-dennys/intro-1537362655.jpg',
      priceCategory: '\$',
    ),
  ];
}
