
import 'package:equatable/equatable.dart';
import 'package:weather_app_using_bloc/models/weather.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class ThemeEventWeatherChanged extends ThemeEvent {
  final WeatherCondition weatherCondition;

  ThemeEventWeatherChanged({required this.weatherCondition}): assert(weatherCondition != null);
  List<Object> get props => [weatherCondition];
}