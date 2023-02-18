import 'package:dd_property/constatnts/assets.dart';
import 'package:dd_property/widgets/square_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../constatnts/colors.dart';
import '../constatnts/dimentions.dart';

class GooleMapPreview extends StatefulWidget {
  String latlong1;
  String latlong2;
  GooleMapPreview({super.key, required this.latlong1, required this.latlong2});

  @override
  State<GooleMapPreview> createState() => _GooleMapPreviewState();
}

class _GooleMapPreviewState extends State<GooleMapPreview> {
  late GoogleMapController mapController;

  LatLng _center = LatLng(45.521563, -122.677433);

  final Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId("1234567890"),
        position: _center,
        icon: BitmapDescriptor.defaultMarker,
        infoWindow: InfoWindow(
          title: 'Land Location',
          snippet: 'address',
        ),
      ));
    });
  }

  @override
  void initState() {
    // setState(() {

    // });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _center =
        LatLng(double.parse(widget.latlong1), double.parse(widget.latlong2));
    return Container(
      height: 1000,
      child: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
        mapToolbarEnabled: true,
        buildingsEnabled: false,
        myLocationButtonEnabled: true,
        mapType: MapType.normal,
        markers: _markers,
        zoomControlsEnabled: true,
        zoomGesturesEnabled: true,
      ),
    );
  }
}
