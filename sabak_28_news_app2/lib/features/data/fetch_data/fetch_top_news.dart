import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sabak_28_news_app2/constants/api_const.dart';
import 'package:sabak_28_news_app2/features/data/models/top_news.dart';

class FetchTopNews {
  Future<TopNews?> fetchTopNews() async {
    final response = await http.get(Uri.parse(ApiConst.newsData));
    if (response.statusCode == 200) {
      print(response.body);
      final data = jsonDecode(response.body);
      final topNews = TopNews.fromJson(data);
      return topNews;
    }
    return null;
  }
}
