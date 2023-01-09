import 'package:conexio_dart_api/data/network/base_api_service.dart';
import 'package:conexio_dart_api/data/network/network_api_service.dart';
import 'package:conexio_dart_api/model/region/region_list_model.dart';
import 'package:conexio_dart_api/model/region/region_model_get_id.dart';
import 'package:conexio_dart_api/res/api_url.dart';

class HomeRepositoryRegion {
  BaseApiService _apiServices = NetworkApiService();

  Future<RegionModelGet> fechtRegionList(String token) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(
          AppUrl.regionListGellAllEndPoint, token);

      return response = RegionModelGet.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<ModelRegionGetId> fechtRegionIdDetails(String id, String token) async {
    try {
      dynamic response = await _apiServices.getGetIdApiResponse(
          AppUrl.regionGetIdEndPoint, id, token);

      return response = ModelRegionGetId.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> addRegionApi(dynamic data, String token) async {
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

  Future<RegionModelGet> fechtRegionAndMuniList(String token) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(
          AppUrl.muniRegionListGellAllEndPoint, token);

      return response = RegionModelGet.fromJson(response);
    } catch (e) {
      throw e;
    }
  }
}
