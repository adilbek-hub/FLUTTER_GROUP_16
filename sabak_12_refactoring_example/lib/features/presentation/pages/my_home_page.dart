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
      appBar: myAppBar(),
      body: myBody(),
    );
  }

  AppBar myAppBar() => AppBar(
        title: const Text('RefactoringExample'),
      );

  Widget myBody() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              ImageContainer(
                image:
                    'https://t3.ftcdn.net/jpg/02/43/12/34/360_F_243123463_zTooub557xEWABDLk0jJklDyLSGl2jrr.jpg',
              ),
              SizedBox(width: 10),
              ImageContainer(
                image:
                    'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww',
                text: 'Жазгүл',
                colors: Colors.red,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    super.key,
    required this.image,
    this.text = 'Person',
    this.colors,
  });
  final String image;
  final String text;
  final Color? colors;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: colors,
        height: 160,
        child: Column(
          children: [
            Image.network(
              image,
            ),
            Text(
              text,
              style: const TextStyle(
                fontSize: 20,
              ),
            )
          ],
        ),
      ),
    );
  }
}
