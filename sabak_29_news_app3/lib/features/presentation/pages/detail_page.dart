import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sabak_29_news_app3/constants/app_text_styles.dart';

class DetailPage extends StatelessWidget {
  const DetailPage(
      {super.key,
      required this.urlToImage,
      required this.title,
      required this.description,
      required this.publishedAt});
  final String urlToImage;
  final String title;
  final String description;
  final DateTime publishedAt;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailPage'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              DateFormat('EEEE dd .').add_jm().format(publishedAt),
              style: AppTextStyles.dateTextStyle,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 10),
            Image.network(urlToImage),
            const SizedBox(height: 20),
            Text(
              description,
              style: const TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
