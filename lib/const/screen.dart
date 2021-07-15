import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:weather_icons/weather_icons.dart';

class ScreenView {
  BuildContext context;
  ScreenView(this.context);
  double get heightS => MediaQuery.of(context).size.height;
  double get widthS => MediaQuery.of(context).size.width;

  AlertDialog alert(BuildContext context, String mesaj) => AlertDialog(
      title: Text(
        mesaj,
        style: TextStyle(fontSize: 20, color: Colors.white),
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.red.withOpacity(0.6));
}
