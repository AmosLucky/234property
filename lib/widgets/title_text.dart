import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  String text;
  TitleText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.topLeft,
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold),
        ));
  }
}
