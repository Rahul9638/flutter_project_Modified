import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_using_bloc/events/weather_event.dart';
import 'package:weather_app_using_bloc/models/weather.dart';
import 'package:weather_app_using_bloc/repositories/weather_repository.dart';
import 'package:weather_app_using_bloc/states/weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc({required this.weatherRepository})
      : super(WeatherStateInitial()) {
    on<WeatherEvent>((weatherEvent, emit) async {
      if (weatherEvent is WeatherEventRequested) {
        emit(WeatherStateLoading());
        try {
          // print("Checking for weather Bloc ${weatherEvent.city}");
          final Weather weather =
              await weatherRepository.getWeatherFromCity(weatherEvent.city);
          print("Checking for weather Bloc ${weather}");
          emit(WeatherStateSuccess(weather: weather));
        } catch (exception) {
          emit(WeatherStateFailure());
        }
      } else if (weatherEvent is WeatherEventRefresh) {
        emit(WeatherStateLoading());
        try {
          final Weather weather =
              await weatherRepository.getWeatherFromCity(weatherEvent.city);
          emit(WeatherStateSuccess(weather: weather));
        } catch (exception) {
          emit(WeatherStateFailure());
        }
      }
    });
  }

  // @override
  // Stream<WeatherState> mapEventToState(WeatherEvent weatherEvent) async*{
  //   if(weatherEvent is WeatherEventRequested){
  //     yield WeatherStateLoading();
  //     try {
  //       final Weather weather = await weatherRepository.getWeatherFromCity(weatherEvent.city);
  //       yield WeatherStateSuccess(weather: weather);

  //     }
  //     catch (exception){
  //       yield WeatherStateFailure();
  //     }

  //   } else if(weatherEvent is WeatherEventRefresh){
  //     yield WeatherStateLoading();
  //     try {
  //       final Weather weather = await weatherRepository.getWeatherFromCity(weatherEvent.city);
  //       yield WeatherStateSuccess(weather: weather);

  //     }
  //     catch (exception){
  //       yield WeatherStateFailure();
  //     }
  //   }
  // }

}
