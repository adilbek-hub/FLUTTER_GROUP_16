import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/news_bloc.dart';
import '../../../components/widgets.dart';
import '../../../constants/api_const.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('News App'),
        ),
        body: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            if (state is LoadingState) {
              return const LoadingWidget();
            } else if (state is ErrorState) {
              return Text(state.text);
            } else if (state is CuccessState) {
              return ListView.builder(
                  itemCount: state.news!.articles.length,
                  itemBuilder: (context, index) {
                    final news = state.news!.articles[index];
                    return Card(
                        child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: CachedNetworkImage(
                            imageUrl: news.urlToImage ?? ApiConst.errorImage,
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 2,
                          child: Text(news.title),
                        ),
                      ],
                    ));
                  });
            } else {
              return const Text('UNKNOWNERROR');
            }
          },
        ));
  }
}
