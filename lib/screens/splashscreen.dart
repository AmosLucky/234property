import 'dart:async';

import 'package:dd_property/constatnts/assets.dart';
import 'package:dd_property/constatnts/colors.dart';
import 'package:dd_property/repos/user_repo.dart';
import 'package:dd_property/screens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:page_transition/page_transition.dart';

import '../constatnts/dimentions.dart';
import '../functions/navigate.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      UserRepo().signInOldUser(context);
      // var route = MaterialPageRoute(builder: (BuildContext) => Welcome());
      // Navigator.push(context, route);
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Dimentions.getSize(context).width,
      height: Dimentions.getSize(context).height,
      child: Stack(children: [
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
          decoration: BoxDecoration(
            color: MColors.greenBg.withOpacity(0.9),
          ),
          child: Center(
              child: Image.asset(
            GetAssts.getLightLogo(),
            fit: BoxFit.fill,
          )),
        )
      ]),
    );
  }
}
