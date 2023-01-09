/*import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:html';

import 'package:google_maps/google_maps.dart';

class MapWeb extends StatefulWidget {
  const MapWeb({super.key});

  @override
  State<MapWeb> createState() => _MapWebState();
}

class _MapWebState extends State<MapWeb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mapa Web"),
      ),
      body: Container(
        child: getMapWeb(),
      ),
    );
  }

  Widget getMapWeb() {
    String htmlId = "7";
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
      final myLatlng = new LatLng(30.2669444, -97.7427778);

      final mapOptions = new MapOptions()
        ..zoom = 8
        ..center = new LatLng(30.2669444, -97.7427778);

      final elem = DivElement()
        ..id = htmlId
        ..style.width = "100%"
        ..style.height = "100%"
        ..style.border = 'none';

      final map = GMap(elem, mapOptions);

      Marker(MarkerOptions()
        ..position = myLatlng
        ..map = map
        ..title = 'Hello World!');

      return elem;
    });

    return HtmlElementView(viewType: htmlId);
  }
}
*/