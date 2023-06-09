import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/view/register_view.dart';
import '../../view/home_view.dart';
import '../../view/login_view.dart';
import '../../view/splash_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
          builder: (BuildContext context) => const SplashView(),
        );

      case RoutesName.login:
        return MaterialPageRoute(
          builder: (BuildContext context) => const LoginView(),
        );

      case RoutesName.home:
        return MaterialPageRoute(
          builder: (BuildContext context) => const HomeView(),
        );

      case RoutesName.register:
        return MaterialPageRoute(
          builder: (BuildContext context) => const RegisterView(),
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
