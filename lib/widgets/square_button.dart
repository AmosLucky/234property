import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SqaureButton extends StatelessWidget {
  Function()? onPressed;
  String text;
  Color color;
  Color textColor;

  SqaureButton(
      {Key? key,
      required this.onPressed,
      required this.text,
      required this.color,
      required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(color: textColor),
        ),
        color: color,
      ),
    );
  }
}
