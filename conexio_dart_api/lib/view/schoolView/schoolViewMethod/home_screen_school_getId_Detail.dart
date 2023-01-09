import 'package:conexio_dart_api/model/school/school_list_model.dart';
import 'package:conexio_dart_api/view/localitation/mapas.dart';
import 'package:conexio_dart_api/view/schoolView/schoolViewMethod/home_screen_school_directorUpdate.dart';
import 'package:conexio_dart_api/view/schoolView/schoolViewMethod/home_screen_school_superUpdate.dart';
import 'package:conexio_dart_api/view/schoolView/schoolViewMethod/home_screen_school_update.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/response/status.dart';
import '../../../res/color.dart';
import '../../../view_model/school/home_view_model_school.dart';

class SchoolGetIdDetail extends StatefulWidget {
  final Schols? schols;
  SchoolGetIdDetail(
    this.schols, {
    super.key,
  });

  @override
  State<SchoolGetIdDetail> createState() => _SchoolGetIdDetailState();
}

class _SchoolGetIdDetailState extends State<SchoolGetIdDetail> {
  void setNameEmpleado() {
    try {
      print("Print name empleado: " +
          widget.schols!.usuario!.employee!.fullName.toString());
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // homeViewModelScholl.fechtSchoolListApi();
    super.initState();
    setNameEmpleado();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Detalle Escuela"),
          centerTitle: true,
          backgroundColor: AppColors.grenSnackBar,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ListTile(
                  /*leading: Icon(
                Icons.details,
                color: Colors.white,
                size: 25,
              ),*/
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(20)),
                  tileColor: AppColors.grenSnackBar,
                  // leading: Icon(Icons.school),
                  title: const Text(
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                      textAlign: TextAlign.center,
                      "DETALLES DE LA ESCUELA :"),
                ),
                ListTile(
                  onTap: () {
                    if (kDebugMode) {
                      print(widget.schols!.id.toString());
                    }
                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HomeScreenSchoolUpdate(
                              id: this.widget.schols!.id.toString(),
                              name: this.widget.schols!.nameSchool.toString(),
                              clave: this.widget.schols!.cct.toString(),
                              nivel: this.widget.schols!.nivel.toString(),
                              calle: this.widget.schols!.calle.toString(),
                              noExterior:
                                  this.widget.schols!.noExterior.toString(),
                              noInteriror:
                                  this.widget.schols!.numeroInterior.toString(),
                              asentamiento:
                                  this.widget.schols!.asentamiento.toString(),
                              email: this.widget.schols!.email.toString(),
                              telefono: this.widget.schols!.telefono.toString(),
                              localidadId:
                                  this.widget.schols!.localidadId.toString(),
                              nameLoc: this
                                  .widget
                                  .schols!
                                  .localidad!
                                  .nameLoc
                                  .toString(),
                            )));
                  },
                  title: Text(
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                      ),

