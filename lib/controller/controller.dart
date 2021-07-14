import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:weather_app/model/currentlocationmodel.dart';
import 'package:weather_app/model/fiveDayModel.dart';
import 'package:weather_app/model/searchcitynameinfo.dart';
import 'package:weather_app/page/backgroundimage.dart';
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
    await NetworkService()
        .getfivedayweatherlocationinfo(search.text)
        .then((a) async => {
              if (a.runtimeType == String)
                {errorMessage = a, print(errorMessage)}
              else
                {
                  city = a,
                  print(city.name),
                  await NetworkService().getfivedayweather(city).then((value) {
                    fivedayweather = value;

                    Get.to(FiveDayWeatherScreen(
                      city: city,
                      wth: fivedayweather,
                    ));
                  })
                }
            });
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
