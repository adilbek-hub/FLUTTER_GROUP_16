import 'package:flutter/material.dart';
import 'package:sabak_26_weather_app_4_geolocator_and_citynames/constants/app_text_style.dart';

class CityNameWidget extends StatelessWidget {
  const CityNameWidget({
    super.key,
    required this.cityName,
  });
  final String cityName;

  @override
  Widget build(BuildContext context) {
    return Text(
      cityName,
      style: AppTextStyle.cityStyle,
    );
  }
}
