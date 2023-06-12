import 'package:flutter/material.dart';
import 'package:mvvm/resources/components/round_button.dart';
import 'package:mvvm/utils/colors.dart';
import '../resources/components/textfield.dart';
import '../utils/utils.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  final ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(title: const Text('Login Screen')),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFieldWidget(
              controller: _emailController,
              focusNode: emailFocusNode,
              labelText: 'Email',
              hintText: 'Email',
              onValidator: null,
              prefixIcon: const Icon(Icons.email),
              onFieldSubmitted: (value) {
                Utils.fieldFocusNode(context, emailFocusNode, passwordFocusNode);
              },
            ),
            SizedBox(height: screenHeight * 0.02),
            TextFieldWidget(
              focusNode: passwordFocusNode,
              obscureText: _obscurePassword.value,
              controller: _passwordController,
              labelText: 'Password',
              hintText: 'Password',
              onValidator: null,
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: InkWell(
                onTap: (){
                  _obscurePassword.value =! _obscurePassword.value;
                },
                  child: const Icon(Icons.remove_red_eye)),
            ),
            SizedBox(height: screenHeight * 0.02),
            RoundButtonWidget(color: primaryColor, onPress: (){
              if(_emailController.text.isEmpty && _passwordController.text.isEmpty){
                Utils.flushBarErrorMessage('Invalid Input', context);

              }
              }, child: const Text('Login', style: TextStyle(color: Colors.white),))
          ],
        ),
      ),
    );
  }
}
