import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyHomeView extends StatefulWidget {
  const MyHomeView({super.key});

  @override
  State<MyHomeView> createState() => _MyHomeViewState();
}

class _MyHomeViewState extends State<MyHomeView> {
  Random random = Random();
  int firstNumDice = 1;
  int secondNumDice = 1;
  int sum1 = 0;
  String firstGammer = 'АСАН';

  void firstChangeDices() {
    // firstNumDice  өзгөрмөсүнө рандомду байлоо
    firstNumDice = random.nextInt(6) + 1;
    // secondDice  өзгөрмөсүнө рандомду байлоо
    secondNumDice = random.nextInt(6) + 1;
    // Чыккан санды кошуу
    sum1 = sum1 + firstNumDice + secondNumDice;
    //Абалдын өзгөрүүсү үчүн setState методун колдонуу.
    setState(() {});
    result();
  }

  int thirdNumDice = 1;
  int fourthNumDice = 1;
  int sum2 = 0;
  String secondGammer = 'ҮСӨН';

  void secondChangeDices() {
    // firstNumDice  өзгөрмөсүнө рандомду байлоо
    thirdNumDice = random.nextInt(6) + 1;
    // secondDice  өзгөрмөсүнө рандомду байлоо
    fourthNumDice = random.nextInt(6) + 1;
    // Чыккан санды кошуу
    sum2 = sum2 + thirdNumDice + fourthNumDice;
    //Абалдын өзгөрүүсү үчүн setState методун колдонуу.
    setState(() {});
    result();
  }

  void result() {
    if (sum1 >= 50) {
      showDialog(
          context: context,
          builder: (contex) {
            return AlertDialog(
              title: Text('$firstGammer ЧЕМПИОН'),
              actions: [
                TextButton(
                  onPressed: () {
                    resetAll();
                    Navigator.pop(context);
                    setState(() {});
                  },
                  child: const Text('Чыгуу'),
                ),
              ],
            );
          });
    } else if (sum2 >= 50) {
      showDialog(
          context: context,
          builder: (contex) {
            return AlertDialog(
              title: Text('$secondGammer ЧЕМПИОН'),
              actions: [
                TextButton(
                  onPressed: () {
                    resetAll();
                    Navigator.pop(context);
                    setState(() {});
                  },
                  child: const Text('Чыгуу'),
                ),
              ],
            );
          });
    }
  }

  void resetAll() {
    firstNumDice = 1;
    secondNumDice = 1;
    sum1 = 0;
    thirdNumDice = 1;
    fourthNumDice = 1;
    sum2 = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        title: Text(
          'dice app'.toUpperCase(),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            firstGammer,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            '$sum1',
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              SizedBox(
                  width: 200,
                  height: 200,
                  child: InkWell(
                      onTap: () {
                        firstChangeDices();
                      },
                      child: SvgPicture.asset(
                          'assets/die_face_$firstNumDice.svg'))),
              SizedBox(
                  width: 200,
                  height: 200,
                  child: InkWell(
                      onTap: () {
                        firstChangeDices();
                      },
                      child: SvgPicture.asset(
                          'assets/die_face_$secondNumDice.svg'))),
            ],
          ),
          const Divider(
            color: Colors.black,
            indent: 20,
            endIndent: 20,
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              SizedBox(
                  width: 200,
                  height: 200,
                  child: InkWell(
                      onTap: () {
                        secondChangeDices();
                      },
                      child: SvgPicture.asset(
                          'assets/die_face_$thirdNumDice.svg'))),
              SizedBox(
                  width: 200,
                  height: 200,
                  child: InkWell(
                      onTap: () {
                        secondChangeDices();
                      },
                      child: SvgPicture.asset(
                          'assets/die_face_$fourthNumDice.svg'))),
            ],
          ),
          Text(
            '$sum2',
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            secondGammer,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
