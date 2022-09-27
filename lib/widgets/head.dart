import 'package:dd_property/constatnts/assets.dart';
import 'package:dd_property/constatnts/colors.dart';
import 'package:flutter/material.dart';

AppBar dashboardHead() {
  return AppBar(
    backgroundColor: Colors.white,
    leading: Container(),
    title: Container(
      alignment: Alignment.centerLeft,
      child: Image.asset(
        GetAssts.getDarkLogo(),
        height: 30,
      ),
    ),
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
