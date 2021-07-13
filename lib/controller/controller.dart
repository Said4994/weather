import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:weather_app/model/currentlocationmodel.dart';
import 'package:weather_app/model/fiveDayModel.dart';
import 'package:weather_app/page/backgroundimage.dart';
import 'package:weather_app/page/homepage.dart';
import 'package:weather_app/service/api.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
  Position currentPosition;
  CurrentLocationModel currentweather = CurrentLocationModel();
  NetworkService network = NetworkService();
  TextEditingController search = TextEditingController();
  FiveDayWeather fivedayweather = FiveDayWeather();

  Future<Position> getCurrentLocation() async {
    {
      return Geolocator.getCurrentPosition()
          .then((value) => currentPosition = value);
    }
  }

  void screennavigatehomepage() async {
    currentweather = await network.getcurrentlocationapi(currentPosition);
    if (currentweather != null) {
      BackgroundImage();
      Get.off(HomePageWeather(
        curve: currentweather,
      ));
    }
  }

  void screennavigatefivedaypage() async {
    fivedayweather = await network.getfivedayweather(currentPosition);
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
