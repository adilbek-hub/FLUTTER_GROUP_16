import 'package:flutter/material.dart';
import 'package:sabak_11_refactoring/features/presentation/components/app_button.dart';
import 'package:sabak_11_refactoring/features/presentation/components/app_text_field.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: myAppBar(),
        body: myBody(),
      ),
    );
  }
}

myAppBar() => AppBar(
      centerTitle: true,
      title: Text('Refactoring'.toUpperCase()),
    );

myBody() => Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppTextField(
            hintText: 'Name',
            borderRadius: BorderRadius.circular(10),
          ),
          AppTextField(
            hintText: 'Email',
            borderRadius: BorderRadius.circular(20),
          ),
          AppTextField(
            hintText: 'Phone Number',
            borderRadius: BorderRadius.circular(25),
          ),
          AppTextField(
            hintText: 'Password',
            borderRadius: BorderRadius.circular(40),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppBatton(
                backgroundColor: Colors.red,
                text: 'Red Button',
              ),
              AppBatton(
                backgroundColor: Colors.green,
                text: 'Green Button',
              ),
            ],
          )
        ],
      ),
    );
