import 'package:conexio_dart_api/res/color.dart';
import 'package:conexio_dart_api/view/sareView/sareMethod/home_screen_sare_Detail.dart';
import 'package:conexio_dart_api/view/sareView/sareMethod/home_screen_update_sare.dart';
import 'package:conexio_dart_api/view_model/view_model_menu/home_view_model_sare.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/response/status.dart';
import '../../../view_model/user_view_model.dart';

class HomeScreenSareGetAll extends StatefulWidget {
  const HomeScreenSareGetAll({super.key});

  @override
  State<HomeScreenSareGetAll> createState() => _HomeScreenSareGetAllState();
}

class _HomeScreenSareGetAllState extends State<HomeScreenSareGetAll> {
  HomeViewModelSare homeViewModelSare = HomeViewModelSare();

  UserViewModel getSharedPreferences = UserViewModel();
  String? token;

  @override
  void initState() {
    getSharedPreferences;
    super.initState();
    getSharedPreferences.getUser().then((value) => {
          token = value.token,
          setState(() {
            homeViewModelSare.fechtSaresListApi(token.toString());
          })
        });
  }

  @override
  Widget build(BuildContext context) {
    final userPreferences = Provider.of<UserViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista De Sares"),
        centerTitle: true,
        backgroundColor: AppColors.grenSnackBar,
      ),
      body: ChangeNotifierProvider<HomeViewModelSare>(
        create: (BuildContext context) => homeViewModelSare,
        child: Consumer<HomeViewModelSare>(builder: (context, value, _) {
          switch (value.sareList.status!) {
            case Status.LOADING:
              return Center(child: CircularProgressIndicator());
            case Status.ERROR:
              return Center(child: Text(value.sareList.message.toString()));
            case Status.COMPLETED:
              return ListView.builder(
                itemCount: value.sareList.data!.sares!.length,
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
                            final regiones = value.sareList.data!.sares![index];

                            //final reG = value.sareList.data!.sares![index].regions![index].nameRegion;
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SareGetIdDetail(
                                    value.sareList.data!.sares![index])));
                          },
                          contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                          title: Text(
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 18,
                            ),
                            "SARE : " +
                                value.sareList.data!.sares![index].nameSare
                                    .toString() +
                                "\n",
                          ),
                          trailing: Container(
                            width: 70,
                            child: Row(
                              children: [
                                /* Expanded(
                                  child: IconButton(
                                    color: AppColors.buttonColor,
                                    onPressed: () {
                                      /*  final sareId = value
                                          .sareList.data!.sares![index].id
                                          .toString();
                                      print(sareId);

                                      final nameRegion = value
                                          .sareList.data!.sares![index].nameSare
                                          .toString();
                                      final nameJefesare = value.sareList.data!
                                          .sares![index].nameJefeSare
                                          .toString();
                                      print(nameRegion);
                                      Navigator.pop(context);
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              HomeScreenRegionUpdate(
                                            idRegion: sareId,
                                            nameRegion: nameRegion,
                                            nameJefe: nameJefesare,
                                          ),
                                        ),
                                      );

                                      
                                      print(
                                          "Valor final del id region $sareId");*/
                                    },
                                    icon: Icon(Icons.edit),
                                  ),
                                ),*/
                                Expanded(
                                  child: IconButton(
                                    color: AppColors.buttonColor,
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              HomeScreenSareUpdate(
                                                  sares: value.sareList.data!
                                                      .sares![index]),
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
                                                "¿ Deseas Eliminar La Sare:  ${value.sareList.data!.sares![index].nameSare.toString()}?"),
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
                                                  final sareId = value.sareList
                                                      .data!.sares![index].id
                                                      .toString();
                                                  print(
                                                      "DATo desde vista: $sareId");

                                                  setState(
                                                    () {
                                                      homeViewModelSare
                                                          .deleteSareApi(
                                                        sareId,
                                                        token.toString(),
                                                        context,
                                                      );
                                                    },
                                                  );
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
