import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/const/screen.dart';
import 'package:weather_app/controller/controller.dart';

class WeatherSplash extends StatelessWidget {
  final loc = Get.put(Controller());

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: ScreenView(context).heightS,
        width: ScreenView(context).widthS,
        child: Center(
          child: Text(
            'Weather',
            style: TextStyle(color: Colors.red.withOpacity(0.6), fontSize: 60),
          ),
        ),
      ),
    );
  }
}
