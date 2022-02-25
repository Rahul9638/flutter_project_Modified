import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_using_bloc/bloc/settings_bloc.dart';
import 'package:weather_app_using_bloc/bloc/theme_bloc.dart';
import 'package:weather_app_using_bloc/bloc/weather_bloc.dart';
import 'package:weather_app_using_bloc/bloc/weather_bloc_observer.dart';
import 'package:weather_app_using_bloc/repositories/weather_repository.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app_using_bloc/screens/weather_screen.dart';

void main() {
  final WeatherRepository weatherRepository =
      WeatherRepository(httpClient: http.Client());
  var blocObserver = WeatherBlocObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(create: (context) => ThemeBloc()),
        BlocProvider<SettingsBloc>(create: (context) => SettingsBloc()),
      ],
      child: MyApp(weatherRepository: weatherRepository),
    ),
  );
}

class MyApp extends StatelessWidget {
  final WeatherRepository weatherRepository;
  const MyApp({Key? key, required this.weatherRepository}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocProvider(
          create: (context) =>
              WeatherBloc(weatherRepository: weatherRepository),
          child: WeatherScreen(),
        ));
  }
}
