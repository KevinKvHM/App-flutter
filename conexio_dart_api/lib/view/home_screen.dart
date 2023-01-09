import 'package:conexio_dart_api/model/user_model.dart';
import 'package:conexio_dart_api/res/color.dart';
import 'package:conexio_dart_api/utils/routes/routes_name.dart';
import 'package:conexio_dart_api/utils/utils.dart';
import 'package:conexio_dart_api/view/employee_update.dart';
import 'package:conexio_dart_api/view/update_user_password.dart';
import 'package:conexio_dart_api/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_model/home_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _visibleOption = false;
  HomeViewModel homeViewModel = HomeViewModel();

  User userData = User();
  Employee employeeData = Employee();
  Role roleData = Role();
  UserViewModel getSharedPreferences = UserViewModel();

  @override
  void initState() {
    getSharedPreferences;

    super.initState();
    getSharedPreferences.getUser().then((value) => {
          userData = value.user!,
          employeeData = value.user!.employee!,
          roleData = value.user!.role!,
          print("Imprimiendo role de usuario: " + roleData.nameRole.toString()),
          setState(() {
            if (roleData.nameRole == "administrador") {
              _visibleOption = true;
            } else {
              _visibleOption = false;
            }
          })
        });
    //activar_desactivar();
  }

  void activar_desactivar() {
    print("Imprimiendo role de usuario: " + roleData.nameRole.toString());

    /*if (roleData.nameRole == "administrador") {
      print("Imprimiendo role de usuario: " + roleData.toString());
      setState(() {
        _visibleOption = true;
      });
    } else {
      setState(() {
        _visibleOption = false;
      });
    }*/
  }

  @override
  Widget build(BuildContext context) {
    final userPreferences = Provider.of<UserViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    var nameDestructor = employeeData.fullName.toString();

    return WillPopScope(
      onWillPop: () => Utils.closedApp(context),
      child: Scaffold(
        appBar: AppBar(
          title: Text(""),
          centerTitle: true,
          backgroundColor: AppColors.grenSnackBar,
          actions: [
            InkWell(
              onTap: () {
                userPreferences.remove().then(
                  (value) {
                    Navigator.pushNamed(context, RoutesName.login);
                  },
                );
              },
              child: const Center(
                child: Icon(
                  Icons.exit_to_app,
                ),
              ),
              //child: Center(child: Text("Cerrar Sesión")),
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(
                    employeeData.fullName.toString().toUpperCase(),
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                accountEmail: Text(
                  userData.email.toString(),
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.6)),
                ),
                decoration: BoxDecoration(color: AppColors.grenSnackBar),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 166, 212, 168),
                  child: Text(
                    '${nameDestructor[0]}',
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
              ),
              Visibility(
                visible: true,
                child: ListTile(
                  title: Text(
                    "Region",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  leading: Icon(
                    Icons.holiday_village_rounded,
                    color: Colors.black,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, RoutesName.region);
                    //  Navigator.popAndPushNamed(context, RoutesName.region);
                  },
                ),
              ),
              ListTile(
                title: Text(
                  "Municipio",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                leading: Icon(
                  Icons.account_balance_sharp,
                  color: Colors.black,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, RoutesName.municipio);
                },
              ),
              ListTile(
                  title: Text(
                    "Localidad",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  leading: Icon(
                    Icons.home_work_rounded,
                    color: Colors.black,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, RoutesName.localidad);
                  }),
              ListTile(
                title: Text(
                  "Escuela",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                leading: Icon(
                  Icons.school_sharp,
                  color: Colors.black,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, RoutesName.school);
                },
              ),
              Divider(
                height: 15,
                color: Colors.black,
              ),
              Visibility(
                visible: _visibleOption,
                child: ListTile(
                  title: Text(
                    "Usuarios",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  leading: Icon(
                    Icons.manage_accounts,
                    color: Colors.black,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, RoutesName.lisUser);
                  },
                ),
              ),
              Visibility(
                visible: _visibleOption,
                child: ListTile(
                  title: Text(
                    "SARE",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  leading: Icon(
                    Icons.line_style_outlined,
                    color: Colors.black,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, RoutesName.sare);
                  },
                ),
              ),
              Visibility(
                visible: _visibleOption,
                child: ListTile(
                    title: Text(
                      "Enviar Correo",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    leading: Icon(
                      Icons.mark_as_unread_rounded,
                      color: Colors.black,
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.pushNamed(context, RoutesName.emails);
                    }),
              ),
              /*ListTile(
                  title: Text(
                    "Dowlands",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  leading: Icon(
                    Icons.mark_as_unread_rounded,
                    color: Colors.black,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.pushNamed(context, RoutesName.dowland);
                  }),*/
            ],
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                ),
                Text(
                  "Bienvenido",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: "SourceSansPro",
                      letterSpacing: 2.0),
                ),
                Text(
                  textAlign: TextAlign.center,
                  "${employeeData.fullName.toString().toUpperCase()}",
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: "SourceSansPro",
                      letterSpacing: 2.0),
                ),
                SizedBox(
                  height: 10.0,
                  width: 200,
                  child: new Center(
                    child: new Container(
                      margin:
                          new EdgeInsetsDirectional.only(start: 1.0, end: 1.0),
                      height: 1.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  //elevation: 8,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: Padding(
                      padding: EdgeInsets.all(5),
                      child: ListTile(
                        leading: Icon(
                          Icons.phone,
                          color: Colors.teal,
                        ),
                        title: Text(
                          "${employeeData.numberPhone}",
                          style: TextStyle(
                            color: Colors.teal.shade900,
                            fontFamily: "SourceSansPro",
                            fontSize: 20,
                          ),
                        ),
                      )),
                ),

                /* Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 8,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: ListTile(
                        leading: Icon(
                          Icons.phone,
                          color: Colors.teal,
                        ),
                        title: Text(
                          "${roleData.nameRole}",
                          style: TextStyle(
                            color: Colors.teal.shade900,
                            fontFamily: "SourceSansPro",
                            fontSize: 20,
                          ),
                        ),
                      )),
                ),*/
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: ListTile(
                      leading: Icon(
                        Icons.email_rounded,
                        color: Colors.teal,
                      ),
                      title: Text(
                        "${employeeData.email}",
                        style: TextStyle(
                          color: Colors.teal.shade900,
                          fontFamily: "SourceSansPro",
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: Padding(
                      padding: EdgeInsets.all(5),
                      child: ListTile(
                        leading: Icon(
                          Icons.home_filled,
                          color: Colors.teal,
                        ),
                        title: Text(
                          "Oficina ${employeeData.oficina}",
                          style: TextStyle(
                            color: Colors.teal.shade900,
                            fontFamily: "SourceSansPro",
                            fontSize: 17,
                          ),
                        ),
                      )),
                ),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 8,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: Padding(
                      padding: EdgeInsets.all(10),
                      child: ListTile(
                        leading: Icon(
                          Icons.admin_panel_settings,
                          color: Colors.teal,
                        ),
                        title: Text(
                          "Privilegios: ${roleData.nameRole}",
                          style: TextStyle(
                            color: Colors.teal.shade900,
                            fontFamily: "SourceSansPro",
                            fontSize: 20,
                          ),
                        ),
                      )),
                ),

                /* InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RoutesName.login);
                    },
                    child: Text("Actualizar Contraseña")),*/
              ],
            ),
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: "btn1",
                child: Icon(Icons.person_rounded),
                backgroundColor: AppColors.buttonColor,
                tooltip: 'Actualizar Datos Personales',
                onPressed: () {
                  final employeeId = employeeData.id.toString();
                  final fullName = employeeData.fullName.toString();
                  final phone = employeeData.numberPhone.toString();
                  final oficina = employeeData.oficina.toString();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HomeScreenUpdateEmployee(
                        employeeId: employeeId,
                        fullName: fullName,
                        phone: phone,
                        oficina: oficina,
                      ),
                    ),
                  );
                },
              ),
              Expanded(child: Container()),
              FloatingActionButton(
                heroTag: "btn2",
                child: Icon(Icons.password),
                backgroundColor: AppColors.buttonColor,
                tooltip: 'Actualizar Contraseña',
                onPressed: () {
                  final userId = userData.id.toString();
                  final password = employeeData.fullName.toString();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HomeScreenUserPasswordUpdate(
                        userId: userId,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
