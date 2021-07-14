import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class ScreenView {
  BuildContext context;
  ScreenView(this.context);
  double get heightS => MediaQuery.of(context).size.height;
  double get widthS => MediaQuery.of(context).size.width;
}
