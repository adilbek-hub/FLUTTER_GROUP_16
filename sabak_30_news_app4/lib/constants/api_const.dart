class ApiConst {
  static String newsData([String? domain]) =>
      'https://newsapi.org/v2/top-headlines?country=${domain ?? 'us'}&apiKey=$apiKey';
  static const apiKey = '2d01e9e3d28d4189b48461be856e9655';
}
