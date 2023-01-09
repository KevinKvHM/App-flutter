import 'package:conexio_dart_api/utils/routes/routes_name.dart';
import 'package:conexio_dart_api/view/list_users_view.dart';
import 'package:conexio_dart_api/view/localidadView/home_screen_localidad.dart';
import 'package:conexio_dart_api/view/localitation/get_localitation_view.dart';
import 'package:conexio_dart_api/view/localitation/mapas.dart';
import 'package:conexio_dart_api/view/municipioView/home_screen_municipio.dart';
import 'package:conexio_dart_api/view/municipioView/municipioViewMethod/home_screen_muni_update.dart';
import 'package:conexio_dart_api/view/regionView/regionViewMethod/home_screen_region_update.dart';
import 'package:conexio_dart_api/view/sareView/home_screen_sare.dart';
import 'package:conexio_dart_api/view/schoolView/home_screen_school.dart';
import 'package:conexio_dart_api/view/login_view.dart';
import 'package:conexio_dart_api/view/schoolView/list_email.dart';
import 'package:conexio_dart_api/view/schoolView/schoolViewMethod/home_screen_school_add_super.dart';
import 'package:conexio_dart_api/view/schoolView/schoolViewMethod/home_screen_school_directorUpdate.dart';
import 'package:conexio_dart_api/view/schoolView/schoolViewMethod/home_screen_school_superUpdate.dart';
import 'package:conexio_dart_api/view/schoolView/schoolViewMethod/home_screen_school_update.dart';
import 'package:conexio_dart_api/view/schoolView/schoolViewMethod/home_screen_shool_add_direc.dart';
import 'package:conexio_dart_api/view/sign_up_view.dart';
import 'package:conexio_dart_api/view/splash_view.dart';
import 'package:conexio_dart_api/view/update_user_password.dart';
import 'package:flutter/material.dart';

import '../../view/home_screen.dart';
import '../../view/regionView/home_screen_region.dart';
import '../../view/schoolView/schoolViewMethod/home_screen_school_add.dart';

class Routes {
  //final int id;
  //late String name;
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final argume = settings.arguments;

    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SplashView());
      case RoutesName.home:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen());
      case RoutesName.login:
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginView());
      case RoutesName.updateUser:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                const HomeScreenUserPasswordUpdate(
                  userId: null,
                ));
      case RoutesName.locate:
        return MaterialPageRoute(
            builder: (BuildContext context) => const GetLocations());
      case RoutesName.mapa:
        return MaterialPageRoute(
            builder: (BuildContext context) => const MapViews());
      case RoutesName.signUp:
        return MaterialPageRoute(
            builder: (BuildContext context) => const SignUpView());
      case RoutesName.school:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreenSchool());
      /*case RoutesName.schoolDetail:
        return MaterialPageRoute(
           builder: (BuildContext context) => SchoolGetIdDetail());*/
      case RoutesName.region:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreenRegion());
      case RoutesName.regionPut:
        return MaterialPageRoute(
            builder: (BuildContext context) => HomeScreenRegionUpdate(
                  idRegion: null,
                  nameRegion: null,
                ));
      case RoutesName.sare:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreenSare());
      case RoutesName.municipioPut:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreenMuniUpdate(
                  idmunicipio: null,
                  nameMunicipio: null,
                  nameRegion: null,
                  regionId: null,
                ));
      case RoutesName.municipio:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreenMunicipio());
      case RoutesName.localidad:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreenLocalidad());
      case RoutesName.datSchoolview:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreenSchoolAdd());
      case RoutesName.datDirectorview:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreenDataDirector());
      case RoutesName.schoolPut:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreenSchoolUpdate(
                  id: null,
                  name: null,
                  clave: null,
                  nivel: null,
                  calle: null,
                  noExterior: null,
                  noInteriror: null,
                  asentamiento: null,
                  email: null,
                  telefono: null,
                  localidadId: null,
                  nameLoc: null,
                ));

      case RoutesName.supervisorPut:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                const HomeScreenSupervisorUpdate());
      case RoutesName.directorPut:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                const HomeScreenDirectorUpdate());

      case RoutesName.datSupervisorview:
        return MaterialPageRoute(
            builder: (BuildContext context) =>
                const HomeScreenSchoolSupervisor());
      case RoutesName.lisUser:
        return MaterialPageRoute(
            builder: (BuildContext context) => const ListUserView());
      case RoutesName.emails:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreenListEmails());
      case RoutesName.dowland:
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreenListEmails());

      default:
        return MaterialPageRoute(builder: (_) {
          return const Scaffold(
            body: Center(
              child: Text("Ruta no definida"),
            ),
          );
        });
    }
  }
}
