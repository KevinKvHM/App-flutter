import 'package:conexio_dart_api/res/components/round_button.dart';
import 'package:conexio_dart_api/utils/utils.dart';
import 'package:conexio_dart_api/view/bar_gradient.dart';
import 'package:conexio_dart_api/view_model/school/home_view_model_school.dart';
import 'package:conexio_dart_api/view_model/user_view_model.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreenDirectorUpdate extends StatefulWidget {
  final id;
  final name;
  final sindicato;
  final telefono;
  final puesto;
  final email;
  final atencion;

  const HomeScreenDirectorUpdate({
    super.key,
    this.name,
    this.id,
    this.sindicato,
    this.telefono,
    this.puesto,
    this.email,
    this.atencion,
  });

  @override
  State<HomeScreenDirectorUpdate> createState() =>
      _HomeScreenDirectorUpdateState();
}

class _HomeScreenDirectorUpdateState extends State<HomeScreenDirectorUpdate> {
  bool activarDefault = false;
  bool activar = false;
  final TextEditingController _nameDirectorController = TextEditingController();
  final TextEditingController _sindicatoController = TextEditingController();
  final TextEditingController _telephoneDirectorController =
      TextEditingController();
  final TextEditingController _puestoController = TextEditingController();
  final TextEditingController _emailDirectorController =
      TextEditingController();
  final TextEditingController _atencionController = TextEditingController();

  FocusNode nameDirectorFocusNode = FocusNode();
  FocusNode sindicatoFocusNode = FocusNode();
  FocusNode telephoneDirectorFocusNode = FocusNode();
  FocusNode puestoFocusNode = FocusNode();
  FocusNode emailDirectorFocusNode = FocusNode();
  FocusNode atencionFocusNode = FocusNode();
  @override
  void dispose() {
    super.dispose();
    _nameDirectorController.dispose();
    _sindicatoController.dispose();
    _telephoneDirectorController.dispose();
    _puestoController.dispose();
    _emailDirectorController.dispose();
    _atencionController.dispose();
  }

  void getDataDirector() {
    _nameDirectorController.text = this.widget.name.toString();
    _sindicatoController.text = this.widget.sindicato.toString();
    _telephoneDirectorController.text = this.widget.telefono.toString();
    _puestoController.text = this.widget.puesto.toString();
    _emailDirectorController.text = this.widget.email.toString();
    _atencionController.text = this.widget.atencion.toString();
  }

  void activarDesactivarBoton() async {
    setState(() {
      if (_atencionController.text == "Si" ||
          _atencionController.text == "si") {
        activar = true;
      } else if (_atencionController.text == "No" ||
          _atencionController.text == "no") {
        activar = false;
      }
    });
  }

  UserViewModel getSharedPreferences = UserViewModel();
  String? token;

  @override
  void initState() {
    getSharedPreferences;
    super.initState();
    getSharedPreferences
        .getUser()
        .then((value) => {token = value.token, setState(() {})});
    getDataDirector();
    activarDesactivarBoton();
  }

