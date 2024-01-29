import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sabak_32_bloc_news_app/bloc/news_bloc.dart';

import 'features/data/news_service.dart';
import 'features/presentaition/pages/my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) =>
            NewsBloc(service: serviceRepo)..add(MyNewsEvents()),
        child: MyHomePage(),
      ),
    );
  }
}
