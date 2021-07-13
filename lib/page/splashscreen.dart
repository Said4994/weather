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
        height: ScreenSize(context).heightS,
        width: ScreenSize(context).widthS,
        child: Center(
          child: Text(
            'Weather',
            style:
                TextStyle(color: Colors.green.withOpacity(0.4), fontSize: 60),
          ),
        ),
      ),
    );
  }
}
