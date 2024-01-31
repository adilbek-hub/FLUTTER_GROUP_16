import 'package:flutter/material.dart';

import '../../data/weather_model.dart';

class SuccessWidget extends StatelessWidget {
  const SuccessWidget({
    super.key,
    required this.weather,
  });
  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${weather.main.temp}'),
          Text(weather.name),
          Text('${weather.clouds.all}'),
          Text(weather.weather[0].description),
        ],
      ),
    );
  }
}
