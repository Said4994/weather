import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/model/currentlocationmodel.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/fiveDayModel.dart';
import 'package:weather_app/model/searchcitynameinfo.dart';

class NetworkService {
  String currentlocUrl(double lat, double long) =>
      'http://api.openweathermap.org/data/2.5/weather?lat=' +
      lat.toString() +
      '&lon=' +
      long.toString() +
      '&appid=$_apiKey&units=metric&lang=tr';
  final String _apiKey = '818b7dd48d211df4400303495207c7ae';
  String fivedayinfo(double lat, double long) =>
      'http://api.openweathermap.org/data/2.5/onecall?lat=' +
      lat.toString() +
      '&lon=' +
      long.toString() +
      '&exclude=minutely,hourly,alerts&appid=$_apiKey&units=metric&lang=tr';

  String fivedayloc(String text) =>
      'http://api.openweathermap.org/data/2.5/weather?q=$text&appid=$_apiKey&lang=tr&units=metric';

  Future<CurrentLocationModel> getcurrentlocationapi(Position pos) async {
    final response =
        await http.get(Uri.parse(currentlocUrl(pos.latitude, pos.longitude)));
    if (response.statusCode == 200) {
      return CurrentLocationModel.fromJson(jsonDecode(response.body));
    }
  }

  Future<FiveDayWeatherModel> getfivedayweather(
      SearchCityNameInfo searchcity) async {
    final response = await http.get(
        Uri.parse(fivedayinfo(searchcity.coord.lat, searchcity.coord.lon)));
    if (response.statusCode == 200) {
      return FiveDayWeatherModel.fromJson(jsonDecode(response.body));
    }
  }

  Future getfivedayweatherlocationinfo(String text) async {
    final response = await http.get(Uri.parse(fivedayloc(text)));
    if (response.statusCode == 200) {
      return SearchCityNameInfo.fromJson(jsonDecode(response.body));
    } else {
      return 'Şehir Bulunamadı !';
    }
  }
}
