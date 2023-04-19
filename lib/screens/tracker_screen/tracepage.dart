import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_map/screens/homepage/controller/homecontroller.dart';
import 'package:permission_handler/permission_handler.dart';

import '../homepage/view/home_screen.dart';

class track_me extends StatefulWidget {
  const track_me({Key? key}) : super(key: key);

  @override
  State<track_me> createState() => _track_meState();
}

class _track_meState extends State<track_me> {
  Homecontroler homecontroler = Get.put(Homecontroler());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text("Location Tracker"),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  var status = await Permission.location;
                  if (await status.isDenied) {
                    await Permission.location.request();
                  }
                },
                child: Container(decoration:
                BoxDecoration(border: Border.all(color: Colors.white),borderRadius: BorderRadius.all(Radius.circular(2))),child: Text("Permission")),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () async {
                  Position position = await Geolocator.getCurrentPosition(
                      desiredAccuracy: LocationAccuracy.high);
                  homecontroler.lat.value = position.latitude;
                  homecontroler.log.value = position.longitude;
                },
                child: Container(decoration:
                BoxDecoration(border: Border.all(color: Colors.white),borderRadius: BorderRadius.all(Radius.circular(5))),child: Text("Location",style: TextStyle(color: Colors.white),)),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
              ),
              SizedBox(
                height: 20,
              ),
              Obx(() => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(decoration:
                BoxDecoration(border: Border.all(color: Colors.white),borderRadius: BorderRadius.all(Radius.circular(5))),child: Text("${homecontroler.lat.value}",style: TextStyle(color: Colors.white),)),
              )),
              SizedBox(
                height: 10,
              ),
              Obx(() => Container(margin: EdgeInsets.all(10),decoration:
              BoxDecoration(border: Border.all(color: Colors.white),borderRadius: BorderRadius.all(Radius.circular(5))),child: Text("${homecontroler.log.value}",style: TextStyle(color: Colors.white),))),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          Get.toNamed('home');
        },child: Icon(Icons.location_on_outlined)),
      ),
    );
  }
}
