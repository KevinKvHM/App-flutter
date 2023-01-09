import 'package:conexio_dart_api/view/bottom_navigator_bar_school.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

typedef VoidCallbacParam(int index);

class BottomNavigatorBarRegion extends StatelessWidget {
  VoidCallbacParam voidCallbackParam;
  int currentIndex;

  BottomNavigatorBarRegion(
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
          label: "Listar Regiones",
          // backgroundColor: Colrs.green.shade900,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: "Agregar Region",
        ),
        /* BottomNavigationBarItem(
          icon: Icon(Icons.update),
          label: "Actualizar Region",
        ),*/
      ],
    );
  }
}
