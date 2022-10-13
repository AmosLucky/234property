import 'package:dd_property/widgets/head.dart';
import 'package:dd_property/widgets/opacitybg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Artsisan extends StatefulWidget {
  const Artsisan({Key? key}) : super(key: key);

  @override
  State<Artsisan> createState() => _ArtsisanState();
}

class _ArtsisanState extends State<Artsisan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OpacityBg(
        context,
        Container(
            child: Center(
          child: Text("Nothing to fetch"),
        )),
      ),
    );
  }
}
