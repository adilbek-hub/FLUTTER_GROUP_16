import 'package:flutter/material.dart';
import 'package:sabak_14_oop_02_class/featutes/presentation/pages/components/my_body.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myAppBar(),
      body: const MyBody(),
    );
  }

  AppBar _myAppBar() {
    return AppBar(
      title: const Center(
        child: Text('OOP Class Example'),
      ),
    );
  }
}
