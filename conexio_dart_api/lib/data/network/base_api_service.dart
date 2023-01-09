abstract class BaseApiService {
  Future<dynamic> getGetApiResponse(String url, String token);
  Future<dynamic> getPostApiResponse(String url, dynamic data, String token);
  Future<dynamic> getPutApiResponse(
      String url, String id, dynamic data, String token);
  Future<dynamic> getGetIdApiResponse(String url, String id, String token);
  Future<dynamic> getDeleteApiResponse(String url, String id, String token);
  Future<dynamic> getLoginAcountApiResponse(String url, dynamic data);
}
