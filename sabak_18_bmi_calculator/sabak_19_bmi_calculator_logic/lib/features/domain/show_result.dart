import 'package:flutter/material.dart';
import 'package:sabak_19_bmi_calculator_logic/features/presentation/constants/app_colors.dart';
import 'package:sabak_19_bmi_calculator_logic/features/presentation/constants/app_sized_box.dart';

Future<void> dialogBuilder(
    BuildContext context, String text, double bmiResult) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppColors.appBarBgc,
        title: const Center(
            child: Text(
          'Сиздин BMI жыйынтыгыңыз',
          style: TextStyle(
            color: Colors.white,
          ),
        )),
        content: Row(
          children: [
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            AppSize.h10,
            Text(
              bmiResult.toStringAsFixed(2),
              style: const TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text(
              'Чыгуу',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
