import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/model/currentlocationmodel.dart';
import 'package:weather_app/model/fiveDayModel.dart';
import 'package:weather_app/model/searchcitynameinfo.dart';
import 'package:weather_app/page/fivedayweather.dart';
import 'package:weather_app/page/homepage.dart';
import 'package:weather_app/service/api.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  Position currentPosition;
  CurrentLocationModel currentweather = CurrentLocationModel();
  TextEditingController search = TextEditingController();
  SearchCityNameInfo city = SearchCityNameInfo();
  FiveDayWeatherModel fivedayweather = FiveDayWeatherModel();
  String errorMessage;

  Future<Position> getCurrentLocation() async {
    return await Geolocator.getCurrentPosition()
        .then((value) => currentPosition = value);
  }

  void screennavigatehomepage() async {
    await getCurrentLocation();
    currentweather =
        await NetworkService().getcurrentlocationapi(currentPosition);
    if (currentweather != null) {
      Get.off(() => HomePageWeather(
            curve: currentweather,
            search: search,
          ));
    }
  }

  void screennavigatefivedaypage() async {
    await NetworkService()
        .getfivedayweatherlocationinfo(search.text)
        .then((a) async => {
              if (a.runtimeType == String)
                {
                  errorMessage = a,
                  print(errorMessage),
                  Get.defaultDialog(
                      radius: 22,
                      title: errorMessage,
                      backgroundColor: Colors.white,
                      titleStyle: GoogleFonts.actor(
                          color: Colors.red.withOpacity(0.6))),
                }
              else
                {
                  city = a,
                  await NetworkService().getfivedayweather(city).then((value) {
                    fivedayweather = value;

                    Get.to(() => FiveDayWeatherScreen(
                          city: city,
                          wth: fivedayweather,
                        ));
                  })
                }
            });
    search.clear();
  }

  @override
  void onInit() {
    screennavigatehomepage();
    super.onInit();
  }

  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }
}
