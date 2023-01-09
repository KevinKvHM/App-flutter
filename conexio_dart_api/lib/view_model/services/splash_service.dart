import 'package:conexio_dart_api/model/user_model.dart';
import 'package:conexio_dart_api/utils/routes/routes_name.dart';
import 'package:conexio_dart_api/view_model/user_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class SplashService {
  Future<UserModel> getUserDate() => UserViewModel().getUser();

  void checkAuthentication(BuildContext context) async {
    getUserDate().then((value) async {
      if (value.token.toString() == 'null' || value.token.toString() == "") {
        //await Future.delayed(Duration(days: 3));
        await Future.delayed(Duration(seconds: 2));
        Navigator.pushNamed(context, RoutesName.login);
      } else {
        await Future.delayed(Duration(seconds: 2));
        Navigator.pushNamed(context, RoutesName.home);
        print("Token: " + value.token.toString());
        print(value.user!.toJson().toString());
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
