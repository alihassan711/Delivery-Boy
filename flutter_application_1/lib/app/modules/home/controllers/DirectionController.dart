import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
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

  List<LatLng> latlang = [
    LatLng(33.738045, 73.084488),
    LatLng(33.567997728, 72.635997456),
  ];
  final Set<Polyline> polylines = {};
  final Set<Marker> marker = {};
  @override
  void onInit() {
    super.onInit();

    // for (var i = 0; i < latlang.length; i++) {
    //   marker.add(
    //     Marker(
    //       markerId: MarkerId(i.toString()),
    //       position: latlang[i],
    //       infoWindow: InfoWindow(
    //         title: "Realy  Cool",
    //         snippet: '5 star rating',
    //       ),
    //       icon: BitmapDescriptor.defaultMarker,
    //     ),
    //   );
    // }

    // polylines.add(Polyline(polylineId: PolylineId("1"), points: latlang));
  }
}
