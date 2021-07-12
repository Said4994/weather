import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:weather_app/model/currentlocationmodel.dart';
import 'package:weather_app/page/homepage/backgroundimage.dart';
import 'package:weather_app/page/homepage/homepage.dart';
import 'package:weather_app/service/api.dart';
import 'package:get/get.dart';

class SplashScreenEvent extends GetxController {
  Position currentPosition;
  CurrentLocationModel currentweather = CurrentLocationModel();
  NetworkService network = NetworkService();

  Future<Position> getCurrentLocation() async {
    {
      return Geolocator.getCurrentPosition()
          .then((value) => currentPosition = value);
    }
  }

  void screennavigate() async {
    currentweather = await network.getcurrentlocationapi(currentPosition);
    if (currentweather != null) {
      BackgroundImage();
      Get.off(HomePageWeather(
        curve: currentweather,
      ));
    }
  }

  @override
  void onInit() async {
    await getCurrentLocation().then((value) => screennavigate());
    super.onInit();
  }
}
