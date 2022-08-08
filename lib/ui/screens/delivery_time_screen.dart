import 'package:flutter/material.dart';

class DeliveryTimeScreen extends StatelessWidget {
  const DeliveryTimeScreen({Key? key}) : super(key: key);

  static const String routeName = '/deliveryTime';

  static Route route() {
    return MaterialPageRoute(
        builder: (context) => const DeliveryTimeScreen(),
        settings: const RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          "Delivery",
          style: Theme.of(context)
              .textTheme
              .headline4
              ?.copyWith(color: Colors.white),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor,
                shape: const RoundedRectangleBorder(),
                padding: const EdgeInsets.symmetric(horizontal: 50),
              ),
              onPressed: () {},
              child: const Text('Confirm'),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              "Select a Date :",
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(color: Theme.of(context).primaryColor),
            ),
            Container(
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Today",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          ?.copyWith(color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Tomorrow",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          ?.copyWith(color: Colors.white),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
