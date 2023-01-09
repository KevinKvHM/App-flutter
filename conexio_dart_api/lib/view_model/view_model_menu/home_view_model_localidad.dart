import 'package:conexio_dart_api/model/localidad/localidad_list_model.dart';
import 'package:conexio_dart_api/repository/repository_crud/home_repository_localidad.dart';
import 'package:conexio_dart_api/utils/routes/routes_name.dart';
import 'package:conexio_dart_api/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../data/response/api_response.dart';

class HomeViewModelLocalidad with ChangeNotifier {
  final _myRepo = HomeRepositoryLocalidad();

  ApiResponse<LocalidadModelGet> localidadList = ApiResponse.loading();

  setLocalidadList(ApiResponse<LocalidadModelGet> response) {
    localidadList = response;
    notifyListeners();
  }

  Future<void> fechtLocalidadListApi(String token) async {
    setLocalidadList(ApiResponse.loading());

    _myRepo.fechtLocalidadList(token).then((value) {
      setLocalidadList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setLocalidadList(ApiResponse.error(error.toString()));
    });
  }

  bool _addLoading = false;
  bool get addLoading => _addLoading;
  setAddLoading(bool value) {
    _addLoading = value;
    notifyListeners();
  }

  Future<void> addLocalidadApi(
      dynamic data, String token, BuildContext context) async {
    setAddLoading(true);
    _myRepo.addLocalidadApi(data, token).then((value) {
      setAddLoading(false);
      Utils.toastMessage('Localidad Agregada');
      Navigator.popAndPushNamed(context, RoutesName.localidad);
      // Navigator.pushNamed(context, RoutesName.localidad);

      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setAddLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  bool _putLoading = false;
  bool get putLoading => _putLoading;

  setPutLoading(bool value) {
    _putLoading = value;
    notifyListeners();
  }

  Future<void> putLocalidadApi(
      String id, dynamic data, String token, BuildContext context) async {
    setPutLoading(true);

    _myRepo.putLocalidadApi(id, data, token).then((value) {
      setPutLoading(false);
      Utils.toastMessage("Municipio Actuzalizado");
      Navigator.of(context).popAndPushNamed(RoutesName.localidad);
      //Navigator.pushNamed(context, RoutesName.localidad);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setPutLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }

  bool _deleteLoading = false;
  bool get deleteLoading => _deleteLoading;

  setDeleteLoading(bool value) {
    _deleteLoading = value;
    notifyListeners();
  }

  Future<void> deleteLocalidadApi(
      String id, String token, BuildContext context) async {
    setDeleteLoading(true);

    _myRepo.deleteLocalidadApi(id, token).then((value) {
      setDeleteLoading(false);
      Utils.toastMessage("Localidad Eliminada");

      Navigator.of(context).pop();
      Navigator.of(context).pop();
      Navigator.of(context).pushNamed(RoutesName.localidad);
      //  Navigator.of(context).popAndPushNamed(RoutesName.localidad);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError(
      (error, stackTrace) {
        // setDeleteLoading(false);
        Utils.flushBarErrorMessage(error.toString(), context);
        if (kDebugMode) {
          print(error.toString());
        }
      },
    );
  }
}
