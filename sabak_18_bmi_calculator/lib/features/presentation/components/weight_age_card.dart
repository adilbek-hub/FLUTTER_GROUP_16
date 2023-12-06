import 'package:flutter/material.dart';
import 'package:sabak_18_bmi_calculator/features/presentation/constants/app_text_styles.dart';

class WeightAgeCard extends StatelessWidget {
  const WeightAgeCard({
    super.key,
    required this.text,
    required this.san,
    required this.removeIcon,
    required this.addIcon,
    required this.degrement,
    required this.increment,
  });
  final String text;
  final int san;
  final IconData removeIcon;
  final IconData addIcon;
  final void Function() degrement;
  final void Function() increment;

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
            Text(
              text.toUpperCase(),
              style: AppTextStyles.appTextStyle,
            ),
            Text(
              '$san',
              style: AppTextStyles.smTextStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: degrement,
                  icon: Icon(
                    removeIcon,
                    size: 45,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: increment,
                  icon: Icon(
                    addIcon,
                    size: 45,
                    color: Colors.white,
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
