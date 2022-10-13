import 'package:dd_property/screens/signup.dart';
import 'package:dd_property/screens/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../constatnts/colors.dart';
import '../functions/navigate.dart';
import '../widgets/buttons.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(top: 100),
      child: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage("assets/images/avatar.png"),
            ),
            Text(
              "Coming soon",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            roundButton(
                context: context,
                bgColor: MColors.greenBg,
                text: "Sign Out",
                textColor: Colors.white,
                onTap: () async {
                  await FirebaseAuth.instance.signOut;
                  NavigateLeftToRight(context, Welcome());
                }),
          ],
        ),
      ),
    ));
  }
}
