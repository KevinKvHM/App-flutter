import 'package:conexio_dart_api/data/response/api_response.dart';
import 'package:conexio_dart_api/model/municipio/municipio_list_model.dart';
import 'package:conexio_dart_api/repository/repository_crud/home_repositoru_municipio.dart';
import 'package:conexio_dart_api/utils/routes/routes_name.dart';
import 'package:conexio_dart_api/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeViewModelMunicipio with ChangeNotifier {
  final _muyRepo = HomeRepositoryMunicipio();

  ApiResponse<MunicipioModelGet> municipioList = ApiResponse.loading();

  setMunicipioList(ApiResponse<MunicipioModelGet> response) {
    municipioList = response;
    notifyListeners();
  }

  Future<void> fechtMunicipioListApi(
    String token,
  ) async {
    setMunicipioList(ApiResponse.loading());

    _muyRepo.fechtMunicipioList(token).then((value) {
      setMunicipioList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setMunicipioList(ApiResponse.error(error.toString()));
    });
  }

  bool _addLoading = false;
  bool get addLoading => _addLoading;
  setAddLoading(bool value) {
    _addLoading = value;
    notifyListeners();
  }

  Future<void> addMunicipioApi(
      dynamic data, String token, BuildContext context) async {
    setAddLoading(true);
    _muyRepo.addMunicipioApi(data, token).then((value) {
      setAddLoading(false);
      Utils.toastMessage('Municipio agregado');
      Navigator.popAndPushNamed(context, RoutesName.municipio);
      // Navigator.pushNamed(context, RoutesName.municipio);

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

  Future<void> putMunicipioApi(
      String id, dynamic data, String token, BuildContext context) async {
    setAddLoading(true);

    _muyRepo.putMunicipioApi(id, data, token).then((value) {
      setPutLoading(false);
      Utils.toastMessage("Municipio Actuzalizado");
      Navigator.of(context).popAndPushNamed(RoutesName.municipio);
      //Navigator.pushNamed(context, RoutesName.regionPut);
      // Navigator.pushNamed(context, RoutesName.municipio);
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

  bool _deleteLoading = false;
  bool get deleteLoading => _deleteLoading;

  setDeleteLoading(bool value) {
    _deleteLoading = value;
    notifyListeners();
  }

  Future<void> deleteMunicipioApi(
      String id, String token, BuildContext context) async {
    setDeleteLoading(true);

    _muyRepo.deleteMunicipioApi(id, token).then((value) {
      setDeleteLoading(false);
      Utils.toastMessage("Municipio Eliminado");
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      Navigator.of(context).pushNamed(RoutesName.municipio);
      // Navigator.of(context).popAndPushNamed(RoutesName.municipio);

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
