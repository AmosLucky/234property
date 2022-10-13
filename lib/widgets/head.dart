import 'package:dd_property/constatnts/assets.dart';
import 'package:dd_property/constatnts/colors.dart';
import 'package:dd_property/screens/search/searscreen.dart';
import 'package:flutter/material.dart';

import '../functions/navigate.dart';

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
      InkWell(
        // onTap: () {
        //   NavigateLeftToRight(context, Search());
        // },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: CircleAvatar(
            backgroundColor: MColors.greenBg,
            child: Icon(
              Icons.location_on,
              color: MColors.whitBg,
            ),
          ),
        ),
      )
    ],
  );
}
