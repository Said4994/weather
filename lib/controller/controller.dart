import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
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
  bool service;

  Future servicecontrol() async {
    service = await Geolocator.isLocationServiceEnabled();
    return service;
  }

  void getcurrentpos() async {
    await servicecontrol();
    if (service) {
      currentPosition = await Geolocator.getCurrentPosition();
      currentweather =
          await NetworkService().getcurrentlocationapi(currentPosition);
      Get.off(() => HomePageWeather(
            curve: currentweather,
            search: search,
          ));
    } else
      Geolocator.openAppSettings();
  }

  void screennavigatefivedaypage() async {
    NetworkService()
        .getfivedayweatherlocationinfo(search.text)
        .then((a) async => {
              if (a.runtimeType == String)
                {
                  errorMessage = a,
                  Get.snackbar(
                    'Hata ',
                    errorMessage,
                    margin: EdgeInsets.all(15),
                    duration: Duration(seconds: 2),
                    colorText: Colors.white,
                    borderRadius: 30,
                    backgroundGradient: LinearGradient(colors: [
                      Colors.white,
                      Colors.red.withOpacity(0.8),
                      Colors.red.withOpacity(0.8),
                      Colors.white,
                    ]),
                    dismissDirection: SnackDismissDirection.VERTICAL,
                    icon: Icon(
                      Icons.error_outline_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                    snackPosition: SnackPosition.BOTTOM,
                    forwardAnimationCurve: Curves.easeOutBack,
                  )
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
    getcurrentpos();
    super.onInit();
  }

  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }
}
