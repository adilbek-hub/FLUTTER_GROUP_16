import 'article_news.dart';

class TopNews {
  String status;
  int totalResults;
  List<Article> articles;

  TopNews({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  factory TopNews.fromJson(Map<String, dynamic> json) => TopNews(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );
}
