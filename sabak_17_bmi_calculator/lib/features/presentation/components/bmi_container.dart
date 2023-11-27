import 'package:flutter/material.dart';
import 'package:sabak_17_bmi_calculator/features/presentation/pages/constants/app_text_styles.dart';

class BmiContainer extends StatelessWidget {
  const BmiContainer({
    super.key,
    this.icon,
    this.text,
    this.san,
    this.smText,
    this.widthSize,
    this.heightSize,
  });
  final IconData? icon;
  final String? text;
  final int? san;
  final String? smText;
  final double? widthSize;
  final double? heightSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 177,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 70,
          ),
          Text(
            text ?? '',
            style: AppTextStyles.maleTextStyle,
          ),
          Text(
            smText ?? '',
            style: AppTextStyles.smTextStyle,
          ),
        ],
      ),
    );
  }
}
