import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  String name = 'Usama';
  HomeScreen({super.key, required this.name});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.name);
  }
}
