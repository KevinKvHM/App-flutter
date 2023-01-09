import 'dart:convert';

import 'package:conexio_dart_api/data/response/status.dart';
import 'package:conexio_dart_api/view_model/user_view_model.dart';
import 'package:conexio_dart_api/view_model/view_model_menu/home_view_model_municipio.dart';
import 'package:conexio_dart_api/view_model/view_model_menu/home_view_model_region.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../res/components/round_button.dart';
import '../../../utils/utils.dart';
import '../../bar_gradient.dart';

class HomeScreenMuniAdd extends StatefulWidget {
  const HomeScreenMuniAdd({super.key});

  @override
  State<HomeScreenMuniAdd> createState() => _HomeScreenMuniAddState();
}

class _HomeScreenMuniAddState extends State<HomeScreenMuniAdd> {
  HomeViewModelRegion homeViewModelRegion = HomeViewModelRegion();
  dynamic? selectedValue;
  final TextEditingController searchController = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _regionId = TextEditingController();

  FocusNode regionIdFocusNode = FocusNode();
  FocusNode nameFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();

    _name.dispose();
    _regionId.dispose();

    regionIdFocusNode.dispose();
    nameFocusNode.dispose();
  }

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

  void setIdNameRegion() {
    setState(() {
      _regionId.text = selectedValue.id.toString();
      print("Select vaules desde metodo set: " + _regionId.text.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    final municipioViewModel = Provider.of<HomeViewModelMunicipio>(context);

    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            BarGradient("Crear Municipio", Icons.add_box_rounded),
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              height: 80,
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              child: TextFormField(
                controller: _name,
                keyboardType: TextInputType.text,
                focusNode: nameFocusNode,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Ingrese El Nombre Del Municipio',
                  labelText: 'Nombre Del Municipio',
                  prefixIcon: Icon(
                    Icons.addchart_sharp,
                  ),
                ),
                onEditingComplete: () =>
                    Utils.fielFocusGeneral(context, regionIdFocusNode),
                textInputAction: TextInputAction.next,
              ),
            ),
            Container(
              child: ChangeNotifierProvider<HomeViewModelRegion>(
                create: (BuildContext context) => homeViewModelRegion,
                child: Consumer<HomeViewModelRegion>(
                  builder: (context, lista, _) {
                    switch (lista.regionList.status!) {
                      case Status.LOADING:
                        return Center(child: CircularProgressIndicator());
                      case Status.ERROR:
                        return Center(
                            child: Text(lista.regionList.message.toString()));
                      case Status.COMPLETED:
                        //var index;
                        return Center(
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2(
                              //barrierColor: Colors.blue,
                              buttonDecoration: BoxDecoration(
                                color: Color.fromARGB(255, 235, 235, 235),
                                borderRadius: BorderRadius.circular(30.0),
                                border: Border.all(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    style: BorderStyle.solid,
                                    width: 0.80),
                              ),
                              isExpanded: true,
                              hint: Row(
                                children: [
                                  Icon(
                                    Icons.list,
                                    size: 15,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Selecciona la region',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Theme.of(context).hintColor,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      //selectionColor: Colors.amberAccent,
                                    ),
                                  ),
                                ],
                              ),

                              items: lista.regionList.data!.regiones!
                                  //lista.regionList.data!.regiones!
                                  .map((nombre_region) =>
                                      DropdownMenuItem<dynamic>(
                                        //value: nombre_region.id.toString(),
                                        value: nombre_region,

                                        child: Text(
                                          textAlign: TextAlign.center,
                                          nombre_region.nameRegion.toString(),
                                          //nombre_region.toString(),

                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              value: selectedValue,
                              onChanged: (value) {
                                setState(() {
                                  selectedValue = value as dynamic;

                                  print(selectedValue.id);
                                });
                              },
                              buttonHeight: 50,
                              buttonWidth: 350,
                              itemHeight: 50,
                              dropdownMaxHeight: 400,
                              buttonPadding:
                                  const EdgeInsets.only(left: 25, right: 25),
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: Color.fromARGB(255, 235, 235, 235),
                              ),
                              searchController: searchController,
                              searchInnerWidget: Padding(
                                padding: const EdgeInsets.only(
                                  top: 8,
                                  bottom: 4,
                                  right: 8,
                                  left: 8,
                                ),
                                child: TextFormField(
                                  controller: searchController,
                                  decoration: InputDecoration(
                                    isDense: false,
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10,
                                      vertical: 8,
                                    ),
                                    hintText: 'Buscar...',
                                    hintStyle: const TextStyle(
                                      fontSize: 12,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                              searchMatchFn: (nombre_region, searchValue) {
                                //print("Holamundo");
                                var name = nombre_region.value!.nameRegion!
                                    .toString()
                                    .toUpperCase()
                                    //.toLowerCase()
                                    .contains(searchValue);
                                if (kDebugMode) {
                                  print(
                                      "===============================${jsonEncode(nombre_region.value)}");
                                }
                                return name;
                              },
                              //This to clear the search value when you close the menu
                              onMenuStateChange: (isOpen) {
                                if (!isOpen) {
                                  searchController.clear();
                                }
                              },
                            ),
                          ),
                        );
                    }
                  },
                ),
              ),
            ),

            SizedBox(
              height: height * .060,
            ),

            RoundButton(
                title: "Crear Municipio",
                loading: municipioViewModel.addLoading,
                onPress: () {
                  setIdNameRegion();
                  if (_name.text.isEmpty) {
                    Utils.flushBarErrorMessage(
                        "Por Favor Ingresa Todos Los Campos", context);
                  } else {
                    Map data = {
                      'name': _name.text.toString(),
                      'regionId': _regionId.text.toString()
                    };

                    municipioViewModel.addMunicipioApi(
                        data, token.toString(), context);
                    //regionViewModel.addRegionApi(data, context);

                  }
                }),
            // SizedBox(height: height * .030),
            /*   RoundButton(
              title: 'ListadeRegiosnes',
              onPress: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ListDespegable()));

                // addSchoolViewModel.addSchoolApi(data, context);
              },
            )*/
          ],
        ),
      )),
    );
  }
}
