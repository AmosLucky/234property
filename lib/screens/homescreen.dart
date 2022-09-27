import 'package:dd_property/constatnts/colors.dart';
import 'package:dd_property/models/post_model.dart';
import 'package:dd_property/widgets/opacitybg.dart';
import 'package:dd_property/widgets/post_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/category_widget.dart';
import '../widgets/head.dart';
import '../widgets/search_field.dart';
import '../widgets/square_button.dart';
import '../widgets/title_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map> json = [
    {
      "user_id": "1",
      "title": "New Layout Building",
      "image":
          "https://media.istockphoto.com/photos/craftsman-bungalow-house-picture-id1188457556?s=612x612",
      "category": "Delux",
      "price": "200000",
      "bathroom": "3",
      "bedroom": "3",
      "post_details":
          "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod or sit amet, consectetur adipisicing elit, elit, sed do eiusmod or sit amet, consectetur adipisicing elit, elit, sed do eiusmod or sit amet, consectetur adipisicing elit, elit, sed do eiusmod or sit amet, consectetur adipisicing elit,"
    },
    {
      "user_id": "1",
      "title": "New Layout Building",
      "image": "https://thumbs.dreamstime.com/b/housing-estate-6045486.jpg",
      "category": "Delux",
      "price": "300000",
      "bathroom": "5",
      "bedroom": "3",
      "post_details":
          "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod or sit amet, consectetur adipisicing elit, elit, sed do eiusmod or sit amet, consectetur adipisicing elit, elit, sed do eiusmod or sit amet, consectetur adipisicing elit, elit, sed do eiusmod or sit amet, consectetur adipisicing elit,"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OpacityBg(
          context,
          SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: 10,
              ),
              searchContainer(),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              ListView.builder(
                  itemCount: json.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return PostCard(postModel: PostModel.fromJSON(json[index]));
                  }),
              Container(
                height: 50,
              )
            ]),
          )),
    );
  }
}
