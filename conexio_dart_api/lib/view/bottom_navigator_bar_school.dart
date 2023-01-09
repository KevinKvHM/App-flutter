import 'package:flutter/material.dart';

typedef VoidCallbacParam(int index);

class BottomNavigatorBar extends StatelessWidget {
  VoidCallbacParam voidCallbackParam;
  int currentIndex;
  BottomNavigatorBar(this.voidCallbackParam, this.currentIndex);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: voidCallbackParam,
      currentIndex: currentIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.list_alt),
          label: "Listar escuelas",
          // backgroundColor: Colrs.green.shade900,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: "Agregar escuela",
        ),
        /* BottomNavigationBarItem(
          icon: Icon(Icons.update),
          label: "Actualizar escuela",
        ),*/
      ],
    );
  }
}
