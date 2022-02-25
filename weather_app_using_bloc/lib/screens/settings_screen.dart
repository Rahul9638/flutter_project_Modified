import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_using_bloc/bloc/settings_bloc.dart';
import 'package:weather_app_using_bloc/events/setting_event.dart';
import 'package:weather_app_using_bloc/states/setting_state.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: ListView(
        children: [
          BlocBuilder<SettingsBloc, SettingsState>(
              builder: (context, settingState) {
            return ListTile(
              title: Text("Temperature Unit"),
              isThreeLine: true,
              subtitle: Text(
                  settingState.temperatureUnit == TemperatureUnit.celsius
                      ? "Celsius"
                      : "Fahrenheit"),
              trailing: Switch(
                value: settingState.temperatureUnit == TemperatureUnit.celsius,
                onChanged: (_) => BlocProvider.of<SettingsBloc>(context)
                    .add(SettingsEventToggleUnit()),
              ),
            );
          })
        ],
      ),
    );
  }
}
