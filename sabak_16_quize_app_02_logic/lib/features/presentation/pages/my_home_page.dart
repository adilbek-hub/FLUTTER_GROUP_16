import 'package:flutter/material.dart';
import 'package:sabak_16_quize_app_02_logic/features/domain/quize_brain.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;
  List<bool> jooptop = [];

  void incrementIndex(bool joop) {
    if (jooptop.length < 10) {
      final result = quizeList[index].joop;
      jooptop.add(result);
    }

    if (index < 9) {
      index++;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff343434),
      appBar: myAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              quizeList[index].suroo,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 90),
            CustomButton(
              backgroundColor: const Color(0xff4CB050),
              text: 'Туура',
              onPressed: () {
                incrementIndex(true);
              },
            ),
            CustomButton(
              backgroundColor: const Color(0xffEF443A),
              text: 'Туура эмес',
              onPressed: () {
                incrementIndex(false);
              },
            ),
            const SizedBox(height: 80),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: jooptop
                      .map((e) => e
                          ? const Icon(
                              Icons.done,
                              color: Colors.green,
                            )
                          : const Icon(
                              Icons.close,
                              color: Colors.red,
                            ))
                      .toList(),
                ),
                IconButton(
                  onPressed: () {
                    index = 0;
                    jooptop.clear();
                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.refresh,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  AppBar myAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      title: const Text('7 тапшырма'),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.backgroundColor,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final Color backgroundColor;
  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          minimumSize: const Size(335, 70),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
