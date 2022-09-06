import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DirectionController extends GetxController {
  RxList<Marker> list = [Marker(markerId: MarkerId("1"))].obs;

  Completer<GoogleMapController> controller = Completer();

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) => null)
        .onError((error, stackTrace) {
      print(error);
    });
    return await Geolocator.getCurrentPosition();
  }

  loadData() {
    getUserCurrentLocation().then((value) async {
      list.clear();
      final marker = Marker(
        markerId: MarkerId("1"),
        position: LatLng(value.latitude, value.longitude),
        infoWindow: InfoWindow(title: 'The Title of the marker'),
      );

      CameraPosition cameraPosition = CameraPosition(
          zoom: 14, target: LatLng(value.latitude, value.longitude));
      final GoogleMapController controllew = await controller.future;
      controllew.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      list.add(marker);
    });
  }

  TextEditingController searhC = TextEditingController();
}
