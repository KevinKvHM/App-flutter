import 'package:conexio_dart_api/res/color.dart';
import 'package:conexio_dart_api/view_model/services/splash_service.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashService splashServices = SplashService();

  @override
  void initState() {
    super.initState();
    splashServices.checkAuthentication(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          height: double.infinity,
          width: double.infinity,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Image.network(
              'https://i0.wp.com/serendipia.digital/wp-content/uploads/2020/01/becas-benito-juarez-660-amlo-.jpg?fit=660%2C370&ssl=1',
            ),
          ),
        ) /*Text(
          'Representación Estatal de Becas Benito Juárez, Oaxaca',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),*/
        //style: Theme.of(context).textTheme.headline4,
        );
  }
}