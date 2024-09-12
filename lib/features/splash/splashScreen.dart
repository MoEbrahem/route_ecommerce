import 'dart:async';

import 'package:flutter/material.dart';
import 'package:route_ecommerce/core/resources/asset_manager.dart';
import 'package:route_ecommerce/core/routes_manager/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).pushNamed(Routes.signInRoutes);
      },
    );
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Image.asset(
        ImageAssets.splashScreen,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}
