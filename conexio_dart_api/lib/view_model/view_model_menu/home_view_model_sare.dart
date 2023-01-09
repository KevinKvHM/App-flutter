import 'package:conexio_dart_api/data/response/api_response.dart';
import 'package:conexio_dart_api/model/sare/sares_model.dart';
import 'package:conexio_dart_api/repository/repository_crud/home_repository_sare.dart';
import 'package:conexio_dart_api/utils/routes/routes_name.dart';
import 'package:conexio_dart_api/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class HomeViewModelSare with ChangeNotifier {
  final _myRepo = HomeRepositorySare();

  bool _addLoading = false;
  bool get addLoading => _addLoading;

//TODO: para lo metodos post and put
  setAddLoading(bool value) {
    _addLoading = value;
    notifyListeners();
  }

//TODO: para lo metodos get
  ApiResponse<SaresModel> sareList = ApiResponse.loading();

  setSareList(ApiResponse<SaresModel> response) {
    sareList = response;
    notifyListeners();
  }

  Future<void> fechtSaresListApi(String token) async {
    setSareList(ApiResponse.loading());

    _myRepo.fechtSareList(token).then((value) {
      setSareList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setSareList(ApiResponse.error(error.toString()));
    });
  }

  Future<void> addSareApi(
      dynamic data, String token, BuildContext context) async {
    setAddLoading(true);

    _myRepo.addSareApi(data, token).then((value) {
      setAddLoading(false);

      Utils.toastMessage('Sarea añadida');

      Navigator.popAndPushNamed(context, RoutesName.sare);
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

  Future<void> deleteSareApi(
      String id, String token, BuildContext context) async {
    setDeleteLoading(true);

    _myRepo.deleteSareApi(id, token).then((value) {
      setDeleteLoading(false);
      Utils.toastMessage("Region Eliminada");

      //Navigator.of(context).popAndPushNamed(RoutesName.region);
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      Navigator.of(context).pushNamed(RoutesName.sare);
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

  bool _putLoading = false;
  bool get putLoading => _putLoading;

  setPutLoading(bool value) {
    _putLoading = value;
    notifyListeners();
  }

  Future<void> putSareApi(
      String id, dynamic data, String token, BuildContext context) async {
    setAddLoading(true);

    _myRepo.putSareApi(id, data, token).then((value) {
      setPutLoading(false);

      Utils.toastMessage("Sare Actualizada");

      Navigator.of(context).popAndPushNamed(RoutesName.sare);
      /* Navigator.pushNamedAndRemoveUntil(
          context, RoutesName.region, (Route<dynamic> route) => false);*/

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
}
