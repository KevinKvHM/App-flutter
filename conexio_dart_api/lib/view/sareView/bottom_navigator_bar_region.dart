import 'package:flutter/material.dart';

typedef VoidCallbacParam(int index);

class BottomNavigatorBarSare extends StatelessWidget {
  VoidCallbacParam voidCallbackParam;
  int currentIndex;

  BottomNavigatorBarSare(
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
          label: "Listar Sares",
          // backgroundColor: Colrs.green.shade900,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add),
          label: "Agregar Sare",
        ),
        /* BottomNavigationBarItem(
          icon: Icon(Icons.update),
          label: "Actualizar Region",
        ),*/
      ],
    );
  }
}
