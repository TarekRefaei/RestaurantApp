import 'package:flutter/material.dart';


class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({Key? key}) : super(key: key);

  static const String routeName = '/checkout';

  static Route route() {
    return MaterialPageRoute(
        builder: (context) => const CheckOutScreen() ,
        settings: const RouteSettings(name: routeName)
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("checkout"),
      ),
    );
  }
}