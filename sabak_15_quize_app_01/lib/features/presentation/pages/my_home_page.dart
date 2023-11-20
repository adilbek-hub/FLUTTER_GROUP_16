import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff343434),
      appBar: myAppBar(),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Кыргызстанда 7 область барбы?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 90),
            CustomButton(backgroundColor: Color(0xff4CB050), text: 'Туура'),
            CustomButton(
                backgroundColor: Color(0xffEF443A), text: 'Туура эмес'),
            SizedBox(height: 80),
            Row(
              children: [
                Icon(
                  Icons.done,
                  color: Color(0xff4CB050),
                  size: 35,
                ),
                Icon(
                  Icons.close,
                  color: Color(0xffEF443A),
                  size: 35,
                )
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
  }) : super(key: key);

  final Color backgroundColor;
  final String text;

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
        onPressed: () {},
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
