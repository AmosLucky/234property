import 'dart:convert';

import 'package:html/parser.dart';
import 'package:http/http.dart' as http;

import '../models/properties_model.dart';

class PropertiesRepo {
  var porpertiesUrl =
      "https://234property.chosencrusader.com/admin/process/list?pageType=m-properties&mobile=1&user_id=1&condition=status,1|master_stock_id,1";

  Future fetchProperties() async {
    try {
      http.Response response = await http.get(
        Uri.parse(porpertiesUrl),
      );
      print("1");
      if (response.statusCode == 200) {
        print("2");
        var body = jsonDecode(response.body);
        print("3");
        return body['row'];
      } else {
        print("Error occoured");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  List fetchImages(PropertModel propertModel) {
    List images = [];
    var imagesMaps = json.decode(propertModel.images!);
    imagesMaps.map((e) {
      print(e['src']);
      images.add(e['src']);
    });
    return imagesMaps;
  }

  Future<List<String>> fetchPropertyDetails(id) async {
    String url =
        "https://234property.chosencrusader.com/admin/process/loadform?pageType=properties&mobile=1&user_id=1&id=" +
            id;
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var res = jsonDecode(response.body);
      var body = [];
      res[0]['sales_desc'];
      // final String parsedString = parse(body).documentElement!.text;
      List lats = res[0]['latlong'].toString().split(",");
      print(lats);

      return [res[0]['sales_desc'], lats[0], lats[1]];
      // print(response.body);
      // var body = jsonDecode(response.body);
      //return body[0]['sales_desc'];
    } else {
      return await ["Error occoured"];
    }
  }

  Future searchProperties(String search) async {
    var searchUrl =
        "https://234property.chosencrusader.com/admin/process/list?pageType=m-properties&mobile=1&user_id=1&condition=status,1&combine=and&search=" +
            search;
    try {
      http.Response response = await http.get(
        Uri.parse(searchUrl),
      );
      print("1");
      if (response.statusCode == 200) {
        print("2");
        var body = jsonDecode(response.body);
        print("3");
        return body['row'];
      } else {
        print("Error occoured");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
