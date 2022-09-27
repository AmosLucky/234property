import 'package:dd_property/constatnts/assets.dart';
import 'package:dd_property/constatnts/dimentions.dart';
import 'package:dd_property/functions/navigate.dart';
import 'package:dd_property/screens/signin.dart';
import 'package:dd_property/screens/signup.dart';
import 'package:dd_property/widgets/opacitybg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../constatnts/colors.dart';
import '../widgets/bottons.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await false;
      },
      child: Scaffold(
        body: Container(
            child: OpacityBg(
                context,
                Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          //color: Colors.amber,
                          child: Image.asset(
                            GetAssts.getDarkLogo(),
                            width: Dimentions.getSize(context).width / 1.5,
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Find Your",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Perferct place!",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ]),
                        SizedBox(
                          height: 15,
                        ),
                        roundBotton(
                            context: context,
                            bgColor: MColors.primaryColor,
                            text: "Sign In",
                            textColor: Colors.white,
                            onTap: () {
                              NavigateLeftToRight(context, SignIn());
                            }),
                        SizedBox(
                          height: 15,
                        ),
                        roundBotton(
                            context: context,
                            bgColor: MColors.whitBg,
                            text: "Sign Up",
                            textColor: Colors.black,
                            onTap: () {
                              NavigateLeftToRight(context, SignUp());
                            }),
                      ]),
                ))),
      ),
    );
  }
}
