import 'package:flutter/material.dart';
import 'package:sabak_19_bmi_calculator_logic/features/presentation/constants/app_colors.dart';
import 'package:sabak_19_bmi_calculator_logic/features/presentation/constants/app_text_styles.dart';

class CalcualtorContainer extends StatelessWidget {
  const CalcualtorContainer({super.key, this.onTap});
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 73,
        color: AppColors.buttonContainerColor,
        child: Center(
          child: Text(
            'Calculator'.toUpperCase(),
            style: AppTextStyles.bmiTextStyle,
          ),
        ),
      ),
    );
  }
}
