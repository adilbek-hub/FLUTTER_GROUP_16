import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:sabak_24_weather_app_2_get_data/main.dart';
import 'package:sabak_24_weather_app_2_get_data/weather_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<Weather?> fetchData() async {
    final dio = Dio();
    final result = await dio.get(
        'https://api.openweathermap.org/data/2.5/weather?q=bishkek,&appid=41aa18abb8974c0ea27098038f6feb1b');
    if (result.statusCode == 200) {
      final weather = Weather(
        id: result.data["weather"][0]["id"],
        main: result.data["weather"][0]["main"],
        description: result.data["weather"][0]["description"],
        icon: result.data["weather"][0]["icon"],
      );
      return weather;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(snapshot.data!.id.toString()),
                    Text(snapshot.data!.main),
                    Text(snapshot.data!.description),
                    Text(snapshot.data!.icon),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text(snapshot.hasError.toString());
              } else {
                return const CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}
