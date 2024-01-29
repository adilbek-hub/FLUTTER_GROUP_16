import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sabak_32_bloc_news_app/constants/api_const.dart';
import 'package:sabak_32_bloc_news_app/features/data/news_model/top_news.dart';

class NewsService {
  final http.Client client;

  NewsService({required this.client});

  Future<TopNews?> fetchData() async {
    final response = await http.get(Uri.parse(ApiConst.api));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return TopNews.fromJson(
        jsonDecode(response.body),
      );
    }
    return null;
  }
}

final serviceRepo = NewsService(client: http.Client());
