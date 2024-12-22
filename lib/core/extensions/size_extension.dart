import 'package:flutter/cupertino.dart';

// Extension to get phone size properties
extension SizeExtension on BuildContext {
  double get height => MediaQuery.sizeOf(this).height;
  double get width => MediaQuery.sizeOf(this).width;
}