import 'package:flutter/material.dart';

class DownlandDatas extends StatefulWidget {
  const DownlandDatas({super.key});

  @override
  State<DownlandDatas> createState() => _DownlandDatasState();
}

class _DownlandDatasState extends State<DownlandDatas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Descargar datos")),
    );
  }
}
