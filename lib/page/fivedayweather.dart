import 'package:flutter/material.dart';
import 'package:weather_app/model/fiveDayModel.dart';
import 'package:weather_app/page/backgroundimage.dart';

class FiveDayWeatherScreen extends StatelessWidget {
  FiveDayWeatherModel weather = FiveDayWeatherModel();
  FiveDayWeatherScreen({Key key, @required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          backgroundColor: Colors.transparent,
        ),
      ],
    );
  }
}
