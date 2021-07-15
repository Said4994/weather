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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  city.name,
                  style: GoogleFonts.actor(
                    fontSize: ScreenView(context).heightS * 0.05,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: ScreenView(context).heightS / 40,
                ),
                Text(
                  city.weather[0].description.toUpperCase(),
                  style: GoogleFonts.actor(
                    fontSize: ScreenView(context).heightS * 0.02,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: ScreenView(context).heightS / 30,
                ),
                Icon(weathericon(city.weather[0].icon),
                    size: ScreenView(context).heightS * 0.04,
                    color: Colors.white),
                SizedBox(
                  height: ScreenView(context).heightS / 20,
                ),
                Text(
                  Angle.degrees((city.main.temp)).toString(),
                  style: GoogleFonts.actor(
                      fontSize: ScreenView(context).heightS * 0.04,
                      color: Colors.white),
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
      height: ScreenView(context).heightS / 3.7,
      width: ScreenView(context).widthS,
      color: Colors.transparent,
      child: Center(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: wth.daily.length - 3,
          itemBuilder: (context, index) {
            return SizedBox(
              width: ScreenView(context).widthS / 3.1,
              child: Card(
                  shadowColor: Colors.grey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: ScreenView(context).heightS * 0.005,
                        ),
                        Text(
                          DateFormat('d-MM-y').format(
                              DateTime.fromMillisecondsSinceEpoch(
                                  wth.daily[index].dt * 1000)),
                          style: GoogleFonts.actor(
                            fontSize: ScreenView(context).heightS * 0.016,
                          ),
                        ),
                        SizedBox(
                          height: ScreenView(context).heightS * 0.016,
                        ),
                        Icon(weathericon(wth.daily[index].weather[0].icon),
                            size: ScreenView(context).heightS * 0.05,
                            color: Colors.red.withOpacity(0.8)),
                        SizedBox(
                          height: ScreenView(context).heightS * 0.03,
                        ),
                        Text(
                          Angle.degrees(wth.daily[index].temp.day).toString(),
                          style: GoogleFonts.actor(
                              fontSize: ScreenView(context).heightS * 0.016),
                        ),
                        SizedBox(
                          height: ScreenView(context).heightS * 0.01,
                        ),
                        Text(
                          'Nem %' + wth.daily[index].humidity.toString(),
                          style: GoogleFonts.actor(
                            fontSize: ScreenView(context).heightS * 0.016,
                          ),
                        ),
                        SizedBox(
                          height: ScreenView(context).heightS * 0.005,
                        ),
                        Text(
                          'Gün : ' +
                              DateTime.fromMillisecondsSinceEpoch(
                                      wth.daily[index].sunrise * 1000)
                                  .toString()
                                  .substring(11, 16),
                          style: GoogleFonts.actor(
                            fontSize: ScreenView(context).heightS * 0.016,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: ScreenView(context).heightS * 0.005,
                        ),
                        Text(
                          'Gece : ' +
                              DateTime.fromMillisecondsSinceEpoch(
                                      wth.daily[index].sunset * 1000)
                                  .toString()
                                  .substring(11, 16),
                          style: GoogleFonts.actor(
                            fontSize: ScreenView(context).heightS * 0.016,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(
                          height: ScreenView(context).heightS * 0.005,
                        ),
                        Text(
                          'Rüzgar: ' +
                              wth.daily[index].windSpeed.toString() +
                              ' km/s',
                          style: GoogleFonts.actor(
                              fontSize: ScreenView(context).heightS * 0.016),
                        ),
                      ],
                    ),
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
      ),
    );
  }
}
