import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sabak_30_news_app4/constants/api_const.dart';
import 'package:sabak_30_news_app4/features/data/models/top_news.dart';

class FetchTopNews {
  Future<TopNews?> fetchTopNews([String? domain]) async {
    try {
      final response = await http.get(Uri.parse(ApiConst.newsData(domain)));
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
