import 'package:flutter/material.dart';

import '../constatnts/assets.dart';
import '../constatnts/colors.dart';
import '../constatnts/dimentions.dart';

Widget OpacityBg(BuildContext context, Widget body) {
  return Stack(
    children: [
      Container(
        width: Dimentions.getSize(context).width,
        height: Dimentions.getSize(context).height,

        // color: Colors.amber,
        child: Image.asset(
          GetAssts.getBgLogo(),
          fit: BoxFit.fill,
        ),
      ),
      Container(
        width: Dimentions.getSize(context).width,
        height: double.infinity,
        // height: Dimentions.getSize(context).height,
        decoration: BoxDecoration(
          color: MColors.lightBg.withOpacity(0.9),
        ),
        child: body,
      )
    ],
  );
}
