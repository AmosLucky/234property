import 'package:dd_property/constatnts/colors.dart';
import 'package:dd_property/constatnts/dimentions.dart';
import 'package:dd_property/models/post_model.dart';
import 'package:dd_property/widgets/buttons.dart';
import 'package:dd_property/widgets/head.dart';
import 'package:dd_property/widgets/opacitybg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PostDetails extends StatefulWidget {
  PostModel postModel;
  PostDetails({Key? key, required this.postModel}) : super(key: key);

  @override
  State<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: dashboardHead(),
      body: Container(
        child: Stack(children: [
          Container(
            width: double.infinity,
            height: Dimentions.getSize(context).height / 2.6,
            child: Image.network(
              widget.postModel.image!,
              fit: BoxFit.fill,
            ),
          ),
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
                Container(
                  child: Row(
                    children: [
                      Icon(Icons.category),
                      SizedBox(
                        width: 10,
                      ),
                      Text(widget.postModel.category!),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Text(
                    "N" + widget.postModel.price!,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.center,
                  child: roundButton(
                      context: context,
                      bgColor: MColors.primaryColor,
                      text: "Buy",
                      textColor: MColors.white,
                      onTap: () {}),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(widget.postModel.post_details!)
              ],
            ),
          )
        ]),
      ),
    );
  }
}
