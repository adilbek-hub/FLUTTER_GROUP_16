import 'package:flutter/material.dart';
import 'package:sabak_18_bmi_calculator/features/presentation/constants/app_text_styles.dart';

class MaleFemaleCard extends StatelessWidget {
  const MaleFemaleCard({
    super.key,
    this.icon,
    this.text,
    required this.maleFemale,
  });
  final IconData? icon;
  final String? text;
  final bool maleFemale;

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
            color: maleFemale ? Colors.white : Colors.grey,
            size: 70,
          ),
          Text(
            text ?? '',
            style: AppTextStyles.appTextStyle,
          ),
        ],
      ),
    );
  }
}
