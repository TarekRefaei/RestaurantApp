import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/models.dart';
import 'package:food_delivery_app/ui/screens/screens.dart';

class AppRouter {
  static Route onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return HomeScreen.route();
      case LocationScreen.routeName:
        return LocationScreen.route();
      case BasketScreen.routeName:
        return BasketScreen.route();
      case EditBasketScreen.routeName:
        return EditBasketScreen.route();
      case RestaurantDetailsScreen.routeName:
        return RestaurantDetailsScreen.route(
            restaurant: settings.arguments as Restaurant);
      case RestaurantListScreen.routeName:
        return RestaurantListScreen.route(
            restaurant: settings.arguments as List<Restaurant>);
      case VoucherScreen.routeName:
        return VoucherScreen.route();
      case FilterScreen.routeName:
        return FilterScreen.route();
      case DeliveryTimeScreen.routeName:
        return DeliveryTimeScreen.route();
      case CheckOutScreen.routeName:
        return CheckOutScreen.route();
      case SplashScreen.routeName:
        return SplashScreen.route();
    }
    return _errorRoute();
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text("Error"),
        ),
      ),
      settings: const RouteSettings(name: '/error'),
    );
  }
}
