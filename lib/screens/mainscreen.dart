import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dd_property/constatnts/colors.dart';
import 'package:dd_property/screens/homescreen.dart';
import 'package:dd_property/screens/profile.dart';
import 'package:dd_property/screens/search/artisan.dart';
import 'package:dd_property/screens/search/searscreen.dart';
import 'package:dd_property/widgets/opacitybg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/head.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> screens = [HomeScreen(), Artsisan(), Artsisan(), Profile()];
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async => await false,
        child: Scaffold(
          appBar: dashboardHead(),
          body: screens[selectIndex],
          bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: MColors.lightBg,
            items: <Widget>[
              Icon(Icons.home, size: 30),
              Icon(Icons.list, size: 30),
              Icon(Icons.engineering, size: 30),
              Icon(Icons.person, size: 30),
            ],
            onTap: (index) {
              setState(() {
                selectIndex = index;
              });
              //Handle button tap
            },
          ),
        ));
  }
}
