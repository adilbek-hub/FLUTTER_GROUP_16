import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sabak_29_news_app3/constants/api_const.dart';
import 'package:sabak_29_news_app3/features/data/models/top_news.dart';

class FetchTopNews {
  Future<TopNews?> fetchTopNews() async {
    try {
      final response = await http.get(Uri.parse(ApiConst.newsData));
      if (response.statusCode == 200) {
        print(response.body);
        final data = jsonDecode(response.body);
        final topNews = TopNews.fromJson(data);
        return topNews;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }
}
