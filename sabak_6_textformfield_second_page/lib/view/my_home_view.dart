import 'package:flutter/material.dart';
import 'package:sabak_6_textformfield_second_page/view/second_page.dart';

class MyHomeView extends StatefulWidget {
  const MyHomeView({super.key});

  @override
  State<MyHomeView> createState() => _MyHomeViewState();
}

class _MyHomeViewState extends State<MyHomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff056c5c),
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text('Тапшырма 4'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Image.asset('assets/images/балык.png'),
            ),
            const Text(
              'Turat Alybaev',
              style: TextStyle(
                color: Colors.white,
                fontSize: 48,
                fontWeight: FontWeight.w400,
                fontFamily: "Pasifico",
              ),
            ),
            const Text(
              'Flutter developer',
              style: TextStyle(
                fontFamily: "PixelifySans",
                color: Color(0xfff7f9f9),
                fontSize: 28,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Divider(
              indent: 25,
              endIndent: 25,
              height: 0,
              thickness: 2,
              color: Colors.white,
            ),
            const SizedBox(height: 23),
            TextFormField(
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            TextFormField(
              decoration: const InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SecondPage(),
                  ),
                );
              },
              child: const Text('Басуу'),
            ),
          ],
        ),
      ),
    );
  }
}
