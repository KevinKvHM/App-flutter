import 'package:conexio_dart_api/view/municipioView/municipioViewMethod/home_screen_muni_update.dart';
import 'package:conexio_dart_api/view_model/user_view_model.dart';
import 'package:conexio_dart_api/view_model/view_model_menu/home_view_model_municipio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../../data/response/status.dart';
import '../../../res/color.dart';

class HomeScreenMuniGetAll extends StatefulWidget {
  const HomeScreenMuniGetAll({super.key});

  @override
  State<HomeScreenMuniGetAll> createState() => _HomeScreenMuniGetAllState();
}

class _HomeScreenMuniGetAllState extends State<HomeScreenMuniGetAll> {
  HomeViewModelMunicipio homeViewModelMuni = HomeViewModelMunicipio();

  UserViewModel getSharedPreferences = UserViewModel();
  String? token;

  @override
  void initState() {
    getSharedPreferences;
    super.initState();
    getSharedPreferences.getUser().then((value) => {
          token = value.token,
          setState(() {
            homeViewModelMuni.fechtMunicipioListApi(token.toString());
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista De Municipios"),
        centerTitle: true,
        backgroundColor: AppColors.grenSnackBar,
      ),
      body: ChangeNotifierProvider<HomeViewModelMunicipio>(
        create: (BuildContext context) => homeViewModelMuni,
        child: Consumer<HomeViewModelMunicipio>(builder: (context, value, _) {
          switch (value.municipioList.status!) {
            case Status.LOADING:
              return Center(child: CircularProgressIndicator());
            case Status.ERROR:
              return Center(
                  child: Text(value.municipioList.message.toString()));
            case Status.COMPLETED:
              return ListView.builder(
                itemCount: value.municipioList.data!.municipios!.length,
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
                            "MUNICIPIO: ${value.municipioList.data!.municipios![index].name.toString()} \n\n REGION: ${value.municipioList.data!.municipios![index].region!.nameRegion.toString()} \n",
                          ),
                          subtitle: Text("Creacion: " +
                              value.municipioList.data!.municipios![index]
                                  .createdAt
                                  .toString()),
                          trailing: Container(
                            width: 70,
                            child: Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: IconButton(
                                    color: AppColors.buttonColor,
                                    onPressed: () {
                                      final municipioId = value.municipioList
                                          .data!.municipios![index].id
                                          .toString();
                                      final nameMunic = value.municipioList
                                          .data!.municipios![index].name
                                          .toString();
                                      final regionId = value.municipioList.data!
                                          .municipios![index].region!.id
                                          .toString();

                                      final nameRegion = value
                                          .municipioList
                                          .data!
                                          .municipios![index]
                                          .region!
                                          .nameRegion
                                          .toString();
                                      Navigator.pop(context);
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              HomeScreenMuniUpdate(
                                                  // idRegion: regionId as int,
                                                  idmunicipio: municipioId,
                                                  nameMunicipio: nameMunic,
                                                  nameRegion: nameRegion,
                                                  regionId: regionId),
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
                                                "¿ Deseas Eliminar El Municipio ${value.municipioList.data!.municipios![index].name.toString()}?"),
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
                                                      .municipioList
                                                      .data!
                                                      .municipios![index]
                                                      .id
                                                      .toString();
                                                  print(
                                                      "DATo desde vista: $regionId");

                                                  setState(
                                                    () {
                                                      homeViewModelMuni
                                                          .deleteMunicipioApi(
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
