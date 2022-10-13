import 'package:dd_property/constatnts/colors.dart';
import 'package:dd_property/models/properties_model.dart';
import 'package:dd_property/repos/properties_repo.dart';
import 'package:dd_property/widgets/opacitybg.dart';
import 'package:dd_property/widgets/post_card.dart';
import 'package:flutter/cupertino.dart';
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
  @override
  void initState() {
    PropertiesRepo().fetchProperties();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: OpacityBg(
        context,
        Stack(
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                width: size.width,
                child: searchContainer()),
            FutureBuilder(
                future: PropertiesRepo().fetchProperties(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 100),
                        child: CupertinoActivityIndicator(
                          color: MColors.primaryColor,
                          radius: 20,
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return msg(
                        "An error Occoured : " + snapshot.error.toString());
                  } else if (!snapshot.hasData) {
                    return msg("No data found");
                  }

                  List properies = (snapshot.data) as List;

                  return Container(
                    margin: EdgeInsets.only(top: 70),
                    height: double.infinity,
                    child: ListView.builder(
                        itemCount: properies.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return PostCard(
                              postModel:
                                  PropertModel.fromJSON(properies[index]));
                        }),
                  );
                }),
          ],
        ),
      ),
    );
  }

  Widget msg(String msg) {
    return Center(
      child: Container(
          margin: EdgeInsets.only(top: 100),
          child: Text(
            msg,
            style: TextStyle(
              fontSize: 18,
            ),
          )),
    );
  }
}
