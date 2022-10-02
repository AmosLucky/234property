import 'dart:convert';

class PropertModel {
  String? properyId,
      category,
      title,
      price,
      type,
      location,
      phoneNumber,
      username,
      postedDate,
      status,
      images;

  List images2 = [];
  PropertModel(
      {required this.properyId,
      required this.title,
      required this.category,
      required this.price,
      required this.type,
      required this.location,
      required this.images,
      required this.status,
      required this.postedDate,
      required this.phoneNumber,
      required this.username});

  factory PropertModel.fromJSON(Map json) {
    return PropertModel(
      properyId: checkValues(json['i']),
      title: checkValues(json['c'][0]),
      price: checkValues(json['c'][1]),
      category: checkValues((json['c'][2])),
      username: checkValues(json['c'][3]),
      status: checkValues((json['c'][4])),
      postedDate: checkValues((json['c'][5])),
      images: checkValues((json['c'][6])),
      type: checkValues(json['c'][7]),
      location: checkValues(json['c'][8]),
      phoneNumber: checkValues(json['c'][10]),
    );
  }

  static String checkValues(String? data) {
    if (data == null) {
      return "";
    } else {
      return data;
    }
  }
}
