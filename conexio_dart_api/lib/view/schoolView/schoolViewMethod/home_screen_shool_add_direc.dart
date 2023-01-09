import 'package:conexio_dart_api/res/components/round_button.dart';
import 'package:conexio_dart_api/utils/routes/routes_name.dart';
import 'package:conexio_dart_api/utils/utils.dart';
import 'package:conexio_dart_api/view/bar_gradient.dart';
import 'package:conexio_dart_api/view/schoolView/schoolViewMethod/home_screen_school_add_super.dart';
import 'package:flutter/material.dart';

class HomeScreenDataDirector extends StatefulWidget {
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
  final latitud;
  final longitud;
  const HomeScreenDataDirector(
      {super.key,
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
      this.longitud});

  @override
  State<HomeScreenDataDirector> createState() => _HomeScreenDataDirectorState();
}

class _HomeScreenDataDirectorState extends State<HomeScreenDataDirector> {
  bool _active = false;

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

  final _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //final addSchoolViewModel = Provider.of<HomeViewModelScholl>(context);
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
                      color: _active
                          ? Color.fromARGB(255, 86, 253, 53)
                          : Color.fromARGB(255, 176, 176, 176),
                      size: 60,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        // Toggle light when tapped.
                        _active = !_active;
                        if (_active != true) {
                          _atencionController.text = "No";
                          print(_atencionController.text.toString());
                        } else {
                          _atencionController.text = "Si";

                          print(_atencionController.text.toString());
                        }
                      });
                    },
                    child: Container(
                      color: _active
                          ? Color.fromARGB(255, 86, 253, 53)
                          : Color.fromARGB(255, 176, 176, 176),
                      padding: const EdgeInsets.all(8),
                      height: 40,
                      width: 90,
                      // Change button text when light changes state.
                      child:
                          Center(child: Text(_active ? 'Activa' : 'Inactivo')),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: height * .085,
            ),
            RoundButton(
              title: "siguiente",
              // loading: addSchoolViewModel.addLoading,
              onPress: () {
                if (_keyForm.currentState!.validate()) {
                  print("validadcion correcta");
                  //Navigator.pop(context);

                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HomeScreenSchoolSupervisor(
                        name_school: this.widget.name_school,
                        cct: this.widget.cct,
                        nivel: this.widget.nivel,
                        calle: this.widget.calle,
                        noExterior: this.widget.noExterior,
                        numeroInteriofinal: this.widget.numeroInteriofinal,
                        asentamiento: this.widget.asentamiento,
                        email_school: this.widget.email_school,
                        telefono: this.widget.telefono,
                        localidadId: this.widget.localidadId,
                        latitud: this.widget.latitud,
                        longitud: this.widget.longitud,
                        nameDirector: _nameDirectorController.text.toString(),
                        sindicato: _sindicatoController.text.toString(),
                        emailDirector: _emailDirectorController.text.toString(),
                        telephoneDirector:
                            _telephoneDirectorController.text.toString(),
                        puesto: _puestoController.text.toString(),
                        atencion: _atencionController.text.toString(),
                      ),
                    ),
                  );
                } else {
                  Utils.flushBarErrorMessage(
                      "Rellenar los campos en rojo", context);
                }
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
