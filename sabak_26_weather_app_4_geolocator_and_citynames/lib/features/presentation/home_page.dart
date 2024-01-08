import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sabak_26_weather_app_4_geolocator_and_citynames/components/city_name_widget.dart';
import 'package:sabak_26_weather_app_4_geolocator_and_citynames/components/detail_weather_card_widget.dart';
import 'package:sabak_26_weather_app_4_geolocator_and_citynames/components/near_me_location_widget.dart';
import 'package:sabak_26_weather_app_4_geolocator_and_citynames/components/temperature_widget.dart';
import 'package:sabak_26_weather_app_4_geolocator_and_citynames/constants/api_const.dart';
import 'package:sabak_26_weather_app_4_geolocator_and_citynames/features/data/weather_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> cities = [
    'Бишкек',
    'Ош',
    'Каракол',
    'Талас',
    'Баткен',
    'Нарын',
    'Токмок',
    'Жалал-Абад',
  ];
  Weather? weather;
  // Future<Weather?> fetchData() async {
  //   final dio = Dio();
  //   final result = await dio.get(
  //       'https://api.openweathermap.org/data/2.5/weather?q=naryn,&appid=41aa18abb8974c0ea27098038f6feb1b');
  //   if (result.statusCode == 200) {
  //     final weather = Weather(
  //       id: result.data["weather"][0]["id"],
  //       temp: result.data["main"]["temp"],
  //       icon: result.data["weather"][0]["icon"],
  //       name: result.data["name"],
  //       speed: result.data["wind"]["speed"],
  //     );
  //     return weather;
  //   } else {
  //     return null;
  //   }
  // }
// Geolocator uchun function
  Future<void> weatherLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.always &&
          permission == LocationPermission.whileInUse) {
        Position position = await Geolocator.getCurrentPosition();
        final dio = Dio();
        final res = await dio
            .get(ApiConst.latLongApi(position.latitude, position.longitude));
        if (res.statusCode == 200) {
          weather = Weather(
            id: res.data['weather'][0]['id'],
            icon: res.data['weather'][0]['icon'],
            temp: res.data['current']['temp'],
            name: res.data['timezone'],
            // country: res.data['sys']['country'],
          );
        }
        setState(() {});
      }
    } else {
      Position position = await Geolocator.getCurrentPosition();
      final dio = Dio();
      final res = await dio
          .get(ApiConst.latLongApi(position.latitude, position.longitude));
      if (res.statusCode == 200) {
        weather = Weather(
          id: res.data['current']['weather'][0]['id'],
          icon: res.data['current']['weather'][0]['icon'],
          temp: res.data['current']['temp'],
          name: res.data['timezone'],
          // country: res.data['sys']['country'],
        );
      }
      setState(() {});
    }
  }

  // Шаарлардын АПИси менен иштөөчү фукция
  Future<void> weatherName([String? name]) async {
    final dio = Dio();
    final result = await dio.get(ApiConst.cityName(name ?? 'Бишкек'));
    if (result.statusCode == 200) {
      print(result.data);
      weather = Weather(
        id: result.data['weather'][0]['id'],
        temp: result.data['main']['temp'],
        icon: result.data['weather'][0]['icon'],
        name: result.data['name'],
      );
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    weatherName();
  }

  void bottomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return ListView.builder(
              itemCount: cities.length,
              itemBuilder: (context, index) {
                final city = cities[index];
                return ListTile(
                  title: InkWell(
                    onTap: () {
                      setState(() {
                        weather = null;
                      });
                      weatherName(city);
                      Navigator.pop(context);
                    },
                    child: Card(
                      color: Colors.grey,
                      child: Center(
                        child: Text(
                          city,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              });
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _myAppBar(),
      body: weather == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Center(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/weather.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    NearMeLocation(
                      locationPressed: () async {
                        await weatherLocation();
                      },
                      cityNamePressed: () {
                        bottomSheet();
                      },
                    ),
                    TemperatureWidget(
                      tempText: "${(weather!.temp - 273.1).floorToDouble()}",
                      tempImage:
                          'https://openweathermap.org/img/wn/${weather!.icon}@4x.png',
                    ),
                    CityNameWidget(
                      cityName: weather!.name,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // DetailWeaterCard(
                        //   windSpeed: '${(weather!.speed!).toInt()} '
                        // ),
                        // DetailWeaterCard(
                        //   windSpeed: '${(weather!.speed!).toInt()}',
                        // ),
                        // DetailWeaterCard(
                        //   windSpeed: '${(weather!.speed!).toInt()}',
                        // ),
                        // DetailWeaterCard(
                        //   windSpeed: '${(weather!.speed!).toInt()}',
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
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
