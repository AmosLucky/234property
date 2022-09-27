import 'package:dd_property/constatnts/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../constatnts/dimentions.dart';

class textInput extends StatefulWidget {
  String labelText;
  TextInputType textInputType;
  TextEditingController controller;
  bool isPassword;
  IconData icon;
  //Function validator;

  textInput({
    Key? key,
    required this.labelText,
    required this.textInputType,
    required this.isPassword,
    required this.controller,
    required this.icon,
    //required this.validator
  }) : super(key: key);

  @override
  State<textInput> createState() => _textInputState();
}

class _textInputState extends State<textInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimentions.getSize(context).width / 1.5,
      child: TextFormField(
        keyboardType: widget.textInputType,
        obscureText: widget.isPassword,
        controller: widget.controller,
        cursorColor: MColors.primaryColor,
        style: TextStyle(color: MColors.primaryColor),
        decoration: InputDecoration(
            labelText: widget.labelText,
            prefixIcon: Icon(
              widget.icon,
              color: MColors.primaryColor,
            ),
            focusedBorder: UnderlineInputBorder(
                borderSide: new BorderSide(color: MColors.primaryColor))),
      ),
    );
  }
}
