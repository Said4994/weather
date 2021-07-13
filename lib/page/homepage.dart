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
  HomePageWeather({Key key, @required this.curve, this.search})
      : super(key: key);

  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackgroundImage(),
        mainScreen(context, this.curve),
      ],
    );
  }

  Scaffold mainScreen(BuildContext context, CurrentLocationModel curve) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Container(
          height: ScreenSize(context).heightS,
          width: ScreenSize(context).widthS,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: ScreenSize(context).heightS / 12,
              ),
              textFormFieldSearchCity(context),
              Text(
                curve.name,
                style: GoogleFonts.actor(
                  fontSize: 45,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: ScreenSize(context).heightS / 20,
              ),
              Text(
                curve.weather[0].description.toUpperCase(),
                style: GoogleFonts.actor(
                  fontSize: 24,
                  color: Colors.white,
                ),
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
              SizedBox(
                height: ScreenSize(context).heightS / 10,
              ),
              wrapHumidityAndPressure(curve),
              wrapMaxAndMinDegree(curve),
              wrapSunsetSunriseInfo(curve),
            ],
          ),
        ),
      ),
    );
  }

  Wrap wrapHumidityAndPressure(CurrentLocationModel curve) {
    return Wrap(
      spacing: 50,
      runAlignment: WrapAlignment.spaceAround,
      children: [
        Text(
          'Basınç :' + curve.main.pressure.toString(),
          style: GoogleFonts.actor(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        Text(
          'Nem :%' + curve.main.humidity.toString(),
          style: GoogleFonts.actor(
            fontSize: 22,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  Wrap wrapMaxAndMinDegree(CurrentLocationModel curve) {
    return Wrap(
      spacing: 35,
      runAlignment: WrapAlignment.spaceAround,
      children: [
        Text(
          'Min. Sıc. :' + Angle.degrees(curve.main.tempMin).toString(),
          style: GoogleFonts.actor(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        Text(
          'Max. Sıc.' + Angle.degrees(curve.main.tempMax).toString(),
          style: GoogleFonts.actor(
            fontSize: 22,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  Wrap wrapSunsetSunriseInfo(CurrentLocationModel curve) {
    return Wrap(
      spacing: 35,
      runAlignment: WrapAlignment.spaceAround,
      children: [
        Text(
          'Gün Doğumu:' +
              DateTime.fromMillisecondsSinceEpoch(curve.sys.sunrise)
                  .toString()
                  .substring(11, 16),
          style: GoogleFonts.actor(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        Text(
          'Gün Batımı: ' +
              DateTime.fromMillisecondsSinceEpoch(curve.sys.sunset)
                  .toString()
                  .substring(11, 16),
          style: GoogleFonts.actor(
            fontSize: 22,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  Padding textFormFieldSearchCity(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Container(
        height: 45,
        width: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            border: Border.all(color: Colors.white)),
        child: TextFormField(
          controller: loc.search,
          textAlign: TextAlign.center,
          style: GoogleFonts.actor(color: Colors.white),
          cursorColor: Colors.white,
          decoration: InputDecoration(
              hintStyle: GoogleFonts.actor(color: Colors.white),
              suffixIcon: IconButton(
                  onPressed: loc.screennavigatefivedaypage,
                  icon: Icon(
                    Icons.search_rounded,
                    color: Colors.white,
                    size: 23,
                  )),
              border: InputBorder.none,
              hintText: '      Şehir Giriniz'),
        ),
      ),
    );
  }
}
