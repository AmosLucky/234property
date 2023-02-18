import 'package:dd_property/constatnts/dimentions.dart';
import 'package:dd_property/widgets/square_button.dart';
import 'package:flutter/material.dart';
import 'package:dd_property/constatnts/assets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../constatnts/colors.dart';

class GooleMap extends StatefulWidget {
  const GooleMap({super.key});

  @override
  State<GooleMap> createState() => _GooleMapState();
}

class _GooleMapState extends State<GooleMap> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog();
      },
      child: Container(
          height: Dimentions.getSize(context).height / 8,
          width: Dimentions.getSize(context).width,
          margin: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              color: MColors.lightBg.withOpacity(0.1),
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage(GetAssts.getMapImage()))),
          child: Center(
            child: SqaureButton(
              color: MColors.white,
              text: "View in map",
              onPressed: () {
                showDialog();
              },
              textColor: Colors.black,
            ),
          )),
    );
  }

  void showDialog() {
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: Dimentions.getSize(context).height / 1.3,
        child: Stack(
          children: [
            Container(
              alignment: Alignment.topRight,
              height: 50,
              child: IconButton(
                icon: Icon(Icons.cancel),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 11.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
