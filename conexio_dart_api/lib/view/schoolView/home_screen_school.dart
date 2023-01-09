import 'package:another_flushbar/flushbar.dart';
import 'package:conexio_dart_api/view/bottom_navigator_bar_school.dart';
import 'package:conexio_dart_api/view/schoolView/schoolViewMethod/home_screen_school_add.dart';
import 'package:conexio_dart_api/view/schoolView/schoolViewMethod/home_screen_school_getAll.dart';
import 'package:conexio_dart_api/view/schoolView/schoolViewMethod/home_screen_school_update.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreenSchool extends StatefulWidget {
  const HomeScreenSchool({super.key});

  @override
  State<HomeScreenSchool> createState() => _HomeScreenSchoolState();
}

class _HomeScreenSchoolState extends State<HomeScreenSchool> {
  List fragments = [
    HomeScreenSchoolGetAll(),
    HomeScreenSchoolAdd(),
    // HomeScreenHomeAdd(),
    //  HomeScreenSchoolUpdate(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigatorBar(onTap, currentIndex),
      body: fragments[currentIndex],
    );
  }

  onTap(int index) {
    setState(() {
      this.currentIndex = index;
    });
  }
}
