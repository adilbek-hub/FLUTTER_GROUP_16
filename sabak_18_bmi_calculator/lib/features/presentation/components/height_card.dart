import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sabak_18_bmi_calculator/features/presentation/constants/app_text_styles.dart';

class HeightCard extends StatelessWidget {
  const HeightCard({
    super.key,
    required this.text,
    required this.san,
    required this.smText,
    required this.height,
    required this.onChanged,
  });
  final String text;
  final int san;
  final String smText;
  final int height;
  final void Function(double) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 177,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text.toUpperCase(),
            style: AppTextStyles.appTextStyle,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                san.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                smText,
                style: const TextStyle(
                  color: Color.fromARGB(255, 228, 224, 224),
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          SizedBox(
            width: double.maxFinite,
            child: CupertinoSlider(
              activeColor: Colors.red,
              min: 0.0,
              max: 300.0,
              value: height.toDouble(),
              onChanged: onChanged,
            ),
          )
        ],
      ),
    );
  }
}
