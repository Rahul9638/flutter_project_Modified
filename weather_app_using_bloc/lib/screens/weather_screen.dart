import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_using_bloc/events/theme_event.dart';
import 'package:weather_app_using_bloc/events/weather_event.dart';
import 'package:weather_app_using_bloc/screens/city_search_screen.dart';
import 'package:weather_app_using_bloc/screens/settings_screen.dart';
import 'package:weather_app_using_bloc/screens/temperature_widget.dart';
import 'package:weather_app_using_bloc/states/theme_state.dart';

import '../bloc/theme_bloc.dart';
import '../bloc/weather_bloc.dart';
import '../states/weather_state.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late Completer<void> _completer;
  @override
  void initState() {
    super.initState();
    _completer = Completer<void>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather App"),
        actions: [
          IconButton(
              onPressed: (() {
                // Navigate to Settings Screen
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SettingScreen()));
              }),
              icon: Icon(Icons.settings)),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              // Navigate to CitySearchScreen
              final typedCity = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CitySearchScreen(),
                ),
              );

              if (typedCity != null) {
                BlocProvider.of<WeatherBloc>(context)
                    .add(WeatherEventRequested(city: typedCity.toString()));
              }
              print("hhh-------------------$typedCity");
            },
          ),
        ],
      ),
      body: Center(
        child: BlocConsumer<WeatherBloc, WeatherState>(
          listener: (BuildContext context, weatherState) {
            if (weatherState is WeatherStateSuccess) {
              print(
                  "printing the weather condition${weatherState.weather.weatherCondition}");
              BlocProvider.of<ThemeBloc>(context).add(ThemeEventWeatherChanged(
                  weatherCondition: weatherState.weather.weatherCondition));
              _completer.complete();
              _completer = Completer();
            }
          },
          builder: (context, weatherState) {
            if (weatherState is WeatherStateLoading) {
              return Center(child: CircularProgressIndicator());
            }
            if (weatherState is WeatherStateSuccess) {
              final weather = weatherState.weather;
              // print("printing the weather condition${weatherState.weather.maxTemp}");
              return BlocBuilder<ThemeBloc, ThemeState>(
                builder: ((context, themeState) {
                  return RefreshIndicator(
                    onRefresh: () {
                      BlocProvider.of<WeatherBloc>(context)
                          .add(WeatherEventRefresh(city: weather.location));
                      return _completer.future;
                    },
                    child: Container(
                      color: themeState.backgroundColor,
                      child: ListView(
                        children: [
                          Column(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    weather.location,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: themeState.textColor),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 2),
                                  ),
                                  Center(
                                    child: Text(
                                      "Updated: ${TimeOfDay.fromDateTime(weather.lastUpdated).format(context)}",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: themeState.textColor),
                                    ),
                                  ),
                                  TemperatureWidget(
                                    weather: weather,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              );
            }
            if (weatherState is WeatherStateFailure) {
              return Text(
                "Something went wrong",
                style: TextStyle(color: Colors.redAccent, fontSize: 16),
              );
            }
            return Center(
              child: Text(
                "Select Your Location first",
                style: TextStyle(fontSize: 30),
              ),
            );
          },
        ),
      ),
    );
  }
}
