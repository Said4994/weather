import 'package:angles/angles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/const/screen.dart';
import 'package:weather_app/model/fiveDayModel.dart';
import 'package:weather_app/model/searchcitynameinfo.dart';
import 'package:weather_app/page/backgroundimage.dart';
import 'package:weather_app/page/homepage.dart';

class FiveDayWeatherScreen extends StatelessWidget {
  FiveDayWeatherModel wth = FiveDayWeatherModel();
  SearchCityNameInfo city = SearchCityNameInfo();
  FiveDayWeatherScreen({Key key, @required this.wth, @required this.city})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          backgroundColor: Colors.transparent,
          body: Container(
            height: screenHeight,
            width: screenWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customText(city.name, screenHeight, 0.05),
                sizedBox(screenHeight, 40),
                customText(city.weather[0].description.toUpperCase(),
                    screenHeight, 0.02),
                sizedBox(screenHeight, 40),
                Icon(weathericon(city.weather[0].icon),
                    size: screenHeight * 0.04, color: Colors.white),
                sizedBox(screenHeight, 20),
                customText(Angle.degrees((city.main.temp)).toString(),
                    screenHeight, 0.04),
                sizedBox(screenHeight, 6),
                Container(
                  height: screenHeight / 3.7,
                  width: screenWidth,
                  color: Colors.transparent,
                  child: Center(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: wth.daily.length - 3,
                      itemBuilder: (context, index) {
                        return buildSizedBoxFiveDayForecetsDetail(
                            screenWidth, screenHeight, index);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  SizedBox buildSizedBoxFiveDayForecetsDetail(
      double screenWidth, double screenHeight, int index) {
    return SizedBox(
      width: screenWidth / 3.1,
      child: Card(
          shadowColor: Colors.grey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: screenHeight * 0.005,
              ),
              Text(
                DateFormat('d-MM-y').format(DateTime.fromMillisecondsSinceEpoch(
                    wth.daily[index].dt * 1000)),
                style: GoogleFonts.actor(
                  fontSize: screenHeight * 0.016,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.016,
              ),
              Icon(weathericon(wth.daily[index].weather[0].icon),
                  size: screenHeight * 0.05,
                  color: Colors.red.withOpacity(0.8)),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Text(
                Angle.degrees(wth.daily[index].temp.day).toString(),
                style: GoogleFonts.actor(fontSize: screenHeight * 0.016),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Text(
                'Nem %' + wth.daily[index].humidity.toString(),
                style: GoogleFonts.actor(
                  fontSize: screenHeight * 0.016,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.005,
              ),
              Text(
                'Gün : ' +
                    DateTime.fromMillisecondsSinceEpoch(
                            wth.daily[index].sunrise * 1000)
                        .toString()
                        .substring(11, 16),
                style: GoogleFonts.actor(
                  fontSize: screenHeight * 0.016,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.005,
              ),
              Text(
                'Gece : ' +
                    DateTime.fromMillisecondsSinceEpoch(
                            wth.daily[index].sunset * 1000)
                        .toString()
                        .substring(11, 16),
                style: GoogleFonts.actor(
                  fontSize: screenHeight * 0.016,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.005,
              ),
              Text(
                'Rüzgar: ' + wth.daily[index].windSpeed.toString() + ' km/s',
                style: GoogleFonts.actor(fontSize: screenHeight * 0.016),
              ),
            ],
          ),
          margin: EdgeInsets.all(7),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(
                color: Colors.white.withOpacity(0.4),
                width: 1,
              ))),
    );
  }
}
