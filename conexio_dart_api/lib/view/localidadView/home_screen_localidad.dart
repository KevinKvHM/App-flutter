import 'package:conexio_dart_api/view/localidadView/bottom_navigator_bar_localidad.dart';
import 'package:conexio_dart_api/view/localidadView/localidadViewMethod/home_screen_localidad_add.dart';
import 'package:conexio_dart_api/view/localidadView/localidadViewMethod/home_screen_localidad_getAll.dart';

import 'package:flutter/material.dart';

class HomeScreenLocalidad extends StatefulWidget {
  const HomeScreenLocalidad({super.key});

  @override
  State<HomeScreenLocalidad> createState() => _HomeScreenLocalidadState();
}

class _HomeScreenLocalidadState extends State<HomeScreenLocalidad> {
  List fragments = [
    HomeScreenLocalidadGetAll(),
    HomeScreenLocalidadAdd(),
    //  HomeScreenLocalidadUpdate()
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigatorBarLocalidad(onTap, currentIndex),
      body: fragments[currentIndex],
    );
  }

  onTap(int index) {
    setState(() {
      this.currentIndex = index;
    });
  }
}
