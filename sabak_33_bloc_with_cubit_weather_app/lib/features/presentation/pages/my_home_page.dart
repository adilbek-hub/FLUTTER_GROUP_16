import 'package:flutter/material.dart';
import '../widgets/bloc_builder_ui.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Weather App with Bloc')),
      ),
      body: const BLocBuilderUI(),
    );
  }
}
