import 'package:basecode/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrackerScreen extends StatefulWidget {
  static String routeName = "/tracker";

  @override
  _TrackerScreenState createState() => _TrackerScreenState();
}

class _TrackerScreenState extends State<TrackerScreen> {
  List<Marker> sampleMarkers = [];

  @override
  void initState() {
    super.initState();
    sampleMarkers.add(Marker(
      markerId: MarkerId('Marker1'),
      draggable: false,
      infoWindow: InfoWindow(title: "My Location"),
      position: LatLng(35.658581, 139.745438),
    ));
    sampleMarkers.add(Marker(
      markerId: MarkerId('Marker2'),
      draggable: false,
      infoWindow: InfoWindow(title: "Truck"),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueBlue,
      ),
      position: LatLng(35.658990, 139.745725),
    ));
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            "Tracking",
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            color: kAccentColor,
            onPressed: () => Get.back(),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: GoogleMap(
                mapType: MapType.normal,
                initialCameraPosition: CameraPosition(
                  target: LatLng(35.658581, 139.745438),
                  zoom: 18,
                ),
                onMapCreated: (GoogleMapController controller) {},
                markers: Set.from(sampleMarkers),
              ),
            )
          ],
        ),
      ),
    );
  }
}
