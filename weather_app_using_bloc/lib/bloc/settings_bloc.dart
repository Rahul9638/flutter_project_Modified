import 'package:flutter_bloc/flutter_bloc.dart';

import '../events/setting_event.dart';
import '../states/setting_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc()
      : super(SettingsState(temperatureUnit: TemperatureUnit.celsius)) {
    on<SettingsEvent>((settingEvent, emit) async {
      if (settingEvent is SettingsEventToggleUnit) {
        emit(SettingsState(
            temperatureUnit: state.temperatureUnit == TemperatureUnit.celsius
                ? TemperatureUnit.fahrenheit
                : TemperatureUnit.celsius)); 
      }
    });
    // @override
    // Stream<SettingsState> mapEventToState(SettingsEvent settingsEvent) async* {
    //   if (settingsEvent is SettingsEventToggleUnit) {
    //     yield SettingsState(
    //         temperatureUnit: state.temperatureUnit == TemperatureUnit.celsius
    //             ? TemperatureUnit.fahrenheit
    //             : TemperatureUnit.celsius);
    //   }
    // }
  }
}
