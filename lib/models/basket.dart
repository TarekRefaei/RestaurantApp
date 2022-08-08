import 'package:equatable/equatable.dart';
import 'package:food_delivery_app/models/models.dart';

class Basket extends Equatable {
  final List<MenuItem> items;
  final bool cutlery;

  const Basket({
    this.items = const <MenuItem>[],
    this.cutlery = false,
  });

  Basket copyWith({
    List<MenuItem>? items,
    bool? cutlery,
  }) {
    return Basket(
      items: items ?? this.items,
      cutlery: cutlery ?? this.cutlery,
    );
  }

  Map itemQuantity(items) {
    var quantity = {};
    items.forEach((item) {
      if (!quantity.containsKey(item)) {
        quantity[item] = 1;
      } else {
        quantity[item] += 1;
      }
    });
    return quantity;
  }

  double get subtotal =>
      items.fold(0, (total, current) => total + current.price);

  double total(subtotal) {
    return subtotal + 50;
  }

  String get subtotalString => subtotal.toStringAsFixed(2);

  String get totalString => total(subtotal).toStringAsFixed(2);

  @override
  List<Object?> get props => [items, cutlery];
}
