import 'package:dd_property/constatnts/dimentions.dart';
import 'package:dd_property/functions/navigate.dart';
import 'package:dd_property/screens/search/searscreen.dart';
import 'package:flutter/material.dart';

class searchContainer extends StatelessWidget {
  const searchContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        NavigateLeftToRight(context, Search());
      },
      child: Container(
        width: Dimentions.getSize(context).width / 1.2,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: 40,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(18)),
        child: Row(children: [
          Icon(
            Icons.search,
            color: Colors.grey[400],
          ),
          Text(
            "Search for property",
            style: TextStyle(color: Colors.grey[400]),
          )
        ]),
      ),
    );
  }
}
