import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import '../../view/home_screen.dart';
import '../../view/login_view.dart';
import '../../view/splash_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.login:
        return MaterialPageRoute(
          builder: (BuildContext context) => const LoginView(),
        );

      }



    // This code will only be reached if none of the above cases match
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        body: Center(child: Text('No route Found')),
      );
    });
  }
}
