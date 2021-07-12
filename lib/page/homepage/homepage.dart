import 'package:angles/angles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/const/screen.dart';
import 'package:weather_app/model/currentlocationmodel.dart';
import 'package:weather_app/page/homepage/backgroundimage.dart';
import 'package:weather_icons/weather_icons.dart';

class HomePageWeather extends StatefulWidget {
  CurrentLocationModel curve;
  HomePageWeather({Key key, this.curve}) : super(key: key);

  @override
  _HomePageWeatherState createState() => _HomePageWeatherState();
}

class _HomePageWeatherState extends State<HomePageWeather> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        CurrentWeather(
          curve: widget.curve,
        ),
      ],
    );
  }
}

class CurrentWeather extends StatelessWidget {
  @override
  CurrentLocationModel curve;
  CurrentWeather({Key key, @required this.curve}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: ScreenSize(context).heightS,
        width: ScreenSize(context).widthS,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: ScreenSize(context).heightS / 8,
            ),
            Text(
              curve.name,
              style: GoogleFonts.actor(
                fontSize: 45,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: ScreenSize(context).heightS / 30,
            ),
            Image.network(
              'https://openweathermap.org/img/wn/' +
                  curve.weather[0].icon +
                  '@2x.png',
              height: 150,
            ),
            Text(
              Angle.degrees(curve.main.temp).toString(),
              style: GoogleFonts.actor(fontSize: 40, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
