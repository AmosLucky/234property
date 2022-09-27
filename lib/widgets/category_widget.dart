import 'package:dd_property/constatnts/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CategoryWidget extends StatelessWidget {
  IconData icon;
  String text;
  CategoryWidget({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Icon(icon),
        Text(
          text,
          style: TextStyle(color: MColors.lighBlack),
        )
      ]),
    );
  }
}
