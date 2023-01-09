import 'package:conexio_dart_api/view/bottom_navigator_bar_school.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

typedef VoidCallbacParam(int index);

class BottomNavigatorBarMunicipio extends StatelessWidget {
  VoidCallbacParam voidCallbackParam;
  int currentIndex;

  BottomNavigatorBarMunicipio(
    this.voidCallbackParam,
    this.currentIndex,
  );

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: voidCallbackParam,
      currentIndex: currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.list_alt),
          label: "Listar Municipios",
          // backgroundColor: Colrs.green.shade900,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: "Agregar Municipio",
        ),
        /* BottomNavigationBarItem(
          icon: Icon(Icons.update),
          label: "Actualizar Municipio",
        ),*/
      ],
    );
  }
}
