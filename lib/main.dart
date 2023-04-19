import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_map/screens/homepage/view/home_screen.dart';
import 'package:google_map/screens/tracker_screen/tracepage.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (p0) => track_me(),
        'home' : (p0) => Homescreen(),
      },
    )
  );
}

