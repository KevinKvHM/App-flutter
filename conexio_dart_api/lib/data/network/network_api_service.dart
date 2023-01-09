import 'dart:convert';
import 'dart:io';
import 'package:conexio_dart_api/data/app_exceptions.dart';
import 'package:conexio_dart_api/data/network/base_api_service.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
//import 'package:http/http.dart';

class NetworkApiService extends BaseApiService {
  @override
  Future getGetApiResponse(String url, String token) async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(url), headers: {
        'Authorization': 'Bearer $token'
      }).timeout(const Duration(seconds: 10));
      // await get(Uri.parse(url)).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FechtDataException("No tiene conexion a internet");
    }
    return responseJson;
  }

  @override
  Future getGetIdApiResponse(String url, String id, String token) async {
    dynamic responseJson;
    print("Data Network $url$id");
    try {
      final response = await http.get(Uri.parse("$url$id"), headers: {
        'Authorization': 'Bearer ${token}'
      }).timeout(const Duration(seconds: 10));

      responseJson = returnResponse(response);
    } on SocketException {
      throw FechtDataException("No tiene conexion a internet");
    }
    return responseJson;
  }

//   headers: {'Authorization': 'Bearer ${token}'},
  @override
  Future getPostApiResponse(String url, dynamic data, String token) async {
    dynamic responseJson;
    print("Data $url+$data");
    try {
      http.Response response = await http
          .post(Uri.parse(url),
              headers: {'Authorization': 'Bearer ${token}'}, body: data)
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
      if (kDebugMode) {
        print(response.toString());
      }
    } on SocketException {
      throw FechtDataException("No tiene conexion a internet");
    }
    return responseJson;
  }

  @override
  Future getLoginAcountApiResponse(String url, data) async {
    dynamic responseJson;
    print("Data $url+$data");
    try {
      http.Response response = await http
          .post(Uri.parse(url), body: data)
          .timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
      if (kDebugMode) {
        print(response.toString());
      }
    } on SocketException {
      throw FechtDataException("No tiene conexion a internet");
    }
    return responseJson;
  }

  @override
  Future getPutApiResponse(String url, String id, data, String token) async {
    dynamic responseJson;
    print("Data Network $url$id");
    print("Data Network $id ");
    print("Data Network $data");

    try {
      http.Response response = await http
          .put(Uri.parse("$url$id"),
              headers: {'Authorization': 'Bearer ${token}'},
              // headers: {'Authorization': 'Bearer ${token}'},
              body: data)
          .timeout(const Duration(seconds: 30));
      responseJson = returnResponse(response);

      if (kDebugMode) {
        print(response.toString());
      }
    } on SocketException {
      throw FechtDataException("No tiene conexion a internet");
    }
    print("URL: $url$id .......datos desde NETWOK: $responseJson");
    return responseJson;
  }

  @override
  Future getDeleteApiResponse(String url, String id, String token) async {
    dynamic responseJson;
    print("Data Network $url");
    print("Data Network $id ");

    try {
      http.Response response = await http.delete(
        Uri.parse("$url$id"),
        headers: {'Authorization': 'Bearer ${token}'},
      ).timeout(const Duration(seconds: 10));
      responseJson = returnResponse(response);
      print("Respues ne: $responseJson");
      if (kDebugMode) {
        print(response.toString());
      }
    } on SocketException {
      throw FechtDataException("No tiene conexion a internet");
    }
    print("URL: $url$id .......datos desde NETWOK: $responseJson");
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    // dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 201:
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
        throw NoFoundException(response.body.toString());
      //case:500
      case 500:
        throw MessageApiResponseError(response.body.toString());
      default:
        throw FechtDataException(' con código de estado${response.statusCode}');
    }
  }
}
