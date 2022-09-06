import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/app/constant/Color.dart';
import 'package:flutter_application_1/app/modules/home/controllers/DirectionController.dart';
import 'package:flutter_application_1/app/utils.dart/DeliveryTextfield.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DirectionScreen extends GetView<DirectionController> {
  const DirectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Abstract.btnColor,
        title: Text("Google Map"),
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 20,
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.loadData();
        },
        child: Icon(Icons.location_on_outlined),
      ),
      body: Obx(() => GoogleMap(
            padding: EdgeInsets.only(top: 100, right: 0),
            markers: controller.list.toSet(),
            initialCameraPosition:
                CameraPosition(target: LatLng(33.6844, 73.8479), zoom: 10),
            mapType: MapType.normal,
            myLocationEnabled: true,
            compassEnabled: false,
            onMapCreated: (GoogleMapController gmcontroller) {
              controller.controller.complete(gmcontroller);
            },
          )),
    );
  }
}
