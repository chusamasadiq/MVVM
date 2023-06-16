import 'package:flutter/cupertino.dart';
import 'package:mvvm/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserViewModel with ChangeNotifier {
  Future<bool> saveUser(UserModel user) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString('token', user.token.toString());
    notifyListeners();
    return true;
  }

  Future<UserModel> getUser() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final String? token = sharedPreferences.getString('token');

    return UserModel(token: token.toString());
  }

  Future<bool> remove()async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove('token');
    return sharedPreferences.clear();
  }

}