                      //textAlign: TextAlign.justify,
                      textAlign: TextAlign.left,
                      "Escuela: ${widget.schols!.nameSchool.toString().toUpperCase()}\n\nClave: ${widget.schols!.cct.toString().toUpperCase()} \n\nNivel Educativo: ${widget.schols!.nivel.toString().toUpperCase()} \n\nCalle: ${widget.schols!.calle.toString().toUpperCase()} \n\nNumero Exterior: ${widget.schols!.noExterior.toString().toUpperCase()} \n\nNumero Interior: ${widget.schols!.numeroInterior.toString().toUpperCase()} \n\nAsentamiento: ${widget.schols!.asentamiento.toString().toUpperCase()} \n\nCorreo Institucional: ${widget.schols!.email.toString()} \n\nTelefono: ${widget.schols!.telefono.toString().toUpperCase()} \n\nNombre De La Localidad: ${widget.schols!.localidad!.nameLoc.toString().toUpperCase()} \n\nClave Oficial De Localidad: ${widget.schols!.localidad!.claveLocOfi.toString().toUpperCase()} \n\nAgregado por;\n Usuario: ${widget.schols!.usuario!.employee!.fullName.toString()}\n Email: ${widget.schols!.usuario!.employee!.email.toString()}"),
                ),
                ListTile(
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(20)),
                  tileColor: AppColors.grenSnackBar,
                  title: const Text(
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                      textAlign: TextAlign.center,
                      "DETALLES DEL DIRECTOR :"),
                ),
                ListTile(
                  onTap: () {
                    if (kDebugMode) {
                      print(widget.schols!.id.toString());
                    }
                    Navigator.pop(context);
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => HomeScreenDirectorUpdate(
                              id: this.widget.schols!.director!.id.toString(),
                              name:
                                  this.widget.schols!.director!.name.toString(),
                              sindicato: this
                                  .widget
                                  .schols!
                                  .director!
                                  .sindicato
                                  .toString(),
                              telefono: this
                                  .widget
                                  .schols!
                                  .director!
                                  .telephone
                                  .toString(),
                              puesto: this
                                  .widget
                                  .schols!
                                  .director!
                                  .puesto
                                  .toString(),
                              email: this
                                  .widget
                                  .schols!
                                  .director!
                                  .email
                                  .toString(),
                              atencion: this
                                  .widget
                                  .schols!
                                  .director!
                                  .atencion
                                  .toString(),
                            )));
                  },
                  title: Text(
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                      ),
                      "Director: ${widget.schols!.director!.name.toString().toUpperCase()}\n\nSindicato: ${widget.schols!.director!.sindicato.toString().toUpperCase()}\n\nTelefono: ${widget.schols!.director!.telephone.toString().toUpperCase()}\n\nPuesto: ${widget.schols!.director!.puesto.toString().toUpperCase()}\n\nCorreo Electronico: ${widget.schols!.director!.email.toString()} \n\nEstatus: ${widget.schols!.director!.status.toString().toUpperCase()}\n"),
                ),
                ListTile(
                  tileColor: AppColors.grenSnackBar,
                  shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(20)),
                  title: const Text(
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        //backgroundColor: AppColors.grenSnackBar,
                      ),
                      textAlign: TextAlign.center,
                      "DETALLES DEL SUPERVISOR :"),
                ),
                ListTile(
                  title: Text(
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                      ),
                      "Supervisor: ${widget.schols!.director!.supervisor!.name.toString().toUpperCase()}\n\nTelefono: ${widget.schols!.director!.supervisor!.telephone.toString().toUpperCase()}\n\nCorreo Electronico: ${widget.schols!.director!.supervisor!.email.toString()}\n\nRecuperado: ${widget.schols!.director!.supervisor!.recuperado.toString().toUpperCase()}\n\nFecha Del Directorio Recuperado: ${widget.schols!.director!.supervisor!.directorioRecuperado.toString().toUpperCase()} \n\nFecha de la Creacion de la Escuela: ${widget.schols!.director!.supervisor!.createdAt.toString().toUpperCase()}"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => HomeScreenSupervisorUpdate(
                          id: this
                              .widget
                              .schols!
                              .director!
                              .supervisor!
                              .id
                              .toString(),
                          name: this
                              .widget
                              .schols!
                              .director!
                              .supervisor!
                              .name
                              .toString(),
                          telefono: this
                              .widget
                              .schols!
                              .director!
                              .supervisor!
                              .telephone,
                          recuperado: this
                              .widget
                              .schols!
                              .director!
                              .supervisor!
                              .recuperado,
                          email: this
                              .widget
                              .schols!
                              .director!
                              .supervisor!
                              .email
                              .toString(),
                          directorioRecuperador: this
                              .widget
                              .schols!
                              .director!
                              .supervisor!
                              .directorioRecuperado
                              .toString(),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(left: 50),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: "btn1",
                child: Icon(Icons.map_sharp),
                backgroundColor: AppColors.buttonColor,
                tooltip: 'Ver en Mapa',
                onPressed: () {
                  final lati = this.widget.schols!.ubicacion!.latidud;
                  final long = this.widget.schols!.ubicacion!.longitud;
                  final name = "Escuela: ${this.widget.schols!.nameSchool}";

                  final clave = "Clave ${this.widget.schols!.cct}";
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MapViews(
                            latitud: lati,
                            longitud: long,
                            name: name,
                            clave: clave,
                          )));
                  //Navigator.of(context).pushNamed(RoutesName.mapa);
                },
              ),
            ],
          ),
        ));
  }
}
