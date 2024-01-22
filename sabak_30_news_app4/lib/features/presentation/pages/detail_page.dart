import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sabak_30_news_app4/constants/app_text_styles.dart';
import 'package:sabak_30_news_app4/features/data/models/top_news.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  DetailPage(
      {super.key,
      required this.urlToImage,
      required this.title,
      required this.description,
      required this.publishedAt,
      required this.article});
  final String urlToImage;
  final String title;
  final String description;
  final DateTime publishedAt;
  final Article article;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailPage'),
        actions: article.url.isNotEmpty
            ? [
                IconButton(
                    onPressed: () {
                      Share.share(article.url);
                    },
                    icon: const Icon(Icons.share))
              ]
            : null,
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
            CachedNetworkImage(
              imageUrl: article.urlToImage ??
                  'https://t3.ftcdn.net/jpg/03/27/55/60/360_F_327556002_99c7QmZmwocLwF7ywQ68ChZaBry1DbtD.jpg',
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            const SizedBox(height: 20),
            Text(
              description,
              style: const TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.normal,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (!await launchUrl(Uri.parse(article.url))) {
                  throw Exception('Could not launch');
                }
              },
              child: const Text('Сайтка кирүү'),
            ),
          ],
        ),
      ),
    );
  }
}
