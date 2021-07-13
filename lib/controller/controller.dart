import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:weather_app/model/currentlocationmodel.dart';
import 'package:weather_app/model/fiveDayModel.dart';
import 'package:weather_app/page/backgroundimage.dart';
import 'package:weather_app/page/fivedayweather.dart';
import 'package:weather_app/page/homepage.dart';
import 'package:weather_app/service/api.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  Position currentPosition;
  CurrentLocationModel currentweather = CurrentLocationModel();
  TextEditingController search = TextEditingController();
  FiveDayWeatherModel fivedayweather = FiveDayWeatherModel();
  String errorMessage;

  Future<Position> getCurrentLocation() async {
    {
      return Geolocator.getCurrentPosition()
          .then((value) => currentPosition = value);
    }
  }

  void screennavigatehomepage() async {
    currentweather =
        await NetworkService().getcurrentlocationapi(currentPosition);
    if (currentweather != null) {
      BackgroundImage();
      Get.off(HomePageWeather(
        curve: currentweather,
        search: search,
      ));
    }
  }

  void screennavigatefivedaypage() async {
    await NetworkService().getfivedayweather(search.text).then((value) {
      if (value.runtimeType == String) {
        errorMessage = value;
      } else {
        fivedayweather = value;
        Get.to(FiveDayWeatherScreen(
          weather: fivedayweather,
        ));
      }
    });

    search.clear();
  }

  @override
  void onInit() async {
    await getCurrentLocation().then((value) => screennavigatehomepage());
    super.onInit();
  }

  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }
}
