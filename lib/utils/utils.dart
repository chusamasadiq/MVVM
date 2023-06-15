import 'package:another_flushbar/flushbar_route.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:mvvm/resources/colors.dart';

class Utils {
  static void fieldFocusNode(
    BuildContext context,
    FocusNode current,
    FocusNode nextFocus,
  ) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static void flutterToast(String message) {
    Fluttertoast.showToast(msg: message, textColor: Colors.white);
  }

  static flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.decelerate,
        message: message,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(15),
        backgroundColor: Colors.red,
        reverseAnimationCurve: Curves.easeInOut,
        duration: const Duration(seconds: 4),
        icon: const Icon(Icons.error, color: Colors.white),
      ),
    );
  }

  static showSnackbar(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: primaryColor,
        content: Text(
          message,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.red
          ),
        ),
      ),
    );
  }
}
