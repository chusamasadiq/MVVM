// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:mvvm/resources/colors.dart';

class RoundButtonWidget extends StatelessWidget {
  final Color? color;
  final VoidCallback onPressed;
  final String title;
  bool loading;

  RoundButtonWidget({
    super.key,
    required this.color,
    required this.onPressed,
    required this.title,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        onPressed: onPressed,
        child: Center(
          child: loading
              ? const CircularProgressIndicator(color: whiteColor)
              : Text(
                  title,
                  style: const TextStyle(color: whiteColor),
                ),
        ),
      ),
    );
  }
}
