import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/const/screen.dart';
import 'package:weather_app/controller/locationcontroller.dart';

class WeatherSplash extends StatelessWidget {
  final loc = Get.put(SplashScreenEvent());

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: ScreenSize(context).heightS,
        width: ScreenSize(context).widthS,
        child: Center(
          child: Text(
            'Weather',
            style: GoogleFonts.pacifico(
                fontSize: 60, color: Colors.green.withOpacity(0.4)),
          ),
        ),
      ),
    );
  }
}
