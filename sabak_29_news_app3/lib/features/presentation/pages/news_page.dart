import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sabak_29_news_app3/features/data/fetch_data/fetch_top_news.dart';
import 'package:sabak_29_news_app3/features/presentation/pages/detail_page.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_text_styles.dart';
import '../../data/models/top_news.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  TopNews? topnews;
  Future<void> fetchTopNews() async {
    topnews = await FetchTopNews().fetchTopNews();
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
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
            )
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
                          ),
                        ),
                      ),
                      child: Card(
                        color: Colors.red.withOpacity(0.3),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 130,
                                  height: 150,
                                  child: CachedNetworkImage(
                                    imageUrl: '${news.urlToImage}',
                                    placeholder: (context, url) =>
                                        const CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        const Icon(Icons.error),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            DateFormat('EEEE dd .')
                                                .add_jm()
                                                .format(news.publishedAt),
                                            style: AppTextStyles.dateTextStyle,
                                          ),
                                        ],
                                      ),
                                      Text(
                                        news.title,
                                        style: AppTextStyles.newsTextStyle,
                                      ),
                                    ],
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
                      ),
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
