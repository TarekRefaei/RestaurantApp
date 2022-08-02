import 'package:flutter/material.dart';
import 'package:food_delivery_app/widgets/restaurantTags.dart';
import '../models/models.dart';

class RestaurantInfo extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantInfo({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            restaurant.name,
            style: Theme.of(context)
                .textTheme
                .headline3
                ?.copyWith(color: Theme.of(context).primaryColor),
          ),
          const SizedBox(height: 10),
          RestaurantTags(restaurant: restaurant),
          const SizedBox(height: 5),
          Text(
            '${restaurant.distance} km away - \$ ${restaurant.deliveryFee} delivery Fee',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: Theme.of(context).primaryColor),
          ),
          const SizedBox(height: 10),
          Text(
            'Restaurant Information ',
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(color: Theme.of(context).primaryColor),
          ),
          const SizedBox(height: 10),
          Text(
            'Restaurant Information Restaurant Information Restaurant Information ',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
