import 'package:conexio_dart_api/model/user_model.dart';
import 'package:conexio_dart_api/repository/auth_repository.dart';
import 'package:conexio_dart_api/utils/routes/routes_name.dart';
import 'package:conexio_dart_api/view_model/user_view_model.dart';
import 'package:provider/provider.dart';
import '/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);

    _myRepo.loginApi(data).then((value) {
      setLoading(false);

      final userPreferences =
          Provider.of<UserViewModel>(context, listen: false);
      var userInstance = User.fromJson(value['user']);
      userPreferences.saveUser(
          UserModel(user: userInstance, token: value['token'].toString()));

      Utils.flushBarErrorMessage('Inicio De Sesion Correcta', context);
      Navigator.pushNamed(context, RoutesName.home);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        //Utils.flushBarErrorMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }

  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;
  setSignUpLoading(bool value) {
    _signUpLoading = value;
    notifyListeners();
  }

  Future<void> signUpApi(dynamic data, BuildContext context) async {
    setSignUpLoading(true);

    _myRepo.signUpApi(data).then((value) {
      setSignUpLoading(false);

      //Navigator.pushNamed(context, RoutesName.home);
      Navigator.pushNamed(context, RoutesName.login);

      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setSignUpLoading(false);
      Utils.flushBarErrorMessage(error.toString(), context);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
