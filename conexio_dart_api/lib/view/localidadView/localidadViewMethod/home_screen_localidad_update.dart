import 'dart:convert';

import 'package:conexio_dart_api/data/response/status.dart';
import 'package:conexio_dart_api/view_model/user_view_model.dart';
import 'package:conexio_dart_api/view_model/view_model_menu/home_view_model_localidad.dart';
import 'package:conexio_dart_api/view_model/view_model_menu/home_view_model_municipio.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../res/components/round_button.dart';
import '../../../utils/utils.dart';
import '../../bar_gradient.dart';

class HomeScreenLocalidadUpdate extends StatefulWidget {
  final localidadId;
  final nameLoc;
  final claveLocOfi;
  //final municipioId;

  const HomeScreenLocalidadUpdate({
    super.key,
    this.localidadId,
    this.nameLoc,
    this.claveLocOfi,
  });

  @override
  State<HomeScreenLocalidadUpdate> createState() =>
      _HomeScreenLocalidadUpdateState();
}

class _HomeScreenLocalidadUpdateState extends State<HomeScreenLocalidadUpdate> {
  HomeViewModelMunicipio homeViewModelMunicipio = HomeViewModelMunicipio();

  dynamic selectedValue;

  final TextEditingController searchController = TextEditingController();

  final TextEditingController _name = TextEditingController();
  final TextEditingController _claveLocalidadOficial = TextEditingController();
  final TextEditingController _municipioId = TextEditingController();

  FocusNode nameFocus = FocusNode();
  FocusNode claveLocalidadFocus = FocusNode();
  FocusNode municipioIdFocus = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _name.dispose();
    _claveLocalidadOficial.dispose();
    _municipioId.dispose();

    nameFocus.dispose();
    claveLocalidadFocus.dispose();
    municipioIdFocus.dispose();
  }

  void getLocalidad() {
    _name.text = widget.nameLoc.toString();
    _claveLocalidadOficial.text = widget.claveLocOfi.toString();
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
            homeViewModelMunicipio.fechtMunicipioListApi(token.toString());
          })
        });

    getLocalidad();
  }

  void setIdNameMunicipio() {
    setState(() {
      _municipioId.text = selectedValue.id.toString();
      print("Select vaules desde metodo set: " + _municipioId.text.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    final localidadViewModel = Provider.of<HomeViewModelLocalidad>(context);

    final height = MediaQuery.of(context).size.height * 1;

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            BarGradient("Actualizar Localidad", Icons.update_rounded),
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              height: 80,
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              child: TextFormField(
                controller: _name,
                keyboardType: TextInputType.text,
                focusNode: nameFocus,
                autofocus: true,
                decoration: const InputDecoration(
                  hintText: 'Ingrese El Nombre De La Localidad',
                  labelText: 'Nombre De La Localidad',
                  prefixIcon: Icon(
                    Icons.addchart_sharp,
                  ),
                ),
                onEditingComplete: () =>
                    Utils.fielFocusGeneral(context, claveLocalidadFocus),
                textInputAction: TextInputAction.next,
              ),
            ),
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              height: 80,
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              child: TextFormField(
                controller: _claveLocalidadOficial,
                keyboardType: TextInputType.number,
                focusNode: claveLocalidadFocus,
                maxLength: 9,
                decoration: const InputDecoration(
                  hintText: 'Ingrese La Clave De La Localidad',
                  labelText: 'Clave Oficial De Localidad',
                  prefixIcon: Icon(
                    Icons.add_location_rounded,
                  ),
                ),
                onEditingComplete: () =>
                    Utils.fielFocusGeneral(context, municipioIdFocus),
                textInputAction: TextInputAction.next,
              ),
            ),
            Container(
              child: ChangeNotifierProvider<HomeViewModelMunicipio>(
                create: (BuildContext context) => homeViewModelMunicipio,
                child: Consumer<HomeViewModelMunicipio>(
                    builder: (context, lista, _) {
                  switch (lista.municipioList.status!) {
                    case Status.LOADING:
                      return Center(child: CircularProgressIndicator());
                    case Status.ERROR:
                      return Center(
                          child: Text(lista.municipioList.message.toString()));
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
                                    'Selecciona el municipio',
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

                            items: lista.municipioList.data!.municipios!
                                .map((nombre_municipio) =>
                                    DropdownMenuItem<dynamic>(
                                      value: nombre_municipio,
                                      child: Text(
                                        nombre_municipio.name.toString(),
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
                            searchMatchFn: (nombre_municipio, searchValue) {
                              //print("Holamundo");
                              var name = nombre_municipio.value!.name!
                                  .toString()
                                  .toUpperCase()
                                  //.toLowerCase()
                                  .contains(searchValue);
                              if (kDebugMode) {
                                print(
                                    "===============================${jsonEncode(nombre_municipio.value)}");
                              }
                              return name;
                            },

                            onMenuStateChange: (isOpen) {
                              if (!isOpen) {
                                searchController.clear();
                              }
                            },
                          ),
                        ),
                      );
                  }
                }),
              ),
            ),
            SizedBox(
              height: height * .030,
            ),
            RoundButton(
              title: "Actualizar",
              loading: localidadViewModel.putLoading,
              onPress: () {
                setIdNameMunicipio();

                if (_name.text.isEmpty) {
                  Utils.flushBarErrorMessage(
                      "Por Favor Ingresa El Nombre De La Localidad", context);
                } else {
                  Map data = {
                    "nameLoc": _name.text.toString(),
                    "claveLocOfi": _claveLocalidadOficial.text.toString(),
                    "municipioId": _municipioId.text.toString(),
                  };

                  localidadViewModel.putLocalidadApi(
                      widget.localidadId, data, token.toString(), context);
                }
              },
            )
          ],
        ),
      )),
    );
  }
}
