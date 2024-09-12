import 'package:flutter/material.dart';
import 'package:route_ecommerce/core/routes_manager/routes.dart';
import 'package:route_ecommerce/features/HomeScreen/homeScreen.dart';
import 'package:route_ecommerce/features/authpresentationscreen/login/LoginScreen.dart';
import 'package:route_ecommerce/features/splash/splashScreen.dart';

import '../../features/authpresentationscreen/register/RegisterScreen.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );
      case Routes.signInRoutes:
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );
      case Routes.registerRoutes:
        return MaterialPageRoute(
        builder: (_) => RegisterScreen(),
        );
      case Routes.homeScreenRoutes:
        return MaterialPageRoute(
        builder: (_) => HomeScreen(),
        );  
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text('No Route Found'),
        ),
        body: const Center(
          child: Text('No Route Found'),
        ),
      ),
    );
  }
}
