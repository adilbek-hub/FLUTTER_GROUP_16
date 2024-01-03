import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:sabak_25_weather_app_3_future_builder/components/city_name_widget.dart';
import 'package:sabak_25_weather_app_3_future_builder/components/detail_weather_card_widget.dart';
import 'package:sabak_25_weather_app_3_future_builder/components/near_me_location_widget.dart';
import 'package:sabak_25_weather_app_3_future_builder/components/temperature_widget.dart';
import 'package:sabak_25_weather_app_3_future_builder/features/data/weather_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<Weather?> fetchData() async {
    final dio = Dio();
    final result = await dio.get(
        'https://api.openweathermap.org/data/2.5/weather?q=naryn,&appid=41aa18abb8974c0ea27098038f6feb1b');
    if (result.statusCode == 200) {
      final weather = Weather(
        id: result.data["weather"][0]["id"],
        temp: result.data["main"]["temp"],
        icon: result.data["weather"][0]["icon"],
        name: result.data["name"],
        speed: result.data["wind"]["speed"],
      );
      return weather;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myAppBar(),
      body: Center(
        child: FutureBuilder<Weather?>(
            future: fetchData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.none) {
                return const Text('Сизде интернет байланыш жок');
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasError) {
                  return Text(
                      'Маалыматта кандайдыр бир ката бар:${snapshot.error.toString()}');
                } else if (snapshot.hasData) {
                  final weather = snapshot.data;
                  return Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/weather.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        NearMeLocation(),
                        TemperatureWidget(
                          tempText:
                              "${(weather!.temp - 273.1).floorToDouble()}",
                          tempImage:
                              'https://openweathermap.org/img/wn/${weather.icon}@4x.png',
                        ),
                        CityNameWidget(
                          cityName: weather.name,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DetailWeaterCard(
                              windSpeed: '${(weather.speed).toInt()}',
                            ),
                            DetailWeaterCard(
                              windSpeed: '${(weather.speed).toInt()}',
                            ),
                            DetailWeaterCard(
                              windSpeed: '${(weather.speed).toInt()}',
                            ),
                            DetailWeaterCard(
                              windSpeed: '${(weather.speed).toInt()}',
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                } else {
                  return Text('Билгисиз ката');
                }
              } else {
                return const Text('Билгисиз ката');
              }
            }),
      ),
    );
  }
}

AppBar _myAppBar() {
  return AppBar(
    title: const Center(
      child: Text(
        'Тапшырма-09',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w800,
        ),
      ),
    ),
  );
}
