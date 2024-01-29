import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/data/news_model/top_news.dart';
import '../features/data/news_service.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsService service;
  NewsBloc({required this.service}) : super(LoadingState()) {
    on<NewsEvent>(
      (event, emit) {
        _getData();
      },
    );
  }
  Future<void> _getData() async {
    final news = await service.fetchData();
    if (news != null) {
      emit(CuccessState(news: news));
    } else {
      emit(const ErrorState(text: 'ERROR'));
    }
  }
}
