import 'package:flutter/material.dart';
import 'package:sabak_25_weather_app_3_future_builder/constants/app_text_style.dart';

class TemperatureWidget extends StatelessWidget {
  const TemperatureWidget({
    super.key,
    required this.tempText,
    required this.tempImage,
  });
  final String tempText;
  final String tempImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Text(
            tempText,
            style: AppTextStyle.tempStyle,
          ),
          Image.network(
            tempImage,
            width: 150,
          ),
        ],
      ),
    );
  }
}
