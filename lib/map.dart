import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class maps extends StatefulWidget {
  const maps({Key? key}) : super(key: key);

  @override
  State<maps> createState() => _mapsState();
}

class _mapsState extends State<maps> {



  late GoogleMapController mapController;
 final Completer<GoogleMapController> _completer = Completer();
  final LatLng _center = const LatLng(15.4000, 74.0200);

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  List<Marker> _marker = [];
  final List<Marker> _list = const [
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(15.4000, 74.0200),
      infoWindow: InfoWindow(title: 'Ponda'),
    )
  ];

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) {
      print("Error");
    });

    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    super.initState();
    _marker.addAll(_list);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green[700],
        ),
        body: SafeArea(
          child: GoogleMap(
            myLocationButtonEnabled: true,
            compassEnabled: false,
            onMapCreated: onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
            markers: Set<Marker>.of(_marker),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.location_disabled_outlined),
          onPressed: () async {
            getUserCurrentLocation().then((value) async{
              print('My Current Location');
              print(
                  value.latitude.toString() + " " + value.longitude.toString());

              _marker.add(
                Marker(
                    markerId: MarkerId('5'),
                    position: LatLng(value.latitude, value.longitude),
                    infoWindow: InfoWindow(title: "My Current Loction")),
              );
              CameraPosition cameraPosition =
                  CameraPosition(
                    zoom: 11.0,
                    target: LatLng(value.latitude, value.longitude)
                    );

                    final GoogleMapController controller =await _completer.future;

                    controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
                    
                    setState(() {
                      
                    });
            });

            
          },
        ),
      ),
    );
  }
}
