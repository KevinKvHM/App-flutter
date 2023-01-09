import '../data/network/base_api_service.dart';
import '../data/network/network_api_service.dart';
import '../model/user_list_model.dart';
import '../res/api_url.dart';

class HomeRepository {
  BaseApiService _apiServices = NetworkApiService();
  Future<RolesList> fetchRolesList(String token) async {
    try {
      dynamic response =
          await _apiServices.getGetApiResponse(AppUrl.listAllRoles, token);
      return response = RolesList.fromJson(response);
    } catch (e) {
      //rethrow;
      throw e;
    }
  }

  Future<UserListModel> fetchUserList(String token) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(
          AppUrl.userListGellAllEndPoint, token);
      return response = UserListModel.fromJson(response);
    } catch (e) {
      //rethrow;
      throw e;
    }
  }

  Future<dynamic> putPasswordApi(String id, dynamic data, String token) async {
    try {
      dynamic response = await _apiServices.getPutApiResponse(
          AppUrl.userUpdatePassword, id, data, token);
      print("putRegionApi: ${id}");
      print(response);
      return response;
    } catch (e) {
      kDebugMode() {
        print("Respuesta: ....$e");
      }

      rethrow;
    }
  }

  Future<dynamic> putRolUserApi(String id, dynamic data, String token) async {
    try {
      dynamic response = await _apiServices.getPutApiResponse(
          AppUrl.userUpdateRole, id, data, token);
      print("putRegionApi: ${id}");
      print(response);
      return response;
    } catch (e) {
      kDebugMode() {
        print("Respuesta: ....$e");
      }

      rethrow;
    }
  }

  Future<dynamic> fechUserDataId(String id, String token) async {
    try {
      dynamic response = await _apiServices.getGetIdApiResponse(
          AppUrl.userIdDataEndPoint, id, token);
      //print("fechUserDataId: ${id}");

      return response;
    } catch (e) {
      kDebugMode() {
        print("Respuesyta: ....$e");
      }

      rethrow;
    }
  }

  Future<dynamic> deleteUserApi(String id, String token) async {
    try {
      dynamic response = await _apiServices.getDeleteApiResponse(
          AppUrl.userDeleteUser, id, token);

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> putEmployeeDataApi(
      String id, dynamic data, String token) async {
    try {
      dynamic response = await _apiServices.getPutApiResponse(
          AppUrl.employeeDataUpdate, id, data, token);

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
