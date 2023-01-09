import 'package:conexio_dart_api/data/network/base_api_service.dart';
import 'package:conexio_dart_api/data/network/network_api_service.dart';
import 'package:conexio_dart_api/model/school/school_list_model.dart';
import 'package:conexio_dart_api/res/api_url.dart';

class HomeRepositorySchool {
  BaseApiService _apiServices = NetworkApiService();

  Future<SchoolModelGet> fechtSchoolList(String token) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(
          AppUrl.schoolListGellAllEndPoint, token);

      return response = SchoolModelGet.fromJson(response);
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> addSchoolApi(dynamic data, String token) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(
          AppUrl.addSchollEndPoint, data, token);
      return response;
    } catch (e) {
      throw e;
    }
  }

  //Update school
  Future<dynamic> putSchoolApi(String id, dynamic data, String token) async {
    try {
      dynamic response = await _apiServices.getPutApiResponse(
          AppUrl.schoolUpdateEndPoint, id, data, token);
      print("putSchoolApi: ${id}");
      print(response);
      return response;
    } catch (e) {
      kDebugMode() {
        print("Respuesta: ....$e");
      }

      throw e;
    }
  }

  //Director
  Future<dynamic> putDataDirectorApi(
      String id, dynamic data, String token) async {
    try {
      dynamic response = await _apiServices.getPutApiResponse(
          AppUrl.directorUpdateEndPoint, id, data, token);
      print("putSchoolApi: ${id}");
      print(response);
      return response;
    } catch (e) {
      kDebugMode() {
        print("Respuesta: ....$e");
      }

      throw e;
    }
  }

  //Supervisor
  Future<dynamic> putDataSupervisorApi(String id, dynamic data, token) async {
    try {
      dynamic response = await _apiServices.getPutApiResponse(
          AppUrl.supervisorUpdateEndPoint, id, data, token);
      print("putSchoolApi: ${id}");
      print(response);
      return response;
    } catch (e) {
      kDebugMode() {
        print("Respuesta: ....$e");
      }

      throw e;
    }
  }

  Future<dynamic> deleteSchoolApi(String id, String token) async {
    try {
      dynamic response = await _apiServices.getDeleteApiResponse(
          AppUrl.schoollDeleteEndPoint, id, token);

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
