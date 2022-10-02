import 'package:dd_property/constatnts/colors.dart';
import 'package:dd_property/repos/properties_repo.dart';
import 'package:dd_property/widgets/opacitybg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../constatnts/dimentions.dart';
import '../../models/properties_model.dart';
import '../../widgets/post_card.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool isSearch = false;
  String searchText = "";

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return OpacityBg(
      context,
      SingleChildScrollView(
        child: Column(children: [
          Container(
            width: double.infinity,
            color: MColors.primaryColor,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18)),
                child: TextFormField(
                  autofocus: true,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search,
                        color: MColors.primaryColor,
                      )),
                  onChanged: (value) {
                    setState(() {
                      // searchText = value;
                      // isSearch = true;
                    });
                  },
                  onFieldSubmitted: (value) {
                    setState(() {
                      searchText = value;
                      isSearch = true;
                    });
                    print(value);
                  },
                )),
          ),
          Visibility(
            visible: isSearch,
            child: Container(
              height: height,
              child: FutureBuilder(
                  future: PropertiesRepo().searchProperties(searchText),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: Container(
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
                      margin: EdgeInsets.only(top: 10),
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
            ),
          )
        ]),
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
