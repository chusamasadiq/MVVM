import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_name.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, RoutesName.login);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome to MVVM'),
      ),
      body: Center(
        child: Image.asset('assets/images/mvvm.png'),
      ),
    );
  }
}
