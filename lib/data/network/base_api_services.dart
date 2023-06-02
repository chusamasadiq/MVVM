abstract class BaseApiServices {
  // Get Request API
  Future<dynamic> getGetAPIResponse(String url);

  // Post Request API
  Future<dynamic> getPostAPIResponse(String url, dynamic data);
}
