import 'package:conexio_dart_api/res/components/round_button.dart';
import 'package:conexio_dart_api/view/schoolView/delegate.dart';
import 'package:conexio_dart_api/view/schoolView/schoolViewMethod/home_screen_school_getId_Detail.dart';
import 'package:conexio_dart_api/view_model/school/home_view_model_school.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../../data/response/status.dart';
import '../../../res/color.dart';
import '../../../utils/routes/routes_name.dart';
import '../../../view_model/user_view_model.dart';

class HomeScreenSchoolGetAll extends StatefulWidget {
  const HomeScreenSchoolGetAll({super.key});

  @override
  State<HomeScreenSchoolGetAll> createState() => _HomeScreenSchoolGetAllState();
}

class _HomeScreenSchoolGetAllState extends State<HomeScreenSchoolGetAll> {
  HomeViewModelScholl homeViewModelScholl = HomeViewModelScholl();

  UserViewModel getSharedPreferences = UserViewModel();
  String? token;
  dynamic? listaSchools;

  @override
  void initState() {
    getSharedPreferences;
    super.initState();
    getSharedPreferences.getUser().then((value) => {
          token = value.token,
          setState(() {
            homeViewModelScholl.fechtSchoolListApi(token.toString());
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    final userPreferences = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        title: Text("Lista De Escuelas"),
        centerTitle: true,
        backgroundColor: AppColors.grenSnackBar,
        actions: [
          IconButton(
            onPressed: () {
              listaSchools == null
                  ? showSearch(
                      context: context,
                      delegate: CustomSearchDelegate(
                          [], ["escuelas", "name_school", "cct"]))
                  : showSearch(
                      context: context,
                      delegate: CustomSearchDelegate(
                          listaSchools, ["escuelas", "name_school", "cct"]));
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: ChangeNotifierProvider<HomeViewModelScholl>(
        create: (BuildContext context) => homeViewModelScholl,
        child: Consumer<HomeViewModelScholl>(builder: (context, value, _) {
          switch (value.schoolList.status!) {
            case Status.LOADING:
              return Center(child: CircularProgressIndicator());
            case Status.ERROR:
              return Center(child: Text(value.schoolList.message.toString()));
            case Status.COMPLETED:
              listaSchools = value.schoolList.data!.schols;
              return ListView.builder(
                itemCount: value.schoolList.data!.schols!.length,
                itemBuilder: (context, index) {
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.all(11),
                    elevation: 8,
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          onTap: () {
                            // Navigator.pop(context);
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SchoolGetIdDetail(
                                    value.schoolList.data!.schols![index])));
                          },
                          contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                          title: Text(
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 18,
                            ),
                            "Escuela: " +
                                value.schoolList.data!.schols![index].nameSchool
                                    .toString() +
                                "\n",
                          ),
                          subtitle: Text(
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                            ),
                            "Clave: " +
                                value.schoolList.data!.schols![index].cct
                                    .toString(),
                          ),
                          trailing: Container(
                            width: 70,
                            child: Row(
                              children: [
                                Expanded(
                                  child: IconButton(
                                    color: AppColors.buttonColor,
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text(
                                                "¿ Deseas Eliminar La Escuela ${value.schoolList.data!.schols![index].nameSchool.toString()}?"),
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
                                                      .schoolList
                                                      .data!
                                                      .schols![index]
                                                      .id
                                                      .toString();
                                                  print(
                                                      "DATo desde vista: $regionId");

                                                  setState(
                                                    () {
                                                      homeViewModelScholl
                                                          .deleteSchollApi(
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

                        /*Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "localidad : " +
                                value.schoolList.data!.schols![index].localidad!
                                    .nameLoc
                                    .toString(),
                            textAlign: TextAlign.center,
                          ),
                        ),*/
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
