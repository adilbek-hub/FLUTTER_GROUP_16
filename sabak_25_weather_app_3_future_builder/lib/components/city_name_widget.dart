import 'package:flutter/material.dart';
import 'package:sabak_25_weather_app_3_future_builder/constants/app_text_style.dart';

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
