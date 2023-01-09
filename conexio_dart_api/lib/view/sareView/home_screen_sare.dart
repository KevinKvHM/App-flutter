import 'package:conexio_dart_api/view/sareView/sareMethod/home_screen_sare_Addhome.dart';
import 'package:conexio_dart_api/view/sareView/sareMethod/home_screen_sare_getAll.dart';

import 'package:flutter/material.dart';
import 'package:conexio_dart_api/view/sareView/bottom_navigator_bar_region.dart';

class HomeScreenSare extends StatefulWidget {
  const HomeScreenSare({super.key});

  @override
  State<HomeScreenSare> createState() => _HomeScreenSareState();
}

class _HomeScreenSareState extends State<HomeScreenSare> {
  List fragments = [
    HomeScreenSareGetAll(),
    HomeScreenSareAdd(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigatorBarSare(onTap, currentIndex),
      body: fragments[currentIndex],
    );
  }

  onTap(int index) {
    setState(() {
      this.currentIndex = index;
    });
  }
}
