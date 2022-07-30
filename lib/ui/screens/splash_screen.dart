import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const String routeName = '/splash';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => const SplashScreen(),
      settings: const RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo/logo.png',
              height: 200,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, "/");
              },
              child: const Text(
                'Main Screen',
                style: TextStyle(color: Colors.amber),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Image.asset(
              'assets/logo/refaeiLogo.png',
              height: 80,
            ),
          ],
        ),
      ),
    );
  }
}
