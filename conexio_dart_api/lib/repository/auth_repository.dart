import 'package:conexio_dart_api/data/network/base_api_service.dart';
import 'package:conexio_dart_api/data/network/network_api_service.dart';

import '../res/api_url.dart';

class AuthRepository {
  BaseApiService _apiServices = NetworkApiService();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getLoginAcountApiResponse(
          AppUrl.loginEndPoint, data);
      return response;
    } catch (e) {
      rethrow;
      //throw e;
    }
  }

  Future<dynamic> signUpApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getLoginAcountApiResponse(
          AppUrl.registerEndPoint, data);
      return response;
    } catch (e) {
      // rethrow;
      throw e;
    }
  }
}
