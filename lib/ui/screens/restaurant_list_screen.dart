import 'package:flutter/material.dart';


class RestaurantListScreen extends StatelessWidget {
  const RestaurantListScreen({Key? key}) : super(key: key);

  static const String routeName = '/restaurant List';

  static Route route() {
    return MaterialPageRoute(
        builder: (context) => const RestaurantListScreen() ,
        settings: const RouteSettings(name: routeName)
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("restaurant List"),
      ),
    );
  }
}