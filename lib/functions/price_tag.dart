import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String price(String price) {
  final oCcy = new NumberFormat("#,##0.00", "en_US");
  try {
    return oCcy.format(double.parse(price));
  } catch (e) {
    return price;
  }
  //return "N" + oCcy.format(price);
}
