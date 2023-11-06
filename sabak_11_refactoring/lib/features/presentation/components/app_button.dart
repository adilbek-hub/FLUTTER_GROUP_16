import 'package:flutter/material.dart';

class AppBatton extends StatelessWidget {
  const AppBatton(
      {super.key, required this.backgroundColor, required this.text});
  final Color backgroundColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
        ),
        onPressed: () {},
        child: Text(text),
      ),
    );
  }
}
