import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  late TextEditingController controller = TextEditingController();
  late String? labelText;
  late String? hintText;
  late bool obscureText;
  late bool enabled;
  Icon prefixIcon;
  dynamic onValidator;
  Widget? suffixIcon;
  dynamic onFieldSubmitted;
  FocusNode? focusNode;

  TextFieldWidget({
    super.key,
    required this.controller,
    required this.labelText,
    required this.prefixIcon,
    required this.hintText,
    required this.onValidator,
    this.obscureText = false,
    this.enabled = true,
    this.suffixIcon,
    this.onFieldSubmitted,
    this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      validator: onValidator,
      obscureText: obscureText,
      controller: controller,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        labelText: labelText.toString(),
        hintText: hintText.toString(),
        border: const OutlineInputBorder(
          borderSide: BorderSide(),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(),
        ),
      ),
    );
  }
}
