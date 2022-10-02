import 'dart:convert';

import 'package:dd_property/constatnts/colors.dart';
import 'package:dd_property/constatnts/dimentions.dart';
import 'package:dd_property/models/properties_model.dart';
import 'package:dd_property/widgets/buttons.dart';
import 'package:dd_property/widgets/head.dart';
import 'package:dd_property/widgets/opacitybg.dart';
import 'package:dd_property/widgets/show_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../repos/properties_repo.dart';

class PostDetails extends StatefulWidget {
  PropertModel postModel;
  PostDetails({Key? key, required this.postModel}) : super(key: key);

  @override
  State<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  List? images;
  String property_sales = "";
  @override
  void initState() {
    images = PropertiesRepo().fetchImages(widget.postModel);
    fetchDetails();
    // TODO: implement initState
    super.initState();
  }

  fetchDetails() async {
    var details =
        await PropertiesRepo().fetchPropertyDetails(widget.postModel.properyId);
    setState(() {
      property_sales = details;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: dashboardHead(),
      body: Container(
        child: Stack(children: [
          Container(
              width: double.infinity,
              height: Dimentions.getSize(context).height / 2.6,
              child: showNetworImage(url: images![0]['src'])),
          Container(
            margin: EdgeInsets.only(
              top: Dimentions.getSize(context).height / 3,
            ),
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                color: MColors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    widget.postModel.title!,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                mRow(Icons.category, 15, widget.postModel.category!),
                mRow(Icons.person, 15, widget.postModel.username!),
                mRow(Icons.location_on, 15, widget.postModel.location!),

                /////////
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    "₦" + widget.postModel.price!,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                Container(
                  child: property_sales != ""
                      ? Text(
                          property_sales,
                          style: TextStyle(fontSize: 15),
                        )
                      : Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 50),
                            child: CupertinoActivityIndicator(
                              radius: 20,
                            ),
                          ),
                        ),
                ),

                // Container(
                //   alignment: Alignment.center,
                //   child: roundButton(
                //       context: context,
                //       bgColor: MColors.primaryColor,
                //       text: "Buy",
                //       textColor: MColors.white,
                //       onTap: () {}),
                // ),
                SizedBox(
                  height: 10,
                ),
                // Text(widget.postModel.type!)
              ],
            ),
          )
        ]),
      ),
    );
  }

  ////////////////////////LOADE THE PRODUCT DETAILS FROM SERVER

  Widget mRow(IconData iconData, double size, String text) {
    return Container(
      child: Row(
        children: [
          Icon(
            iconData,
            size: size,
          ),
          SizedBox(
            width: 10,
          ),
          Text(text),
        ],
      ),
    );
  }
}
