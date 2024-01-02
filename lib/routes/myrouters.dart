import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/main_screen/main_screen.dart';
import 'package:flutter_application_1/view/splashscreen/splashscreen.dart';

class MyRoutes {
  static Route<dynamic>? generatedRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/splash':
        return MaterialPageRoute(
          builder: (context) => SplashScreen(),
        );
      case '/home':
        return MaterialPageRoute(
          builder: (context) => MainScreenPage(),
        );
      default:
        return null;
    }
  }
}
