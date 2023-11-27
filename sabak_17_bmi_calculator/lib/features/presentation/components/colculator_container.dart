import 'package:flutter/material.dart';
import 'package:sabak_17_bmi_calculator/features/presentation/pages/constants/app_colors.dart';
import 'package:sabak_17_bmi_calculator/features/presentation/pages/constants/app_text_styles.dart';

class CalcualtorContainer extends StatelessWidget {
  const CalcualtorContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 73,
      color: AppColors.buttonContainerColor,
      child: Center(
        child: Text(
          'Calculator'.toUpperCase(),
          style: AppTextStyles.bmiTextStyle,
        ),
      ),
    );
  }
}
