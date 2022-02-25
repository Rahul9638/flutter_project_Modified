import 'package:equatable/equatable.dart';
import 'package:weather_app_using_bloc/models/weather.dart';

abstract class WeatherState extends Equatable{
  const WeatherState();
  List<Object> get props => [];
}

class WeatherStateInitial extends WeatherState {}
class WeatherStateLoading extends WeatherState{}
class WeatherStateSuccess extends WeatherState{
  
  final Weather weather;  
  const WeatherStateSuccess({required this.weather});
  @override 

  List<Object> get props => [weather];
}

class WeatherStateFailure extends WeatherState{}