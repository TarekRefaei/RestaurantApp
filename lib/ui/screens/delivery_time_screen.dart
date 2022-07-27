import 'package:flutter/material.dart';


class DeliveryTimeScreen extends StatelessWidget {
  const DeliveryTimeScreen({Key? key}) : super(key: key);

  static const String routeName = '/deliveryTime';

  static Route route() {
    return MaterialPageRoute(
        builder: (context) => const DeliveryTimeScreen() ,
        settings: const RouteSettings(name: routeName)
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("deliveryTime"),
      ),
    );
  }
}