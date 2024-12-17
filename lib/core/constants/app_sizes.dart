import 'package:flutter/material.dart';

class AppSizes {
  static late Size _size;
  static late double phoneWidth;
  static late double phoneHeight;

  void init(BuildContext context) {
    _size = MediaQuery.sizeOf(context); // Phone Size info
    phoneWidth = _size.width; // Phone width size
    phoneHeight = _size.height; // Phone height size
  }
}
