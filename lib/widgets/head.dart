import 'package:dd_property/constatnts/assets.dart';
import 'package:dd_property/constatnts/colors.dart';
import 'package:flutter/material.dart';

AppBar dashboardHead() {
  return AppBar(
    backgroundColor: Colors.white,
    leading: Container(),
    titleSpacing: 0.0,
    title: Transform(
        // you can forcefully translate values left side using Transform
        transform: Matrix4.translationValues(-40.0, 0.0, 0.0),
        child: Image.asset(
          GetAssts.getDarkLogo(),
          height: 35,
        )),
    centerTitle: false,
    elevation: 0.1,
    actions: [
      Container(
        margin: EdgeInsets.only(right: 20),
        child: Icon(
          Icons.location_on,
          color: MColors.primaryColor,
        ),
      )
    ],
  );
}
