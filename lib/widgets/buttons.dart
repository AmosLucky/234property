import 'package:flutter/material.dart';

import '../constatnts/dimentions.dart';

Widget roundButton(
    {required BuildContext context,
    Color? bgColor,
    String? text,
    Color? textColor,
    VoidCallback? onTap}) {
  return Container(
    width: Dimentions.getSize(context).width / 1.5,
    height: Dimentions.getSize(context).width / 10,
    child: MaterialButton(
      shape: StadiumBorder(),
      onPressed: onTap,
      child: Text(
        text!,
        style: TextStyle(fontSize: 20),
      ),
      textColor: textColor,
      color: bgColor,
    ),
  );
}
