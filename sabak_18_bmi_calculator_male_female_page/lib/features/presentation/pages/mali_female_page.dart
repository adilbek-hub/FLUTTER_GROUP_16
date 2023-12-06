import 'package:flutter/material.dart';
import 'package:sabak_18_bmi_calculator_male_female_page/features/presentation/components/male_female_card.dart';
import 'package:sabak_18_bmi_calculator_male_female_page/features/presentation/pages/female_page.dart';
import 'package:sabak_18_bmi_calculator_male_female_page/features/presentation/pages/male_page.dart';

class MaleFemalePage extends StatefulWidget {
  const MaleFemalePage({super.key});

  @override
  State<MaleFemalePage> createState() => _MaleFemalePageState();
}

class _MaleFemalePageState extends State<MaleFemalePage> {
  bool maleFemale = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Male Female Page'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    maleFemale = false;
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MalePage()));
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FemalePage()));
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
        ],
      ),
    );
  }
}
