import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/weather_model.dart';
import '../../data/weather_service.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit({required this.service}) : super(WeatherInitial());
  final WeatherService service;
  Future<void> getData() async {
    final data = await service.getWeatherData();
    emit(LoadingState());
    if (data != null) {
      emit(SuccessState(weatherModel: data));
    } else {
      emit(const ErrorState(text: 'ERROR DATA'));
    }
  }
}
