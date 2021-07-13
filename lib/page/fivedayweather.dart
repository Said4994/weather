import 'package:flutter/material.dart';
import 'package:weather_app/page/backgroundimage.dart';

class FiveDayWeather extends StatelessWidget {
  const FiveDayWeather({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
        ),
      ],
    );
  }
}
