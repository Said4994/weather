import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/model/currentlocationmodel.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/model/fiveDayModel.dart';
import 'package:weather_app/model/searchcitynameinfo.dart';

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

  Future getfivedayweather(SearchCityNameInfo searchcity) async {
    final String currentlocationIUrl =
        'http://api.openweathermap.org/data/2.5/onecall?lat=' +
            searchcity.coord.lat.toString() +
            '&lon=' +
            searchcity.coord.lon.toString() +
            '&exclude=minutely,hourly,alerts&appid=$_apiKey&units=metric&lang=tr';

    final response = await http.get(Uri.parse(currentlocationIUrl));
    if (response.statusCode == 200) {
      return FiveDayWeatherModel.fromJson(jsonDecode(response.body));
    }
  }

  Future getfivedayweatherlocationinfo(String text) async {
    final String currentlocationIUrl =
        'http://api.openweathermap.org/data/2.5/weather?q=$text&appid=$_apiKey&lang=tr&units=metric';

    final response = await http.get(Uri.parse(currentlocationIUrl));
    if (response.statusCode == 200) {
      return SearchCityNameInfo.fromJson(jsonDecode(response.body));
    } else {
      return 'Şehir Bulunamadı';
    }
  }
}
