import 'package:diploy_assignment/features/cart/presentation/screens/cart_screen.dart';
import 'package:diploy_assignment/features/product/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

const homeRoute = '/';
const cartRoute = '/cart';

class AppRouter {
  static Route<dynamic> generateRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            return const HomeScreen();
          },
        );
      case cartRoute:
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            return const CartScreen();
          },
        );

      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            return const Scaffold();
          },
        );
    }
  }
}
