import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/restaurant_model.dart';
import '../../widgets/widgets.dart';

class RestaurantListScreen extends StatelessWidget {
  final List<Restaurant> restaurant;

  const RestaurantListScreen({Key? key, required this.restaurant})
      : super(key: key);

  static const String routeName = '/restaurant List';

  static Route route({required List<Restaurant> restaurant}) {
    return MaterialPageRoute(
      builder: (context) => RestaurantListScreen(
        restaurant: restaurant,
      ),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Restaurant"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: restaurant.length,
          itemBuilder: (context, index) {
            return RestaurantCard(restaurant: restaurant[index]);
          },
        ),
      ),
    );
  }
}
