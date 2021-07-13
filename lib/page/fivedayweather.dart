import 'package:flutter/material.dart';
import 'package:weather_app/page/backgroundimage.dart';

class FiveDayWeather extends StatelessWidget {
  FiveDayWeather weather = FiveDayWeather();
  FiveDayWeather({Key key, this.weather}) : super(key: key);

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
