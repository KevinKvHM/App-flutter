import 'package:conexio_dart_api/utils/routes/routes_name.dart';
import 'package:conexio_dart_api/view_model/auth_view_model.dart';
import 'package:conexio_dart_api/view_model/home_view_model.dart';
import 'package:conexio_dart_api/view_model/school/home_view_model_school.dart';
import 'package:conexio_dart_api/view_model/view_model_menu/home_view_model_localidad.dart';
import 'package:conexio_dart_api/view_model/view_model_menu/home_view_model_municipio.dart';
import 'package:conexio_dart_api/view_model/view_model_menu/home_view_model_region.dart';
import 'package:conexio_dart_api/view_model/user_view_model.dart';
import 'package:conexio_dart_api/view_model/view_model_menu/home_view_model_sare.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'utils/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => HomeViewModelRegion()),
        ChangeNotifierProvider(create: (_) => HomeViewModelSare()),
        ChangeNotifierProvider(create: (_) => HomeViewModelMunicipio()),
        ChangeNotifierProvider(create: (_) => HomeViewModelLocalidad()),
        ChangeNotifierProvider(create: (_) => HomeViewModelScholl())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Directorios Escolares',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        //home: HomeScreenAdmin(),
        //home: HomeScreenLocalidad(),
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
