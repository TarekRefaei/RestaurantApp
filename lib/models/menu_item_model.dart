import 'package:equatable/equatable.dart';

class MenuElement extends Equatable {
  final int id;
  final int restaurantId;
  final String name;
  final String category;
  final String description;
  final double price;

  const MenuElement(
      {required this.id,
      required this.category,
      required this.restaurantId,
      required this.name,
      required this.description,
      required this.price});

  @override
  List<Object?> get props =>
      [id, name, restaurantId, description, price, category];

  static List<MenuElement> menuElements = [
    const MenuElement(
      id: 1,
      restaurantId: 1,
      name: "Margherita",
      description: "Pizza with tomatoes",
      price: 6.99,
      category: 'Pizza',
    ),
    const MenuElement(
      id: 2,
      restaurantId: 1,
      name: "4 Forming",
      description: "Pizza with tomatoes",
      price: 4.99,
      category: 'Pizza',
    ),
    const MenuElement(
      id: 3,
      restaurantId: 1,
      name: "Bavarian",
      description: "Pizza with tomatoes",
      price: 3.99,
      category: 'Pizza',
    ),
    const MenuElement(
      id: 4,
      restaurantId: 1,
      name: "patron",
      description: "Pizza with tomatoes",
      price: 1.99,
      category: 'Pizza',
    ),
    const MenuElement(
      id: 5,
      restaurantId: 1,
      name: "Coca Cola",
      description: "Popular Drink",
      price: 1.99,
      category: 'Cold Drink',
    ),
    const MenuElement(
      id: 6,
      restaurantId: 2,
      name: "IceCream",
      description: "Chocolate Ice",
      price: 6.99,
      category: 'Ice Cream',
    ),
    const MenuElement(
      id: 7,
      restaurantId: 2,
      name: "Fried Chicken",
      description: "Fried Chicken",
      price: 10.99,
      category: 'Fried Chicken',
    ),
    const MenuElement(
      id: 8,
      restaurantId: 3,
      name: "Hot Drink",
      description: "Hot Drink",
      price: 10.99,
      category: 'Hot Drink',
    ),
    const MenuElement(
      id: 9,
      restaurantId: 4,
      name: "Burger Sandwich",
      description: "Sandwich",
      price: 3.99,
      category: 'Sandwich',
    ),
  ];
}
