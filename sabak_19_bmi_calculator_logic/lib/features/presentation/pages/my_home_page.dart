import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:sabak_19_bmi_calculator_logic/features/domain/show_result.dart';
import 'package:sabak_19_bmi_calculator_logic/features/presentation/components/colculator_container.dart';
import 'package:sabak_19_bmi_calculator_logic/features/presentation/components/height_card.dart';
import 'package:sabak_19_bmi_calculator_logic/features/presentation/components/male_female_card.dart';
import 'package:sabak_19_bmi_calculator_logic/features/presentation/components/weight_age_card.dart';
import 'package:sabak_19_bmi_calculator_logic/features/presentation/constants/app_colors.dart';
import 'package:sabak_19_bmi_calculator_logic/features/presentation/constants/app_sized_box.dart';
import 'package:sabak_19_bmi_calculator_logic/features/presentation/constants/app_text_styles.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int height = 180;
  bool maleFemale = false;
  int weight = 60;
  int age = 28;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBgc,
      appBar: myAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 21,
          vertical: 39,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      maleFemale = false;
                    });
                  },
                  child: MaleFemaleCard(
                    icon: Icons.male,
                    text: 'MALE',
                    maleFemale: !maleFemale,
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      maleFemale = true;
                    });
                  },
                  child: MaleFemaleCard(
                    icon: Icons.female,
                    text: 'FEMALE',
                    maleFemale: maleFemale,
                  ),
                ),
              ],
            ),
            AppSize.h18,
            HeightCard(
              text: 'HEIGHT',
              san: height,
              smText: 'sm',
              height: height,
              onChanged: (value) {
                setState(() {
                  height = value.toInt();
                });
              },
            ),
            AppSize.h18,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                WeightAgeCard(
                  text: 'Weight',
                  san: weight,
                  removeIcon: Icons.remove_circle,
                  addIcon: Icons.add_circle,
                  degrement: () {
                    setState(() {
                      weight--;
                    });
                  },
                  increment: () {
                    setState(() {
                      weight++;
                    });
                  },
                ),
                WeightAgeCard(
                  text: 'Age',
                  san: age,
                  removeIcon: Icons.remove_circle,
                  addIcon: Icons.add_circle,
                  degrement: () {
                    setState(() {
                      age--;
                    });
                  },
                  increment: () {
                    setState(() {
                      age++;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CalcualtorContainer(
        onTap: () {
          final bmiResult = weight / math.pow(height / 100, 2);
          if (bmiResult < 18.5) {
            dialogBuilder(context, 'Сиз арыксыз', bmiResult);
            print('Сиз арыксыз');
          } else if (bmiResult > 18.5 && bmiResult <= 25) {
            dialogBuilder(context, 'Сиз Нормалдуусуз', bmiResult);
            print('Сиз Нормалдуусуз');
          } else if (bmiResult > 25 && bmiResult <= 30) {
            dialogBuilder(context, 'Сиз ашыкча салмактуусуз', bmiResult);
            print('Сиз ашыкча салмактуусуз');
          } else if (bmiResult > 30) {
            dialogBuilder(context, 'Сиз семизсиз', bmiResult);
            print('Сиз семизсиз');
          }
        },
      ),
    );
  }

  AppBar myAppBar() {
    return AppBar(
      backgroundColor: AppColors.appBarBgc,
      centerTitle: true,
      title: const Text(
        'BMI CALCULATOR',
        style: AppTextStyles.bmiTextStyle,
      ),
    );
  }
}
