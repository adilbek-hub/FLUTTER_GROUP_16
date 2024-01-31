import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sabak_33_bloc_with_cubit_weather_app/constants/api_const.dart';

import 'weather_model.dart';

class WeatherService {
  Future<WeatherModel?> getWeatherData() async {
    final response = await http.get(Uri.parse(ApiConst.api));
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        return WeatherModel.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}

final weatherService = WeatherService();
