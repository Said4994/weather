import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/const/screen.dart';
import 'package:weather_app/controller/controller.dart';

class WeatherSplash extends StatelessWidget {
  final loc = Get.put(Controller());

  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: screenHeight,
        width: screenWidth,
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
