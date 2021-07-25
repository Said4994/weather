import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_icons/weather_icons.dart';

IconData weathericon(String weatherposition) {
  switch (weatherposition) {
    case '01n':
      return WeatherIcons.day_sunny;
      break;
    case '01d':
      return WeatherIcons.day_sunny;
      break;
    case '02n':
      return WeatherIcons.cloud_refresh;
      break;
    case '02d':
      return WeatherIcons.cloud_refresh;
      break;
    case '03n':
      return WeatherIcons.cloud;
      break;
    case '03d':
      return WeatherIcons.cloud_refresh;
      break;
    case '04d':
      return WeatherIcons.cloudy;
      break;
    case '04n':
      return WeatherIcons.cloudy;
      break;
    case '09d':
      return WeatherIcons.rain;
      break;
    case '09n':
      return WeatherIcons.rain;
      break;
    case '10d':
      return WeatherIcons.day_rain;
      break;
    case '10n':
      return WeatherIcons.day_rain;
      break;
    case '11d':
      return WeatherIcons.thunderstorm;
      break;
    case '11n':
      return WeatherIcons.thunderstorm;
      break;
    case '13n':
      return WeatherIcons.snow;
      break;
    case '13d':
      return WeatherIcons.snow;
      break;
    case '50d':
      return WeatherIcons.fog;
      break;
    case '50n':
      return WeatherIcons.fog;
      break;
    default:
  }
}

Text customText(
  String data,
  double screenHeight,
  double fontsizE,
) =>
    Text(
      data,
      style: GoogleFonts.actor(
        fontSize: screenHeight * fontsizE,
        color: Colors.white,
      ),
    );

SizedBox sizedBox(
  double screenHeight,
  double heighT,
) =>
    SizedBox(
      height: screenHeight / heighT,
    );
