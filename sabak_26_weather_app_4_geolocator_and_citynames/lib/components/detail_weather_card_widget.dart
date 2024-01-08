import 'package:flutter/material.dart';
import 'package:sabak_26_weather_app_4_geolocator_and_citynames/constants/app_colors.dart';
import 'package:sabak_26_weather_app_4_geolocator_and_citynames/constants/app_text_style.dart';

class DetailWeaterCard extends StatelessWidget {
  const DetailWeaterCard({
    super.key,
    required this.windSpeed,
  });
  final String windSpeed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        width: 70,
        height: 150,
        decoration: BoxDecoration(
          color: AppColors.detailContainerColor,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.air,
              color: AppColors.white,
              size: 30,
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.tempContainerColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  windSpeed,
                  style: AppTextStyle.detailTempStyle,
                ),
              ),
            ),
            const Text(
              '5pm',
              style: AppTextStyle.detailOclock,
            ),
          ],
        ),
      ),
    );
  }
}
