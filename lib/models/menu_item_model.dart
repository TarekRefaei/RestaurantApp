import 'package:equatable/equatable.dart';

class MenuItem extends Equatable {
  final int id;
  final int restaurantId;
  final String name;
  final String description;
  final double price;

  const MenuItem(
      {required this.id,
      required this.restaurantId,
      required this.name,
      required this.description,
      required this.price});

  @override
  List<Object?> get props => [id, name, restaurantId, description, price];

  static List<MenuItem> menuItems = [
    const MenuItem(
        id: 1,
        restaurantId: 1,
        name: "Pizza",
        description: "Pizza with tomatoes",
        price: 6.99),
    const MenuItem(
        id: 2,
        restaurantId: 2,
        name: "Coca Cola",
        description: "Popular Drink",
        price: 1.99),
  ];
}
