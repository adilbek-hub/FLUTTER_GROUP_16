import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeeeeee),
      body: Center(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 237,
              color: const Color(0xff54B8AB),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/Design circle.png',
                        width: 100,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 70,
                    height: 70,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        'https://karopka.ru/upload/a1d/photo_1_1475190917.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const Text(
                    'Welcome Amelia Roe!',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Image.network(
              'https://math-media.byjusfutureschool.com/bfs-math/2022/06/02174115/SEOBFSMSMATCON074_12%402x-300x300.png',
              width: 70,
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Container(
                width: double.infinity,
                height: 310,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(22),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(137, 116, 114, 114),
                        offset: Offset(4, 4),
                        blurRadius: 10,
                      )
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
