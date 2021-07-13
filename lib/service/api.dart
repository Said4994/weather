import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/model/currentlocationmodel.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/fiveDayModel.dart';

class NetworkService {
  final String _apiKey = '818b7dd48d211df4400303495207c7ae';
  Future<CurrentLocationModel> getcurrentlocationapi(Position pos) async {
    final String currentlocationIUrl =
        'http://api.openweathermap.org/data/2.5/weather?lat=' +
            pos.latitude.toString() +
            '&lon=' +
            pos.longitude.toString() +
            '&appid=$_apiKey&units=metric&lang=tr';

    final response = await http.get(Uri.parse(currentlocationIUrl));
    print(response);
    if (response.statusCode == 200) {
      return CurrentLocationModel.fromJson(jsonDecode(response.body));
    }
  }

  Future<FiveDayWeather> getfivedayweather(String cityname) async {
    print(cityname);
    final String currentlocationIUrl =
        'http://api.openweathermap.org/data/2.5/forecast?q=' +
            cityname +
            '&appid=$_apiKey&lang=tr&units=metric';

    final response = await http.get(Uri.parse(currentlocationIUrl));
    if (response.statusCode == 200) {
      return FiveDayWeather.fromJson(jsonDecode(response.body));
    }
  }
}
