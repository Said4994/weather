import 'package:flutter/material.dart';

class ScreenSize {
  BuildContext context;
  ScreenSize(this.context);
  double get heightS => MediaQuery.of(context).size.height;
  double get widthS => MediaQuery.of(context).size.width;
}
