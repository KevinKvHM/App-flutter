import 'package:conexio_dart_api/data/network/base_api_service.dart';
import 'package:conexio_dart_api/data/network/network_api_service.dart';
import 'package:conexio_dart_api/model/localidad/localidad_list_model.dart';

import '../../res/api_url.dart';

class HomeRepositoryLocalidad {
  BaseApiService _apiServices = NetworkApiService();

  Future<LocalidadModelGet> fechtLocalidadList(String token) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(
          AppUrl.localidadListGellAllEndPoint, token);

      return response = LocalidadModelGet.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> addLocalidadApi(dynamic data, String token) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.addLocalidadEndPoint, data, token);
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> putLocalidadApi(String id, dynamic data, String token) async {
    try {
      dynamic response = await _apiServices.getPutApiResponse(
          AppUrl.localidadUpdateEndPoint, id, data, token);
      /*  print("putUpdateLocalidadApi: ${id}");
      print(response);*/
      return response;
    } catch (e) {
      /*  kDebugMode() {
        print("Respuesyta: ....$e");
      }*/

      throw e;
    }
  }

  Future<dynamic> deleteLocalidadApi(String id, String token) async {
    try {
      dynamic response = await _apiServices.getDeleteApiResponse(
          AppUrl.localidDeleteEndPoint, id, token);

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
