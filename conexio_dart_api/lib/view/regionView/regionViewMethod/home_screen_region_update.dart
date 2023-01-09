import 'package:conexio_dart_api/data/response/status.dart';
import 'package:conexio_dart_api/model/municipio/municipio_list_model.dart';
import 'package:conexio_dart_api/utils/routes/routes_name.dart';
import 'package:conexio_dart_api/view_model/user_view_model.dart';
import 'package:conexio_dart_api/view_model/view_model_menu/home_view_model_region.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../res/components/round_button.dart';
import '../../../utils/utils.dart';
import '../../bar_gradient.dart';

class HomeScreenRegionUpdate extends StatefulWidget {
  // final Region region;
  final idRegion;
  final nameRegion;
  final nameJefe;

  HomeScreenRegionUpdate(
      {super.key, this.idRegion, this.nameRegion, this.nameJefe});

  @override
  State<HomeScreenRegionUpdate> createState() => _HomeScreenRegionUpdateState();
}

class _HomeScreenRegionUpdateState extends State<HomeScreenRegionUpdate> {
  TextEditingController _editNameRegion = TextEditingController();
  TextEditingController _idRegion = TextEditingController();
  TextEditingController _nameJefe = TextEditingController();

  @override
  void getRegion() {
    _editNameRegion.text = widget.nameRegion.toString();
    _idRegion.text = widget.idRegion.toString();
    _nameJefe.text = widget.nameJefe.toString();
  }

  UserViewModel getSharedPreferences = UserViewModel();
  String? token;

  @override
  void initState() {
    getSharedPreferences;
    getRegion();
    super.initState();
    getSharedPreferences
        .getUser()
        .then((value) => {token = value.token, setState(() {})});
  }

  FocusNode nameRegionFocusNode = FocusNode();
  FocusNode idRegionFocusNode = FocusNode();
  FocusNode nameJefeFocusNode = FocusNode();
  //get nameRegion => nameRegion;

