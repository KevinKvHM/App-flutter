import 'package:conexio_dart_api/view/regionView/regionViewMethod/home_screen_region_Addhome.dart';
import 'package:conexio_dart_api/view/regionView/regionViewMethod/home_screen_region_getAll.dart';
import 'package:conexio_dart_api/view/regionView/regionViewMethod/home_screen_region_update.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:conexio_dart_api/view/regionView/bottom_navigator_bar_region.dart';

class HomeScreenRegion extends StatefulWidget {
  const HomeScreenRegion({super.key});

  @override
  State<HomeScreenRegion> createState() => _HomeScreenRegionState();
}

class _HomeScreenRegionState extends State<HomeScreenRegion> {
  List fragments = [
    HomeScreenRegionGetAll(),
    HomeScreenRegionAdd(),
    //HomeScreenRegionUpdate()
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigatorBarRegion(onTap, currentIndex),
      body: fragments[currentIndex],
    );
  }

  onTap(int index) {
    setState(() {
      this.currentIndex = index;
    });
  }
}
