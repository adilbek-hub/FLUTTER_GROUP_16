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
      backgroundColor: Colors.black,
      appBar: _buildAppBar(),
      body: const Column(children: [
        ButtonContainer(color: Colors.red),
        ButtonContainer(color: Colors.pink),
        ButtonContainer(color: Colors.brown),
        ButtonContainer(color: Colors.yellow),
        ButtonContainer(color: Colors.green),
        ButtonContainer(color: Colors.grey),
        ButtonContainer(color: Colors.purple),
      ]),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      centerTitle: true,
      title: const Text(
        'Xylophone',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

class ButtonContainer extends StatelessWidget {
  const ButtonContainer({
    Key? key,
    required this.color,
  }) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: double.infinity,
      height: 95,
    );
  }
}
