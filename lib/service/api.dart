import 'dart:convert';
import 'package:weather_app/model/currentlocationmodel.dart';
import 'package:http/http.dart' as http;

class NetworkService {
  Future<CurrentLocationModel> getcurrentlocationapi(pos) async {
    final String currentlocationIUrl =
        'http://api.openweathermap.org/data/2.5/weather?lat=' +
            pos.latitude.toString() +
            '&lon=' +
            pos.longitude.toString() +
            '&appid=818b7dd48d211df4400303495207c7ae&units=metric&lang=tr';

    print(currentlocationIUrl);
    final response = await http.get(Uri.parse(currentlocationIUrl));
    print(response);
    if (response.statusCode == 200) {
      print('http');
      return CurrentLocationModel.fromJson(jsonDecode(response.body));
    } else
      print(response.statusCode);
  }
}
