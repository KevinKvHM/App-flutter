import 'package:conexio_dart_api/res/components/round_button.dart';
import 'package:conexio_dart_api/utils/utils.dart';
import 'package:conexio_dart_api/view/bar_gradient.dart';
import 'package:conexio_dart_api/view_model/school/home_view_model_school.dart';
import 'package:conexio_dart_api/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreenSupervisorUpdate extends StatefulWidget {
  final id;
  final name;
  final telefono;
  final email;
  final directorioRecuperador;
  final recuperado;

  const HomeScreenSupervisorUpdate(
      {super.key,
      this.id,
      this.name,
      this.telefono,
      this.email,
      this.directorioRecuperador,
      this.recuperado});

  @override
  State<HomeScreenSupervisorUpdate> createState() =>
      _HomeScreenSupervisorUpdateState();
}

class _HomeScreenSupervisorUpdateState
    extends State<HomeScreenSupervisorUpdate> {
  final TextEditingController _nameSupervisorController =
      TextEditingController();
  final TextEditingController _telephoneSupervisorController =
      TextEditingController();
  final TextEditingController _emailSupervisorController =
      TextEditingController();
  final TextEditingController _recuperadoController = TextEditingController();
  final TextEditingController _peridoDirectorioRecuperadoController =
      TextEditingController();

  FocusNode nameSupervisoFocusNode = FocusNode();
  FocusNode telephoneSupervisoFocusNode = FocusNode();
  FocusNode emailSupervisorFocusNode = FocusNode();
  FocusNode recuperadoFocusNode = FocusNode();
  FocusNode peridoDirectorioRecuperadoFocusNode = FocusNode();
  @override
  void dispose() {
    super.dispose();

    _nameSupervisorController.dispose();
    _telephoneSupervisorController.dispose();
    _emailSupervisorController.dispose();
    _recuperadoController.dispose();
    _peridoDirectorioRecuperadoController.dispose();
  }

  void getDataSupervisor() {
    _nameSupervisorController.text = this.widget.name.toString();
    _telephoneSupervisorController.text = this.widget.telefono.toString();
    _recuperadoController.text = this.widget.recuperado.toString();
    _emailSupervisorController.text = this.widget.email.toString();
    _peridoDirectorioRecuperadoController.text =
        this.widget.directorioRecuperador.toString();
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
    getDataSupervisor();
  }

  final _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //final addSchoolViewModel = Provider.of<HomeViewModelScholl>(context);

    final updateSupervisorViewModel = Provider.of<HomeViewModelScholl>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: Form(
        key: _keyForm,
        child: Column(
          children: [
            BarGradient(
                "Actualizar Datos del Supervisor", Icons.create_new_folder),
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              height: 80,
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              child: TextFormField(
                controller: _nameSupervisorController,
                focusNode: nameSupervisoFocusNode,
                decoration: const InputDecoration(
                  hintText: 'Ingrese El Nombre Completo',
                  labelText: 'Nombre Del Supervisor',
                  prefixIcon: Icon(Icons.person),
                ),
                onEditingComplete: () => Utils.fielFocusGeneral(
                    context, telephoneSupervisoFocusNode),
                textInputAction: TextInputAction.next,
              ),
            ),
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              height: 90,
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              child: TextFormField(
                controller: _telephoneSupervisorController,
                focusNode: telephoneSupervisoFocusNode,
                keyboardType: TextInputType.phone,
                maxLength: 10,
                decoration: const InputDecoration(
                  hintText: 'Ingrese El Telefono',
                  labelText: 'Numero De Telefono Del Supervisor',
                  prefixIcon: Icon(Icons.phone),
                ),
                validator: (value) {
                  if (value!.length < 10 || value.length > 10) {
                    return "Ingrese los 10 caracteres";
                  }
                  return null;
                },
                onEditingComplete: () =>
                    Utils.fielFocusGeneral(context, emailSupervisorFocusNode),
                textInputAction: TextInputAction.next,
              ),
            ),
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              height: 90,
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              child: TextFormField(
                controller: _emailSupervisorController,
                focusNode: emailSupervisorFocusNode,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'Ingrese Su Correo Electronico',
                  labelText: 'Correo Electronico Del Supervisor',
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value!.isEmpty || !value.contains('@')) {
                    return 'Formato incorrecto Ejemplo: correo@dominio.com';
                  }
                  return null;
                },
                onEditingComplete: () =>
                    Utils.fielFocusGeneral(context, recuperadoFocusNode),
                textInputAction: TextInputAction.next,
              ),
            ),
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              height: 80,
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              child: TextFormField(
                controller: _recuperadoController,
                focusNode: recuperadoFocusNode,
                decoration: const InputDecoration(
                  hintText: 'Ingrese El Modo de Recuperacion ',
                  labelText: 'Modo De Recuperación',
                  prefixIcon: Icon(Icons.home_max),
                ),
                onEditingComplete: () => Utils.fielFocusGeneral(
                    context, peridoDirectorioRecuperadoFocusNode),
                textInputAction: TextInputAction.next,
              ),
            ),
            Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
              height: 80,
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
              child: TextFormField(
                controller: _peridoDirectorioRecuperadoController,
                focusNode: peridoDirectorioRecuperadoFocusNode,
                decoration: const InputDecoration(
                  hintText: 'Ingrese La Fecha Del Periodo',
                  labelText: 'Perido De Recuperacion',
                  prefixIcon: Icon(Icons.calendar_month_rounded),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Campo requerido";
                  }
                  return null;
                },
              ),
            ),
            SizedBox(
              height: height * .085,
            ),
            RoundButton(
              title: "guardar",
              // loading: addSchoolViewModel.addLoading,
              onPress: () {
                if (_keyForm.currentState!.validate()) {
                  Map data = {
                    "name": _nameSupervisorController.text.toString(),
                    "telephone": _telephoneSupervisorController.text.toString(),
                    "email": _emailSupervisorController.text.toString(),
                    "recuperado": _recuperadoController.text.toString(),
                    'directorio_recuperado':
                        _peridoDirectorioRecuperadoController.text.toString(),
                  };
                  updateSupervisorViewModel.putDataSupervisorApi(
                      this.widget.id, data, token.toString(), context);
                  print(data.toString());
                } else {
                  Utils.flushBarErrorMessage(
                      "Por Favor  Ingrese Todos Los Campos", context);
                }
                /*if (
                    
                    _nameSupervisorController.text.isEmpty) {
                  Utils.flushBarErrorMessage(
                      "Por Favor  Ingrese Todos Los Campos", context);
                } else {
                  Map data = {
                    "name": _nameSupervisorController.text.toString(),
                    "telephone": _telephoneSupervisorController.text.toString(),
                    "email": _emailSupervisorController.text.toString(),
                    "recuperado": _recuperadoController.text.toString(),
                    'directorio_recuperado':
                        _peridoDirectorioRecuperadoController.text.toString(),
                  };
                  updateSupervisorViewModel.putDataSupervisorApi(
                      this.widget.id, data, token.toString(), context);
                  print(data.toString());
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
