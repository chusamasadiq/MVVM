import 'package:flutter/cupertino.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/viewmodel/user_view_model.dart';

import '../../model/user_model.dart';

class SplashServices {
  Future<UserModel> getUserData() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) {
    getUserData().then((value) async {
      if (value == 'null' && value.token == '') {
        await Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.login);
      } else {
        await Future.delayed(const Duration(seconds: 3));
        Navigator.pushNamed(context, RoutesName.home);
      }
    });
  }
}
