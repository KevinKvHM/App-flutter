import 'package:flutter/material.dart';

typedef VoidCallbacParam(int index);

class BottomNavigatorBarLocalidad extends StatelessWidget {
  VoidCallbacParam voidCallbackParam;
  int currentIndex;

  BottomNavigatorBarLocalidad(
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
          label: "Listar Localidades",
          // backgroundColor: Colrs.green.shade900,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: "Agregar Localidad",
        ),
        /*  BottomNavigationBarItem(
          icon: Icon(Icons.update),
          label: "Actualizar Localidad",
        ),*/
      ],
    );
  }
}
