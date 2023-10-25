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
  int firstDice = 1;
  int secondDice = 1;
  int sum = 0;

  void changeDices() {
    // firstDice  өзгөрмөсүнө рандомду байлоо
    firstDice = random.nextInt(6) + 1;
    // secondDice  өзгөрмөсүнө рандомду байлоо
    secondDice = random.nextInt(6) + 1;
    //Абалдын өзгөрүүсү үчүн setState методун колдонуу.
    // Чыккан санды кошуу
    sum = sum + firstDice + secondDice;

    setState(() {});
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This is a demo alert dialog.'),
                Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
          if (sum >= 50) Text('Сиздин эсебиңиз $sum'),
          Text(
            '$sum',
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
                        changeDices();
                        // result();
                      },
                      child:
                          SvgPicture.asset('assets/die_face_$firstDice.svg'))),
              SizedBox(
                  width: 200,
                  height: 200,
                  child: InkWell(
                      onTap: () {
                        changeDices();
                        // result();
                      },
                      child:
                          SvgPicture.asset('assets/die_face_$secondDice.svg'))),
            ],
          ),
        ],
      ),
    );
  }
}