  @override
  void dispose() {
    super.dispose();

    // _nameRegion.dispose();
    _editNameRegion.dispose();
    nameRegionFocusNode.dispose();
    _nameJefe.dispose();
    _idRegion.dispose();
    idRegionFocusNode.dispose();
    nameJefeFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final regionViewModel = Provider.of<HomeViewModelRegion>(context);

    final height = MediaQuery.of(context).size.height * 1;
    //print("valor de la segunda pantalla $_idRegion $_editNameRegion ");
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              BarGradient("Actualizar Region", Icons.update),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
                /* tamaño del colum */ height: 80,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                child: TextFormField(
                  controller: _editNameRegion,
                  //initialValue: nameRegion,
                  keyboardType: TextInputType.text,
                  focusNode: nameRegionFocusNode,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: 'Ingrese El Nombre De La Region ',
                    labelText: 'Nombre De La Region',
                    prefixIcon: Icon(
                      Icons.add_home_sharp,
                    ),
                  ),
                  onEditingComplete: () =>
                      Utils.fielFocusGeneral(context, nameJefeFocusNode),
                  textInputAction: TextInputAction.next,
                ),
              ),
              SizedBox(
                height: height * .030,
              ),
              RoundButton(
                title: "Actualizar",
                loading: regionViewModel.putLoading,
                onPress: () {
                  // print(_editNameRegion);
                  // print(_idRegion);
                  if (_editNameRegion.text.isEmpty) {
                    Utils.flushBarErrorMessage(
                        "Por Favor Ingresa El Nombre De La Región", context);
                  } else {
                    Map data = {'nameRegion': _editNameRegion.text.toString()};

                    regionViewModel.putRegionApi(
                        widget.idRegion, data, token.toString(), context);

                    //Future.delayed(Duration(seconds: 2));
                    //Navigator.pushNamed(context, RoutesName.region);
                    // Navigator.popAndPushNamed(context, RoutesName.region);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
/*


Column(
                 
                  children: <Widget>[
                    ListTile(
                      title: Text("Title ${widget.nameRegion}"),
                    ),
                    ListTile(
                      title: Text("ID ${widget.idRegion}"),
                      //      subtitle: Text("${region.id}"),
                    ),
                    RoundButton(
                        title: "Actualizar",
                        // loading: regionViewModel.addLoading,
                        onPress: () {})
                  ],
                ),
                
Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ListTile(
                      title: Text("Title ${widget.nameRegion}"),
                      //     subtitle: Text(region.nameRegion.toString()),
                    ),
                    ListTile(
                      title: Text("ID ${widget.idRegion}"),
                      //      subtitle: Text("${region.id}"),
                    ),
                    RoundButton(
                        title: "Actualizar",
                        // loading: regionViewModel.addLoading,
                        onPress: () {})
                  ],
                ),
              ),
            ],
          ),
        ),
*/

/*class HomeScreenRegionUpdate extends StatefulWidget {
  // final int idRegion;
  //final String nameRegion;
  const HomeScreenRegionUpdate({super.key});

  @override
  State<HomeScreenRegionUpdate> createState() => _HomeScreenRegionUpdateState();
}

class _HomeScreenRegionUpdateState extends State<HomeScreenRegionUpdate> {
  HomeViewModelRegion homeViewModelRegion = HomeViewModelRegion();
  final TextEditingController _nameRegion = TextEditingController();

  FocusNode nameRegionFocusNode = FocusNode();
  final TextEditingController _idRegion = TextEditingController();

  FocusNode _idRegionFocusNode = FocusNode();
  //get id => ModelRegionGetId().region?.id;

  @override
  void dispose() {
    super.dispose();
    // homeViewModelRegion.fechtIdRegionListApi(id);
    _nameRegion.dispose();
    _idRegion.dispose();
    _idRegionFocusNode.dispose();
    nameRegionFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final userPreferences = Provider.of<UserViewModel>(context);
    return Scaffold(
      body: ChangeNotifierProvider<HomeViewModelRegion>(
        create: (BuildContext context) => homeViewModelRegion,
        child: Consumer<HomeViewModelRegion>(builder: (context, value, _) {
          switch (value.regionIdList.status!) {
            case Status.LOADING:
              return Center(child: CircularProgressIndicator());
            case Status.ERROR:
              return Center(child: Text(value.regionIdList.message.toString()));
            case Status.COMPLETED:
              return ListView.builder(
                //   itemCount: value.regionIdList.data!.region!.id,
                itemBuilder: (context, index) {
                  return Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      margin: EdgeInsets.all(11),
                      elevation: 8,
                      child: SafeArea(
                          child: SingleChildScrollView(
                        child: Column(
                          children: [
                            BarGradient(
                                "Actualizar Region", Icons.update_rounded),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 30.0, vertical: 10.0),
                              height: 80,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 16),
                              child: TextFormField(
                                controller: _nameRegion,
                                keyboardType: TextInputType.text,
                                focusNode: nameRegionFocusNode,
                                autofocus: true,
                                decoration: const InputDecoration(
                                  hintText: 'Ingrese El Nombre De La Region',
                                  labelText: 'Nombre De La Region',
                                  prefixIcon: Icon(
                                    Icons.add_home_sharp,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: height * .030,
                            ),
                            RoundButton(
                                title: "Actualizar Region",
                                onPress: () {
                                  if (_nameRegion.text.isEmpty) {
                                    Utils.flushBarErrorMessage(
                                        "Por Favor Ingresa El Nombre De La Región",
                                        context);
                                  }
                                  ;
                                  final _futureRegion = homeViewModelRegion
                                      .fechtIdRegionListApi(_idRegion);
                                })
                          ],
                        ),
                      )));
                },
              );
          }
        }),
      ),
    );
  }
}
*/
/*




       ListTile(
                          contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                          title: Text(
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                              color: Colors.black87,
                              fontSize: 18,
                            ),
                            "REGION : " +
                                value.regionIdList.data!.region!.nameRegion
                                    .toString(),
                          ),
                          subtitle: Text(
                            "Id: " +
                                value.regionIdList.data!.region!.id.toString(),
                          ),
                        ),
*/
