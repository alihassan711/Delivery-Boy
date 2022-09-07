import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/app/constant/Color.dart';
import 'package:flutter_application_1/app/modules/home/controllers/DirectionController.dart';
import 'package:flutter_application_1/app/utils.dart/DeliveryTextfield.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class DirectionScreen extends StatefulWidget {
  const DirectionScreen({Key? key}) : super(key: key);

  @override
  State<DirectionScreen> createState() => _DirectionScreenState();
}

class _DirectionScreenState extends State<DirectionScreen> {
  List<LatLng> polylineCordinates = [];
  static const LatLng source = LatLng(33.738045, 73.084488);
  static const LatLng destination = LatLng(33.567997728, 72.635997456);
  getline() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyB1IJp2L0Oh_sDMQ3u6-deX8AfG0sDE354",
      PointLatLng(source.latitude, source.longitude),
      PointLatLng(destination.latitude, destination.longitude),
    );
    print("cccccccccccccccccccccccccccccc${result.status}");

    if (result.points.isNotEmpty) {
      result.points.forEach(
        (PointLatLng point) {
          polylineCordinates.add(
            LatLng(point.latitude, point.longitude),
          );
        },
      );
      setState(() {});
    }
  }

  @override
  void initState() {
    getline();
    super.initState();
  }

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
          getline();
        },
      ),
      body: GoogleMap(
        padding: EdgeInsets.only(top: 100, right: 0),
        markers: {
          Marker(markerId: MarkerId("source"), position: source),
          Marker(markerId: MarkerId("destination"), position: destination),
        },
        initialCameraPosition: CameraPosition(target: source, zoom: 10),
        mapType: MapType.normal,
        myLocationEnabled: true,
        compassEnabled: false,
        polylines: {
          Polyline(
            polylineId: PolylineId("id"),
            points: polylineCordinates,
          )
        },
      ),
    );
  }
}
