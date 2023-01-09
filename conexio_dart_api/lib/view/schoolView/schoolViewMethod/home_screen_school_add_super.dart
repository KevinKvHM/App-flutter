import 'package:conexio_dart_api/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../res/components/round_button.dart';
import '../../../utils/utils.dart';
import '../../../view_model/school/home_view_model_school.dart';
import '../../bar_gradient.dart';

class HomeScreenSchoolSupervisor extends StatefulWidget {
  //school
  final name_school;
  final cct;
  final nivel;
  final calle;
  final noExterior;
  final numeroInteriofinal;
  final asentamiento;
  final email_school;
  final telefono;
  final localidadId;
  //coordenadas
  final latitud;
  final longitud;
  //director
  final nameDirector;
  final sindicato;
  final telephoneDirector;
  final puesto;
  final emailDirector;
  final atencion;

  const HomeScreenSchoolSupervisor({
    super.key,
    this.name_school,
    this.cct,
    this.nivel,
    this.calle,
    this.noExterior,
    this.numeroInteriofinal,
    this.asentamiento,
    this.email_school,
    this.telefono,
    this.localidadId,
    this.latitud,
    this.longitud,
    this.nameDirector,
    this.sindicato,
    this.telephoneDirector,
    this.puesto,
    this.emailDirector,
    this.atencion,
  });

  @override
  State<HomeScreenSchoolSupervisor> createState() =>
      _HomeScreenSchoolSupervisorState();
}

class _HomeScreenSchoolSupervisorState
    extends State<HomeScreenSchoolSupervisor> {
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

  UserViewModel getSharedPreferences = UserViewModel();
  String? token;

  @override
  void initState() {
    getSharedPreferences;
    super.initState();
    getSharedPreferences
        .getUser()
        .then((value) => {token = value.token, setState(() {})});
  }

  final _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //final addSchoolViewModel = Provider.of<HomeViewModelScholl>(context);

    final addSchoolViewModel = Provider.of<HomeViewModelScholl>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _keyForm,
            child: Column(
              children: [
                BarGradient("Crear Escuela", Icons.create_new_folder),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 10.0),
                  height: 80,
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
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
                  margin: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 10.0),
                  height: 90,
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
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
                    onEditingComplete: () => Utils.fielFocusGeneral(
                        context, emailSupervisorFocusNode),
                    textInputAction: TextInputAction.next,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 10.0),
                  height: 90,
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
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
                  margin: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 10.0),
                  height: 80,
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
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
                  margin: const EdgeInsets.symmetric(
                      horizontal: 30.0, vertical: 10.0),
                  height: 80,
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
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
                  title: "Crear Escuela",
                  // loading: addSchoolViewModel.addLoading,
                  onPress: () {
                    if (_keyForm.currentState!.validate()) {
                      print("validadcion correcta");
                      Map data = {
                        "name_school": widget.name_school.toString(),
                        "cct": widget.cct.toString(),
                        "nivel": widget.nivel.toString(),
                        "calle": widget.calle.toString(),
                        "noExterior": widget.noExterior.toString(),
                        "numeroInterior": widget.numeroInteriofinal.toString(),
                        "asentamiento": widget.asentamiento.toString(),
                        "email_school": widget.email_school.toString(),
                        "telefono": widget.telefono.toString(),
                        "localidadId": widget.localidadId.toString(),
                        //COORDENADAS
                        "lat": widget.latitud.toString(),
                        "long": widget.longitud.toString(),
                        //Falat id del usuario por implementar
                        //Director
                        "name_director": widget.nameDirector.toString(),
                        "sindicato": widget.sindicato.toString(),
                        "telephone": widget.telephoneDirector.toString(),
                        "puesto": widget.puesto.toString(),
                        "email_director": widget.emailDirector.toString(),
                        //"status": true,
                        "atencion": widget.atencion,
                        //supervisor
                        "name_supervisor":
                            _nameSupervisorController.text.toString(),
                        "telephone_supervisor":
                            _telephoneSupervisorController.text.toString(),
                        "email_supervisor":
                            _emailSupervisorController.text.toString(),
                        "recuperado": _recuperadoController.text.toString(),
                        'directorio_recuperado':
                            _peridoDirectorioRecuperadoController.text
                                .toString(),
                      };

                      addSchoolViewModel.addSchoolApi(
                          data, token.toString(), context);

                      print(data.toString());
                    } else {
                      Utils.flushBarErrorMessage(
                          "Por Favor  Ingrese Todos Los Campos", context);
                    }
                  },
                ),
                SizedBox(
                  height: height * .03,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
