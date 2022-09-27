import 'package:dd_property/constatnts/dimentions.dart';
import 'package:flutter/material.dart';

import '../models/post_model.dart';

class PostCard extends StatefulWidget {
  PostModel postModel;
  PostCard({Key? key, required this.postModel}) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  String subtitle(String subtitle) {
    return subtitle;
  }

  String title(String title) {
    return title;
  }

  String price(String price) {
    return "N" + price;
  }

  String category(String category) {
    return category;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 500,
      //color: Colors.green,
      height: 280,
      child: Column(children: [
        Container(
          height: 200,
          width: Dimentions.getSize(context).width * 0.9,
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: NetworkImage(widget.postModel.image!, scale: 0.5),
              )),
        ),
        ListTile(
          title: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category(
                    widget.postModel.category!,
                  ),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(title(widget.postModel.title!),
                    style: TextStyle(fontWeight: FontWeight.bold))
              ],
            ),
          ),
          subtitle: Row(children: [
            Text(category(widget.postModel.bathroom!) + " Bethdrooms"),
            SizedBox(
              width: 20,
            ),
            Text(subtitle(widget.postModel.bathroom!) + " Bethdrooms")
          ]),
          trailing: Text(price(widget.postModel.price!),
              style: TextStyle(fontWeight: FontWeight.bold)),
        )
      ]),
    );
  }
}
