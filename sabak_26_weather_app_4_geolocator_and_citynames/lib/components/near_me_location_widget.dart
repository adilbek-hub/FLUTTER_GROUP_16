import 'package:flutter/material.dart';
import 'package:sabak_26_weather_app_4_geolocator_and_citynames/constants/app_colors.dart';

class NearMeLocation extends StatelessWidget {
  const NearMeLocation({
    super.key,
    required this.cityNamePressed,
    this.locationPressed,
  });
  final void Function() cityNamePressed;
  final void Function()? locationPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: locationPressed,
            icon: Icon(
              Icons.near_me,
              color: AppColors.white,
              size: 45,
            ),
          ),
          IconButton(
            onPressed: cityNamePressed,
            icon: Icon(
              Icons.location_city,
              color: AppColors.white,
              size: 45,
            ),
          ),
        ],
      ),
    );
  }
}
