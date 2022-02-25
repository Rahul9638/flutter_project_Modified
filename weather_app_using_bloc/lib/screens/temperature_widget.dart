import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_using_bloc/models/weather.dart';

import '../bloc/settings_bloc.dart';
import '../bloc/theme_bloc.dart';
import '../states/setting_state.dart';

class TemperatureWidget extends StatelessWidget {
  final Weather weather;
  const TemperatureWidget({Key? key, required this.weather}) : super(key: key);
  // Convert celcius to faharenheit
  int _toFahrenheit(double celsius) => ((celsius * 9 / 5) + 32).round();
  String _formattedTemperature(double temp, TemperatureUnit temperatureUnit) =>
      temperatureUnit == TemperatureUnit.fahrenheit
          ? "${_toFahrenheit(temp)}°F"
          : "${temp.round()}°C";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              child: BlocBuilder<SettingsBloc, SettingsState>(
                  builder: (context, settingState) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Min temp: ${_formattedTemperature(weather.minTemp, settingState.temperatureUnit)}",
                      style: TextStyle(
                          fontSize: 18,
                          color: BlocProvider.of<ThemeBloc>(context)
                              .state
                              .textColor),
                    ),
                    Text(
                      " Temp: ${_formattedTemperature(weather.temp, settingState.temperatureUnit)}",
                      style: TextStyle(
                          fontSize: 18,
                          color: BlocProvider.of<ThemeBloc>(context)
                              .state
                              .textColor),
                    ),
                    Text(
                      "Max temp: ${_formattedTemperature(weather.maxTemp, settingState.temperatureUnit)}",
                      style: TextStyle(
                          fontSize: 18,
                          color: BlocProvider.of<ThemeBloc>(context)
                              .state
                              .textColor),
                    ),
                  ],
                );
              }),
            ),
          ],
        )
      ],
    );
  }
}
