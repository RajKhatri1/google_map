import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_map/screens/homepage/controller/homecontroller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  Homecontroler homecontroler = Get.put(Homecontroler());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GoogleMap(
          markers: {
            Marker(
              draggable: true,
              markerId: MarkerId("raj khatri"),
              position:
                  LatLng(homecontroler.lat.value, homecontroler.log.value),
            ),
          },
          initialCameraPosition: CameraPosition(
              target: LatLng(homecontroler.lat.value, homecontroler.log.value),
              zoom: 15),
        ),
      ),
    );
  }
}
