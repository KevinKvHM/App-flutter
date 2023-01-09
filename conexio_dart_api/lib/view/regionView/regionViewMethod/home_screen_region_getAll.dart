import 'package:conexio_dart_api/res/color.dart';
import 'package:conexio_dart_api/utils/routes/routes_name.dart';
import 'package:conexio_dart_api/view/regionView/regionViewMethod/home_screen_region_update.dart';
import 'package:conexio_dart_api/view_model/view_model_menu/home_view_model_region.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/response/status.dart';
import '../../../view_model/user_view_model.dart';

class HomeScreenRegionGetAll extends StatefulWidget {
  const HomeScreenRegionGetAll({super.key});

  @override
  State<HomeScreenRegionGetAll> createState() => _HomeScreenRegionGetAllState();
}

class _HomeScreenRegionGetAllState extends State<HomeScreenRegionGetAll> {
  HomeViewModelRegion homeViewModelRegion = HomeViewModelRegion();

  UserViewModel getSharedPreferences = UserViewModel();
  String? token;

  @override
  void initState() {
    getSharedPreferences;
    super.initState();
    getSharedPreferences.getUser().then((value) => {
          token = value.token,
          setState(() {
            homeViewModelRegion.fechtRegionListApi(token.toString());
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    final userPreferences = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista De Regiones"),
        centerTitle: true,
        backgroundColor: AppColors.grenSnackBar,
      ),
      body: ChangeNotifierProvider<HomeViewModelRegion>(
        create: (BuildContext context) => homeViewModelRegion,
        child: Consumer<HomeViewModelRegion>(builder: (context, value, _) {
          switch (value.regionList.status!) {
            case Status.LOADING:
              return Center(child: CircularProgressIndicator());
            case Status.ERROR:
              return Center(child: Text(value.regionList.message.toString()));
            case Status.COMPLETED:
              return ListView.builder(
                itemCount: value.regionList.data!.regiones!.length,
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
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 18,
                            ),
                            "REGION : " +
                                value.regionList.data!.regiones![index]
                                    .nameRegion
                                    .toString() +
                                "\n",
                          ),
                          trailing: Container(
                            width: 70,
                            child: Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: IconButton(
                                    color: AppColors.buttonColor,
                                    onPressed: () {
                                      final regionId = value
                                          .regionList.data!.regiones![index].id
                                          .toString();
                                      print(regionId);

                                      final nameRegion = value.regionList.data!
                                          .regiones![index].nameRegion
                                          .toString();
                                      final nameJefesare = value.regionList
                                          .data!.regiones![index].nameJefeSare
                                          .toString();
                                      print(nameRegion);
                                      Navigator.pop(context);
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              HomeScreenRegionUpdate(
                                            idRegion: regionId,
                                            nameRegion: nameRegion,
                                            nameJefe: nameJefesare,
                                          ),
                                        ),
                                      );

                                      // Navigator.pop(context);
                                      print(
                                          "Valor final del id region $regionId");
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
                                                "¿ Deseas Eliminar La Region ${value.regionList.data!.regiones![index].nameRegion.toString()}?"),
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
                                                  
                                                  final regionId = value
                                                      .regionList
                                                      .data!
                                                      .regiones![index]
                                                      .id
                                                      .toString();
                                                  print(
                                                      "DATo desde vista: $regionId");

                                                  setState(
                                                    () {
                                                      homeViewModelRegion
                                                          .deleteRegionApi(
                                                        regionId,
                                                        token.toString(),
                                                        context,
                                                      );
                                                    },
                                                  );
                                                  /*Navigator.popUntil(
                                                      context,
                                                      (Route<dynamic> route) =>
                                                          false);*/
                                                  // Navigator.pop(context);

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
                                ),
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
/*  //UTILIZANDO LA PAGES DELETE SCREEN

 final userPreferences = Provider.of<UserViewModel>(context);
    int numberOfPage = 5;
    int currentPage = 0;
    var pages = List.generate(
        numberOfPage,
        (index) => Center(
              child: ChangeNotifierProvider<HomeViewModelRegion>(
                create: (BuildContext context) => homeViewModelRegion,
                child:
                    Consumer<HomeViewModelRegion>(builder: (context, value, _) {
                  switch (value.regionList.status!) {
                    case Status.LOADING:
                      return Center(child: CircularProgressIndicator());
                    case Status.ERROR:
                      return Center(
                          child: Text(value.regionList.message.toString()));
                    case Status.COMPLETED:
                      return ListView.builder(
                        itemCount: value.regionList.data!.regiones!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            margin: EdgeInsets.all(11),
                            elevation: 8,
                            child: Column(
                              children: <Widget>[
                                ListTile(
                                  contentPadding:
                                      EdgeInsets.fromLTRB(15, 10, 25, 0),
                                  title: Text(
                                    textAlign: TextAlign.left,
                                    style: const TextStyle(
                                      color: Colors.black87,
                                      fontSize: 18,
                                    ),
                                    "REGION : " +
                                        value.regionList.data!.regiones![index]
                                            .nameRegion
                                            .toString() +
                                        "\n",
                                  ),
                                  subtitle: Text(
                                    "Jefe De La SARE: " +
                                        value.regionList.data!.regiones![index]
                                            .nameJefeSare!
                                            .toString(),
                                  ),
                                  trailing: Container(
                                    width: 70,
                                    child: Row(
                                      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: IconButton(
                                            color: AppColors.buttonColor,
                                            onPressed: () {
                                              final regionId = value.regionList
                                                  .data!.regiones![index].id
                                                  .toString();
                                              print(regionId);

                                              final nameRegion = value
                                                  .regionList
                                                  .data!
                                                  .regiones![index]
                                                  .nameRegion
                                                  .toString();
                                              print(nameRegion);
                                              Navigator.pop(context);
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      HomeScreenRegionUpdate(
                                                    idRegion: regionId,
                                                    nameRegion: nameRegion,
                                                  ),
                                                ),
                                              );

                                              // Navigator.pop(context);
                                              print(
                                                  "Valor final del id region $regionId");
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
                                                builder:
                                                    (BuildContext context) {
                                                  return AlertDialog(
                                                    title: Text(
                                                        "¿ Deseas Eliminar La Region ${value.regionList.data!.regiones![index].nameRegion.toString()}?"),
                                                    actions: [
                                                      TextButton(
                                                        style: TextButton
                                                            .styleFrom(
                                                                primary: Colors
                                                                    .green
                                                                    .shade900),
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                context,
                                                                'Cancelar'),
                                                        child: const Text(
                                                            'Cancelar'),
                                                      ),
                                                      TextButton(
                                                        style: TextButton
                                                            .styleFrom(
                                                                primary:
                                                                    Colors.red),
                                                        child: const Text(
                                                            'Eliminar'),
                                                        onPressed: () {
                                                          //
                                                          final regionId = value
                                                              .regionList
                                                              .data!
                                                              .regiones![index]
                                                              .id
                                                              .toString();
                                                          print(
                                                              "DATo desde vista: $regionId");

                                                          setState(
                                                            () {
                                                              homeViewModelRegion
                                                                  .deleteRegionApi(
                                                                regionId,
                                                                token
                                                                    .toString(),
                                                                context,
                                                              );
                                                              //Navigator.of(context).pop();
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
                                        ),
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
            ));

    return Scaffold(
        appBar: AppBar(
          title: Text("Lista De Regiones"),
          centerTitle: true,
          backgroundColor: AppColors.grenSnackBar,
        ),
        body: Column(
          children: [
            Expanded(
                child: Container(
              child: pages[currentPage],
            )),
            NumberPaginator(
              numberPages: numberOfPage,
              onPageChange: (index) {
                setState(() {
                  currentPage = index;
                });
              },
            )
          ],
        ));
  }
}

                                        /*********** */






final regionId = value
                                          .regionList.data!.regiones![index].id
                                          .toString();
                                      print(regionId);

                                      setState(
                                        () {
                                          homeViewModelRegion.deleteRegionApi(
                                              regionId, context);
                                        },
                                      );

                                      print(
                                          "Valor final del id region $regionId");*/
