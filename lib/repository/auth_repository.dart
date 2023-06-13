import 'package:mvvm/data/network/base_api_services.dart';
import 'package:mvvm/data/network/network_api_services.dart';
import 'package:mvvm/resources/app_url.dart';

class AuthRepository {
  BaseApiServices apiServices = NetworkAPIResponse();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await apiServices.getPostAPIResponse(AppUrl.loginApiEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> registerApi(dynamic data) async {
    try {
      dynamic response =
      await apiServices.getPostAPIResponse(AppUrl.registerApiEndPoint, data);
      return response;
    } catch (e) {
      throw e;
    }
  }
}
