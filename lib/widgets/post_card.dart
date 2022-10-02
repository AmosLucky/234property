import 'dart:convert';

import 'package:dd_property/constatnts/colors.dart';
import 'package:dd_property/constatnts/dimentions.dart';
import 'package:dd_property/functions/navigate.dart';
import 'package:dd_property/repos/properties_repo.dart';
import 'package:dd_property/screens/post_detals.dart';
import 'package:dd_property/widgets/show_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/properties_model.dart';

class PostCard extends StatefulWidget {
  PropertModel postModel;
  PostCard({Key? key, required this.postModel}) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  List? images;
  List? img;
  String subtitle(String subtitle) {
    return subtitle;
  }

  String title(String title) {
    if (title.length > 26) {
      return title.substring(0, 26);
    } else {
      return title;
    }
  }

  String price(String price) {
    final oCcy = new NumberFormat("#,##0.00", "en_US");
    //return "N" + oCcy.format(price);
    return price;
  }

  String category(String category) {
    return category;
  }

  @override
  void initState() {
    images = PropertiesRepo().fetchImages(widget.postModel);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //widget.postModel.images2 = images!;
        NavigateLeftToRight(context, PostDetails(postModel: widget.postModel));
      },
      child: Container(
        //width: 500,
        //color: Colors.green,
        // height: 330,
        child: Column(children: [
          Container(
            height: 200,
            width: Dimentions.getSize(context).width * 0.9,
            decoration: BoxDecoration(
              color: Colors.grey.shade400,
              borderRadius: BorderRadius.circular(12),
            ),
            child: showNetworImage(url: images![0]['src']),
          ),
          ListTile(
            title: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title(
                      widget.postModel.title!,
                    ),
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(category(widget.postModel.category!)),
                ],
              ),
            ),
            subtitle:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(category(widget.postModel.username!)),
              SizedBox(
                width: 20,
              ),
              Text(subtitle(widget.postModel.location!)),
              Container(
                child: Text(
                  price(
                    "₦" + widget.postModel.price!,
                  ),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              )
            ]),
            trailing: Container(
              decoration: BoxDecoration(
                  color: MColors.primaryColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18),
                      bottomRight: Radius.circular(18))),
              padding: EdgeInsets.all(5),
              child: Text(
                "For " + widget.postModel.type!,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
