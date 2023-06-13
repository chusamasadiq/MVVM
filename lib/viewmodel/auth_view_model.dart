import 'package:flutter/cupertino.dart';
import 'package:mvvm/repository/auth_repository.dart';

class AuthViewModel with ChangeNotifier{

  final _myRepo = AuthRepository();

  Future<void> loginApi(dynamic data) async{
    _myRepo.loginApi(data).then((value) {

    }).onError((error, stackTrace) {});
  }

}