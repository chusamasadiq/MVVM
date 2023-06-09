import 'package:flutter/material.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/viewmodel/auth_view_model.dart';
import 'package:provider/provider.dart';

import '../resources/colors.dart';
import '../resources/components/round_button.dart';
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
  final ValueNotifier<bool> _obscurePassword = ValueNotifier<bool>(true);

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();

    _obscurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final authViewModel = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(
          title: const Text('Login Screen'), automaticallyImplyLeading: false),
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
                Utils.fieldFocusNode(
                    context, emailFocusNode, passwordFocusNode);
              },
            ),
            SizedBox(height: screenHeight * 0.02),
            ValueListenableBuilder(
              valueListenable: _obscurePassword,
              builder: (context, value, child) {
                return TextFieldWidget(
                  focusNode: passwordFocusNode,
                  obscureText: _obscurePassword.value,
                  controller: _passwordController,
                  labelText: 'Password',
                  hintText: 'Password',
                  onValidator: null,
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: InkWell(
                    onTap: () {
                      _obscurePassword.value = !_obscurePassword.value;
                    },
                    child: Icon(_obscurePassword.value
                        ? Icons.visibility_off_outlined
                        : Icons.visibility),
                  ),
                );
              },
            ),
            SizedBox(height: screenHeight * 0.02),
            RoundButtonWidget(
              loading: authViewModel.loading,
              color: primaryColor,
              onPressed: () {
                if (_emailController.text.isEmpty) {
                  Utils.showSnackbar('Please enter email', context);
                } else if (_passwordController.text.isEmpty) {
                  Utils.showSnackbar('Please enter password', context);
                } else if (_passwordController.text.length < 6) {
                  Utils.showSnackbar(
                      'Please enter at least 6 characters', context);
                } else {
                  Map data = {
                    'email': _emailController.toString(),
                    'password': _passwordController.toString()
                  };
                  authViewModel.loginApi(data, context);
                  print('hit api');
                }
              },
              title: 'Login',
            ),
            TextButton(
              onPressed: () =>
                  Navigator.pushNamed(context, RoutesName.register),
              child: Text('Sign Up'),
            )
          ],
        ),
      ),
    );
  }
}
