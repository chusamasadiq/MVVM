import 'package:flutter/cupertino.dart';
import 'package:mvvm/repository/auth_repository.dart';
import 'package:mvvm/utils/routes/routes_name.dart';

import '../utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  bool _loading = false;

  bool get loading => _loading;

  setLoading(value) {
    _loading = value;
    notifyListeners();
  }

  final _myRepo = AuthRepository();

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value) {
      setLoading(false);
      Utils.flutterToast('Login Successfully');
      Navigator.pushNamed(context, RoutesName.home);
      print(value.toString());
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flutterToast(error.toString());
      print(error.toString());
    });
  }

  Future<void> signUpApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.registerApi(data).then((value) {
      setLoading(false);
      Utils.flutterToast('Register Successfully');
      Navigator.pushNamed(context, RoutesName.home);
      print(value.toString());
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flutterToast(error.toString());
      print(error.toString());
    });
  }
}
