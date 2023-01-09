import 'package:conexio_dart_api/view/municipioView/bottom_navigator_bar_municipio.dart';
import 'package:conexio_dart_api/view/municipioView/municipioViewMethod/home_screen_muni_addhome.dart';
import 'package:conexio_dart_api/view/municipioView/municipioViewMethod/home_screen_muni_getAll.dart';
import 'package:conexio_dart_api/view/municipioView/municipioViewMethod/home_screen_muni_update.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreenMunicipio extends StatefulWidget {
  const HomeScreenMunicipio({super.key});

  @override
  State<HomeScreenMunicipio> createState() => _HomeScreenMunicipioState();
}

class _HomeScreenMunicipioState extends State<HomeScreenMunicipio> {
  List fragments = [
    HomeScreenMuniGetAll(),
    HomeScreenMuniAdd(),
    //  HomeScreenMuniUpdate()
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigatorBarMunicipio(onTap, currentIndex),
      body: fragments[currentIndex],
    );
  }

  onTap(int index) {
    setState(() {
      this.currentIndex = index;
    });
  }
}
