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
            height: ScreenView(context).heightS,
            width: ScreenView(context).widthS,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  city.name,
                  style: GoogleFonts.actor(
                    fontSize: 45,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: ScreenView(context).heightS / 40,
                ),
                Text(
                  city.weather[0].description.toUpperCase(),
                  style: GoogleFonts.actor(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: ScreenView(context).heightS / 30,
                ),
                Icon(weathericon(city.weather[0].icon),
                    size: 50, color: Colors.white),
                SizedBox(
                  height: ScreenView(context).heightS / 20,
                ),
                Text(
                  Angle.degrees(city.main.temp).toString(),
                  style: GoogleFonts.actor(fontSize: 25, color: Colors.white),
                ),
                SizedBox(
                  height: ScreenView(context).heightS / 6,
                ),
                buildContainerDailyWeatherDetails(context)
              ],
            ),
          ),
        ),
      ],
    );
  }

  Container buildContainerDailyWeatherDetails(BuildContext context) {
    return Container(
      height: 220,
      width: ScreenView(context).widthS,
      color: Colors.transparent,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: wth.daily.length - 3,
        itemBuilder: (context, index) {
          return SizedBox(
            width: 150,
            child: Card(
                shadowColor: Colors.grey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      DateFormat('d-MM-y').format(
                          DateTime.fromMillisecondsSinceEpoch(
                              wth.daily[index].dt * 1000)),
                      style: GoogleFonts.actor(),
                    ),
                    SizedBox(height: 15),
                    Icon(weathericon(wth.daily[index].weather[0].icon),
                        size: 50, color: Colors.red.withOpacity(0.8)),
                    SizedBox(height: 25),
                    Text(
                      Angle.degrees(wth.daily[index].temp.day).toString(),
                      style: GoogleFonts.actor(),
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
        },
      ),
    );
  }
}
