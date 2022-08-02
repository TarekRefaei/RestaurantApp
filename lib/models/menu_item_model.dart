import 'package:equatable/equatable.dart';

class MenuItem extends Equatable {
  final int id;
  final int restaurantId;
  final String name;
  final String category;
  final String description;
  final double price;

  const MenuItem(
      {required this.id,
      required this.category,
      required this.restaurantId,
      required this.name,
      required this.description,
      required this.price});

  @override
  List<Object?> get props =>
      [id, name, restaurantId, description, price, category];

  static List<MenuItem> menuItems = [
    const MenuItem(
      id: 1,
      restaurantId: 1,
      name: "Margherita",
      description: "Pizza with tomatoes",
      price: 6.99,
      category: 'Pizza',
    ),
    const MenuItem(
      id: 2,
      restaurantId: 1,
      name: "4 Forming",
      description: "Pizza with tomatoes",
      price: 4.99,
      category: 'Pizza',
    ),
    const MenuItem(
      id: 3,
      restaurantId: 1,
      name: "Bavarian",
      description: "Pizza with tomatoes",
      price: 3.99,
      category: 'Pizza',
    ),
    const MenuItem(
      id: 4,
      restaurantId: 1,
      name: "patron",
      description: "Pizza with tomatoes",
      price: 1.99,
      category: 'Pizza',
    ),
    const MenuItem(
      id: 5,
      restaurantId: 1,
      name: "Coca Cola",
      description: "Popular Drink",
      price: 1.99,
      category: 'Cold Drink',
    ),
    const MenuItem(
      id: 6,
      restaurantId: 2,
      name: "IceCream",
      description: "Chocolate Ice",
      price: 6.99,
      category: 'Ice Cream',
    ),
    const MenuItem(
      id: 7,
      restaurantId: 2,
      name: "Fried Chicken",
      description: "Fried Chicken",
      price: 10.99,
      category: 'Fried Chicken',
    ),
    const MenuItem(
      id: 8,
      restaurantId: 3,
      name: "Hot Drink",
      description: "Hot Drink",
      price: 10.99,
      category: 'Hot Drink',
    ),
    const MenuItem(
      id: 9,
      restaurantId: 4,
      name: "Burger Sandwich",
      description: "Sandwich",
      price: 3.99,
      category: 'Sandwich',
    ),
  ];
}
