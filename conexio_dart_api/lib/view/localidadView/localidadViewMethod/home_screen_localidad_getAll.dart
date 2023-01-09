import 'package:conexio_dart_api/view/localidadView/localidadViewMethod/home_screen_localidad_update.dart';
import 'package:conexio_dart_api/view_model/user_view_model.dart';
import 'package:conexio_dart_api/view_model/view_model_menu/home_view_model_localidad.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../../data/response/status.dart';
import '../../../res/color.dart';
import '../../../view_model/view_model_menu/home_view_model_municipio.dart';

class HomeScreenLocalidadGetAll extends StatefulWidget {
  const HomeScreenLocalidadGetAll({super.key});

  @override
  State<HomeScreenLocalidadGetAll> createState() =>
      _HomeScreenLocalidadGetAllState();
}

class _HomeScreenLocalidadGetAllState extends State<HomeScreenLocalidadGetAll> {
  HomeViewModelLocalidad homeViewModelLocalidad = HomeViewModelLocalidad();

  UserViewModel getSharedPreferences = UserViewModel();
  String? token;

  @override
  void initState() {
    getSharedPreferences;
    super.initState();
    getSharedPreferences.getUser().then((value) => {
          token = value.token,
          setState(() {
            homeViewModelLocalidad.fechtLocalidadListApi(token.toString());
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista De Localidades"),
        centerTitle: true,
        backgroundColor: AppColors.grenSnackBar,
      ),
      body: ChangeNotifierProvider<HomeViewModelLocalidad>(
        create: (BuildContext context) => homeViewModelLocalidad,
        child: Consumer<HomeViewModelLocalidad>(builder: (context, value, _) {
          switch (value.localidadList.status!) {
            case Status.LOADING:
              return Center(child: CircularProgressIndicator());
            case Status.ERROR:
              return Center(
                  child: Text(value.localidadList.message.toString()));
            case Status.COMPLETED:
              return ListView.builder(
                itemCount: value.localidadList.data!.localidades!.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.all(11),
                    elevation: 8,
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                          title: Text(
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 18,
                            ),
                            "CLAVE lOCALIDAD: ${value.localidadList.data!.localidades![index].claveLocOfi.toString()}\n\nLOCALIDAD:${value.localidadList.data!.localidades![index].nameLoc.toString()}\n\nMUNICIPIO: ${value.localidadList.data!.localidades![index].municipio!.name.toString()} \n",
                          ),
                          subtitle: Text(
                              "Creacion: ${value.localidadList.data!.localidades![index].createdAt.toString()}"),
                          trailing: Container(
                            width: 70,
                            child: Row(
                              children: [
                                Expanded(
                                  child: IconButton(
                                    color: AppColors.buttonColor,
                                    onPressed: () {
                                      final localidadId = value.localidadList
                                          .data!.localidades![index].id
                                          .toString();
                                      final nameLoc = value.localidadList.data!
                                          .localidades![index].nameLoc
                                          .toString();
                                      final claveLocOfi = value.localidadList
                                          .data!.localidades![index].claveLocOfi
                                          .toString();
                                      Navigator.pop(context);
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              HomeScreenLocalidadUpdate(
                                            localidadId: localidadId,
                                            nameLoc: nameLoc,
                                            claveLocOfi: claveLocOfi,
                                          ),
                                        ),
                                      );
                                    },
                                    icon: Icon(Icons.edit),
                                  ),
                                ),
                                Expanded(
                                  child: IconButton(
                                    color: AppColors.buttonColor,
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text(
                                                "¿ Deseas Eliminar La Localidad ${value.localidadList.data!.localidades![index].nameLoc.toString()}?"),
                                            actions: [
                                              TextButton(
                                                style: TextButton.styleFrom(
                                                    primary:
                                                        Colors.green.shade900),
                                                onPressed: () => Navigator.pop(
                                                    context, 'Cancelar'),
                                                child: const Text('Cancelar'),
                                              ),
                                              TextButton(
                                                style: TextButton.styleFrom(
                                                    primary: Colors.red),
                                                child: const Text('Eliminar'),
                                                onPressed: () {
                                                  //
                                                  final regionId = value
                                                      .localidadList
                                                      .data!
                                                      .localidades![index]
                                                      .id
                                                      .toString();
                                                  print(
                                                      "DATo desde vista: $regionId");

                                                  setState(
                                                    () {
                                                      homeViewModelLocalidad
                                                          .deleteLocalidadApi(
                                                        regionId,
                                                        token.toString(),
                                                        context,
                                                      );
                                                    },
                                                  );
                                                  //Future.delayed(Duration(seconds: 2));
                                                  print(
                                                      "Valor final del id region $regionId");
                                                },
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    icon: Icon(Icons.delete),
                                  ),
                                )
                              ],
                            ),
                          ),
                          leading: Icon(Icons.home),
                        ),
                      ],
                    ),
                  );
                },
              );
          }
        }),
      ),
    );
  }
}
