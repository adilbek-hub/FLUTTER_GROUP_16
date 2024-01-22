import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:sabak_30_news_app4/features/data/fetch_data/fetch_top_news.dart';
import 'package:sabak_30_news_app4/features/presentation/pages/detail_page.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';
import '../../data/models/country_model.dart';
import '../../data/models/top_news.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  TopNews? topnews;
  Future<void> fetchTopNews([String? domain]) async {
    topnews = null;
    setState(() {});
    topnews = await FetchTopNews().fetchTopNews(domain);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchTopNews();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: AppColors.deepOrange,
          title: const Text(
            'News Agregator',
            style: AppTextStyles.newsNextStyle,
          ),
          actions: [
            PopupMenuButton<Countries>(
              onSelected: (Countries country) async {
                await fetchTopNews(country.domain);
              },
              itemBuilder: (context) => countriesSet
                  .map(
                    (e) => PopupMenuItem<Countries>(
                      value: e,
                      child: Text(e.name),
                    ),
                  )
                  .toList(),
              offset: Offset(0, 100),
              color: Colors.grey,
              elevation: 2,
            ),
          ],
        ),
        body: topnews == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: topnews!.articles.length,
                itemBuilder: (context, index) {
                  final news = topnews!.articles[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: InkWell(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                            urlToImage: news.urlToImage ?? 'PUSTOY SUROT',
                            title: news.title,
                            description: news.description ?? 'PUSTOY TEXT',
                            publishedAt: news.publishedAt,
                            article: news,
                          ),
                        ),
                      ),
                      child: NewsCard(news: news),
                    ),
                  );
                }),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange,
          onPressed: () {},
          child: const Icon(Icons.search),
        ),
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  const NewsCard({
    super.key,
    required this.news,
  });

  final Article news;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red.withOpacity(0.3),
      child: Column(
        children: [
          Text(
            DateFormat('EEEE dd .').add_jm().format(news.publishedAt),
            style: AppTextStyles.dateTextStyle,
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: CachedNetworkImage(
                  imageUrl: news.urlToImage ??
                      'https://t3.ftcdn.net/jpg/03/27/55/60/360_F_327556002_99c7QmZmwocLwF7ywQ68ChZaBry1DbtD.jpg',
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                flex: 3,
                child: Text(
                  news.title,
                  style: AppTextStyles.newsTextStyle,
                ),
              ),
            ],
          ),
          const Divider(
            color: Colors.grey,
            thickness: 2.0,
            indent: 10,
            endIndent: 10,
          ),
        ],
      ),
    );
  }
}
