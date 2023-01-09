import 'package:conexio_dart_api/data/network/base_api_service.dart';
import 'package:conexio_dart_api/data/network/network_api_service.dart';
import 'package:conexio_dart_api/model/sare/sares_model.dart';
import 'package:conexio_dart_api/res/api_url.dart';

class HomeRepositorySare {
  BaseApiService _apiServices = NetworkApiService();

  Future<SaresModel> fechtSareList(String token) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(
          AppUrl.sareListGellAllEndPoint, token);

      return response = SaresModel.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> addSareApi(dynamic data, String token) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.addSaresEndPoint, data, token);

      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> deleteSareApi(String id, String token) async {
    try {
      dynamic response = await _apiServices.getDeleteApiResponse(
          AppUrl.deleteSaresEndPoint, id, token);

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> putSareApi(String id, dynamic data, String token) async {
    try {
      dynamic response = await _apiServices.getPutApiResponse(
          AppUrl.updateSares, id, data, token);
      return response;
    } catch (e) {
      throw e;
    }
  }
/*
  Future<dynamic> addSareApi(dynamic data, String token) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.addRegionEndPoint, data, token);

      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> putRegionApi(String id, dynamic data, String token) async {
    try {
      dynamic response = await _apiServices.getPutApiResponse(
          AppUrl.regionUpdateEndPoint, id, data, token);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> deleteRegionApi(String id, String token) async {
    try {
      dynamic response = await _apiServices.getDeleteApiResponse(
          AppUrl.regionDeleteEndPoint, id, token);

      return response;
    } catch (e) {
      rethrow;
    }
  }

 */
}
