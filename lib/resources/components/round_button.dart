import 'package:flutter/material.dart';

class RoundButtonWidget extends StatelessWidget {
  final Color? color;
  final VoidCallback onPress;
  final Widget child;

  const RoundButtonWidget({
    super.key,
    required this.color,
    required this.onPress,
    required this.child,
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
        onPressed: onPress,
        child: child,
      ),
    );
  }
}
