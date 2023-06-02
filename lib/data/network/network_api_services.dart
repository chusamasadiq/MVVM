import 'dart:convert';
import 'dart:io';
import 'package:mvvm/data/app_exceptions.dart';
import 'package:mvvm/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkAPIResponse extends BaseApiServices {
  // Get API Calling
  @override
  Future getGetAPIResponse(String url) async {
    try {
      dynamic jsonResponse;
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(minutes: 1));

      jsonResponse = returnResponse(response);

      return jsonResponse;
    } on SocketException {
      throw FetchDataException('No internet connection');
    }
  }

  // Post API Calling
  @override
  Future getPostAPIResponse(String url, dynamic data) async {
    try {
      dynamic jsonResponse;
      final response = await http
          .post(
            Uri.parse(url),
            body: data,
          )
          .timeout(const Duration(minutes: 1));

      jsonResponse = returnResponse(response);

      return jsonResponse;
    } on SocketException {
      throw FetchDataException('No internet connection');
    }
  }

  // Function for handing the response
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;

      case 400:
        throw BadRequestException(response.body.toString());

      case 500:
      case 404:
        throw UnauthorizedException(response.body.toString());

      default:
        throw FetchDataException(
            'Error occurred while communicating the  sever' +
                'with status code' +
                response.statusCode.toString());
    }
  }
}