  final _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final updateDataDirectorViewModel =
        Provider.of<HomeViewModelScholl>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Form(
        key: _keyForm,
        child: Column(
          children: [
            BarGradient(
                "Actualizar Datos del Director", Icons.create_new_folder),
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              height: 80,
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              child: TextFormField(
                controller: _nameDirectorController,
                focusNode: nameDirectorFocusNode,
                decoration: const InputDecoration(
                  hintText: 'Ingrese El Nombre Completo',
                  labelText: 'Nombre Del Director',
                  prefixIcon: Icon(Icons.person),
                ),
                onEditingComplete: () =>
                    Utils.fielFocusGeneral(context, sindicatoFocusNode),
                textInputAction: TextInputAction.next,
              ),
            ),
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              height: 80,
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              child: TextFormField(
                controller: _sindicatoController,
                focusNode: sindicatoFocusNode,
                decoration: const InputDecoration(
                  hintText: 'Ingrese El Sindicato',
                  labelText: 'Nombre Del Sindicato',
                  prefixIcon: Icon(Icons.perm_media_outlined),
                ),
                onEditingComplete: () =>
                    Utils.fielFocusGeneral(context, telephoneDirectorFocusNode),
                textInputAction: TextInputAction.next,
              ),
            ),
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              height: 90,
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              child: TextFormField(
                controller: _telephoneDirectorController,
                focusNode: telephoneDirectorFocusNode,
                keyboardType: TextInputType.phone,
                maxLength: 10,
                decoration: const InputDecoration(
                  hintText: 'Ingrese El Telefono',
                  labelText: 'Numero De Telefono Del Director',
                  prefixIcon: Icon(Icons.phone),
                ),
                validator: (value) {
                  if (value!.length < 10 || value.length > 10) {
                    return "Ingrese los 10 caracteres";
                  }
                  return null;
                },
                onEditingComplete: () =>
                    Utils.fielFocusGeneral(context, puestoFocusNode),
                textInputAction: TextInputAction.next,
              ),
            ),
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              height: 80,
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              child: TextFormField(
                controller: _puestoController,
                focusNode: puestoFocusNode,
                decoration: const InputDecoration(
                  hintText: 'Ingrese El Puesto',
                  labelText: 'Nombre Del Puesto',
                  prefixIcon: Icon(Icons.padding),
                ),
                onEditingComplete: () =>
                    Utils.fielFocusGeneral(context, emailDirectorFocusNode),
                textInputAction: TextInputAction.next,
              ),
            ),
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              height: 90,
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              child: TextFormField(
                controller: _emailDirectorController,
                focusNode: emailDirectorFocusNode,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'Ingrese Su Correo Electronico',
                  labelText: 'Correo Electronico Del Director',
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value!.isEmpty || !value.contains('@')) {
                    return 'Formato incorrecto Ejemplo: correo@dominio.com';
                  }
                  return null;
                },
                onEditingComplete: () =>
                    Utils.fielFocusGeneral(context, atencionFocusNode),
                textInputAction: TextInputAction.next,
              ),
            ),

            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              height: 80,
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              child: TextFormField(
                controller: _atencionController,
                focusNode: atencionFocusNode,
                decoration: const InputDecoration(
                  hintText: 'Ingrese Si o No',
                  labelText: 'Recibe Atencion',
                  prefixIcon: Icon(Icons.airplane_ticket_outlined),
                ),
              ),
            ),
            //Icono animado
            Container(
              alignment: FractionalOffset.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.library_add_check_rounded,
                      color: activar
                          ? Color.fromARGB(255, 42, 128, 25)
                          : Color.fromARGB(255, 176, 176, 176),
                      size: 60,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        // Toggle light when tapped.
                        //activarDesactivarBoton();
                        activar = !activar;
                        if (activar != true) {
                          _atencionController.text = "No";
                          print(_atencionController.text.toString());
                        } else {
                          _atencionController.text = "Si";

                          print(_atencionController.text.toString());
                        }
                      });
                    },
                    child: Container(
                      color: activar
                          ? Color.fromARGB(255, 86, 253, 53)
                          : Color.fromARGB(255, 176, 176, 176),
                      padding: const EdgeInsets.all(8),
                      height: 40,
                      width: 90,
                      // Change button text when light changes state.
                      child:
                          Center(child: Text(activar ? 'Activa' : 'Inactivo')),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: height * .085,
            ),
            RoundButton(
              title: "guardar",
              loading: updateDataDirectorViewModel.putLoading,
              onPress: () {
                if (_keyForm.currentState!.validate()) {
                  print("validadcion correcta");
                  Map data = {
                    'name': _nameDirectorController.text.toString(),
                    'sindicato': _sindicatoController.text.toString(),
                    'telephone': _telephoneDirectorController.text.toString(),
                    'puesto': _puestoController.text.toString(),
                    'email': _emailDirectorController.text.toString(),
                    'atencion': _atencionController.text.toString(),
                  };

                  updateDataDirectorViewModel.putDataDirectorApi(
                      this.widget.id, data, token.toString(), context);
                } else {
                  Utils.flushBarErrorMessage(
                      "Rellenar los campos en rojo", context);
                }

                /* if (_nameDirectorController.text.isEmpty) {
                  Utils.flushBarErrorMessage(
                      "Por Favor  Ingrese Todos Los Campos", context);
                } else {
                  Map data = {
                    'name': _nameDirectorController.text.toString(),
                    'sindicato': _sindicatoController.text.toString(),
                    'telephone': _telephoneDirectorController.text.toString(),
                    'puesto': _puestoController.text.toString(),
                    'email_director': _emailDirectorController.text.toString(),
                    'atencion': _atencionController.text.toString(),
                  };

                  updateDataDirectorViewModel.putDataDirectorApi(
                      this.widget.id, data, token.toString(), context);
                  //print(this.widget.id);
                }*/
              },
            ),
            SizedBox(
              height: height * .03,
            ),
          ],
        ),
      ),
    )));
  }
}
