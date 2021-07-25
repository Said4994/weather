import 'package:angles/angles.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/get_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/const/screen.dart';
import 'package:get/get.dart';
import 'package:weather_app/controller/controller.dart';
import 'package:weather_app/model/currentlocationmodel.dart';
import 'package:weather_app/page/backgroundimage.dart';

class HomePageWeather extends StatelessWidget {
  CurrentLocationModel curve;
  TextEditingController search;
  final loc = Get.put(Controller());

  HomePageWeather({Key key, this.curve, this.search}) : super(key: key);

  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Container(
              height: screenHeight,
              width: screenWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  sizedBox(screenHeight, 12),
                  paddingtextFieldSearch(screenHeight, screenWidth),
                  customText(curve.name, screenHeight, 0.05),
                  sizedBox(screenHeight, 20),
                  customText(curve.weather[0].description.toUpperCase(),
                      screenHeight, 0.025),
                  sizedBox(screenHeight, 20),
                  Icon(weathericon(curve.weather[0].icon),
                      size: screenHeight * 0.05, color: Colors.white),
                  sizedBox(screenHeight, 20),
                  customText(Angle.degrees(curve.main.temp).toString(),
                      screenHeight, 0.05),
                  sizedBox(screenHeight, 10),
                  wrapPressureAndHumidity(curve, screenHeight),
                  wrapminMax(curve, screenHeight),
                  wrapsunriseandsunset(curve, screenHeight),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Wrap wrapsunriseandsunset(CurrentLocationModel curve, double screenHeight) {
    return Wrap(
      spacing: 35,
      runAlignment: WrapAlignment.spaceAround,
      children: [
        customText(
            'Gün Doğumu:' +
                DateTime.fromMillisecondsSinceEpoch(curve.sys.sunrise * 1000)
                    .toString()
                    .substring(11, 16),
            screenHeight,
            0.02),
        customText(
            'Gün Batımı: ' +
                DateTime.fromMillisecondsSinceEpoch(curve.sys.sunset * 1000)
                    .toString()
                    .substring(11, 16),
            screenHeight,
            0.02)
      ],
    );
  }

  Wrap wrapminMax(CurrentLocationModel curve, double screenHeight) {
    return Wrap(
      spacing: 35,
      runAlignment: WrapAlignment.spaceAround,
      children: [
        customText('Min. Sıc. :' + Angle.degrees(curve.main.tempMin).toString(),
            screenHeight, 0.02),
        customText('Max. Sıc.' + Angle.degrees(curve.main.tempMax).toString(),
            screenHeight, 0.02)
      ],
    );
  }

  Wrap wrapPressureAndHumidity(
      CurrentLocationModel curve, double screenHeight) {
    return Wrap(
      spacing: 50,
      runAlignment: WrapAlignment.spaceAround,
      children: [
        customText(
            'Basınç :' + curve.main.pressure.toString(), screenHeight, 0.02),
        customText(
            'Nem :%' + curve.main.humidity.toString(), screenHeight, 0.02),
      ],
    );
  }

  Padding paddingtextFieldSearch(double screenHeight, double screenWidth) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Container(
        height: screenHeight * 0.04,
        width: screenWidth * 0.6,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            border: Border.all(color: Colors.white)),
        child: TextFormField(
          controller: loc.search,
          textAlign: TextAlign.center,
          style: GoogleFonts.actor(color: Colors.white),
          cursorColor: Colors.white,
          cursorHeight: screenHeight * 0.016,
          decoration: InputDecoration(
            hintStyle: GoogleFonts.actor(
              color: Colors.white,
              fontSize: screenHeight * 0.016,
            ),
            suffixIcon: IconButton(
                onPressed: loc.screennavigatefivedaypage,
                icon: Icon(
                  Icons.search_rounded,
                  color: Colors.white,
                  size: screenHeight * 0.023,
                )),
            border: InputBorder.none,
            hintText: '      Şehir Giriniz',
          ),
        ),
      ),
    );
  }
}
