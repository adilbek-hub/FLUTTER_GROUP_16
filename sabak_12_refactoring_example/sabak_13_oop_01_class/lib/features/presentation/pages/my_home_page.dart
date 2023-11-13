import 'package:flutter/material.dart';
import 'package:sabak_13_oop_01_class/features/presentation/pages/components/my_books_list.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: myAppBar(),
      body: const BooksListWidget(),
    );
  }

  AppBar myAppBar() {
    return AppBar(
      backgroundColor: Colors.grey,
      title: const Center(
        child: Text('OOP Class'),
      ),
    );
  }
}
