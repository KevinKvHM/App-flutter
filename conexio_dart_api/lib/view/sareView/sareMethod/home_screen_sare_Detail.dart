import 'package:conexio_dart_api/model/region/region_list_model.dart';
import 'package:conexio_dart_api/model/region/region_model.dart';
import 'package:conexio_dart_api/model/sare/sares_model.dart';
import 'package:conexio_dart_api/res/color.dart';
import 'package:conexio_dart_api/view/localitation/mapas.dart';
import 'package:flutter/material.dart';

class SareGetIdDetail extends StatefulWidget {
  final Sares? sares;
  SareGetIdDetail(
    this.sares, {
    super.key,
  });

  @override
  State<SareGetIdDetail> createState() => _SchoolGetIdDetailState();
}

class _SchoolGetIdDetailState extends State<SareGetIdDetail> {
  List<Regions>? regiones;
  String regs = '';
  void listar() {
    regiones = widget.sares!.regions!;
    regs = regiones!
        .map((e) => e.nameRegion)
        .toString()
        .replaceAll('(', '')
        .replaceAll(')', '');
    print("Sares resgiones_sares: " + regs);

    //print("Sares regions: " + this.widget.sares!.regions.toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detalle SARE"),
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
                /* onTap: () {
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
                          noExterior: this.widget.schols!.noExterior.toString(),
                          noInteriror:
                              this.widget.schols!.numeroInterior.toString(),
                          asentamiento:
                              this.widget.schols!.asentamiento.toString(),
                          email: this.widget.schols!.email.toString(),
                          telefono: this.widget.schols!.telefono.toString(),
                          localidadId:
                              this.widget.schols!.localidadId.toString(),
                          nameLoc:
                              this.widget.schols!.localidad!.nameLoc.toString(),
                        )));
              },*/
                title: Text(
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                    ),

                    //textAlign: TextAlign.justify,
                    textAlign: TextAlign.left,
                    "Sare: ${widget.sares!.nameSare.toString().toUpperCase()}\n\nJefe: ${widget.sares!.nameJefeSare.toString().toUpperCase()} \n\nCorreo Electronico: ${widget.sares!.email.toString().toUpperCase()} \n\nTelefono: ${widget.sares!.telefono.toString().toUpperCase()}\n\nLocalidad: ${widget.sares!.localidad!.nameLoc.toString().toUpperCase()} \n\nClave Oficial: ${widget.sares!.localidad!.claveLocOfi.toString().toUpperCase()} \n\nMunicipio: ${widget.sares!.localidad!.municipio!.name.toString()} \n\nRegion: ${widget.sares!.localidad!.municipio!.region!.nameRegion.toString().toUpperCase()} \nRegiones: ${regs} "),
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
                final lati = this.widget.sares!.latitud;
                final long = this.widget.sares!.longitud;
                final name = "Sare: ${this.widget.sares!.nameSare}";

                final clave = "Clave: ${this.widget.sares!.idSare}";
                /*Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => MapWeb()));*/
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
            Expanded(child: Container()),
            FloatingActionButton(
              heroTag: "btn2",
              child: Icon(Icons.update),
              backgroundColor: AppColors.buttonColor,
              tooltip: 'Update',
              onPressed: () {
                //Navigator.of(context).pushNamed(RoutesName.mapa);
              },
            ),
          ],
        ),
      ),
    );
  }
}
