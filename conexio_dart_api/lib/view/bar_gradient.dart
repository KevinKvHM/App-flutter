import 'package:flutter/material.dart';

class BarGradient extends StatelessWidget {
  String name;
  IconData icon;
  BarGradient(this.name, this.icon);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 25.0),
      height: 215,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.topLeft,
              colors: [
                Color.fromARGB(255, 22, 78, 23),
                Color.fromARGB(255, 22, 78, 2).withOpacity(0.70)
              ]),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30))),
      child: Column(
        children: [
          Spacer(),
          Align(
            alignment: Alignment.center,
            child: Icon(
              this.icon,
              size: 90,
              color: Colors.white,
            ),
          ),
          Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.only(bottom: 32, right: 32),
              child: Text(
                this.name,
                style: TextStyle(
                    color: Colors.white, fontSize: 22, letterSpacing: 5),
              ),
            ),
          )
        ],
      ),
    );
  }
}
