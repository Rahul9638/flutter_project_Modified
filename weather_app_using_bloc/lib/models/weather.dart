// import 'package:equatable/equatable.dart';

// enum WeatherCondition {
//   snow,
//   sleet,
//   hail,
//   thunderstorm,
//   heavyRain,
//   lightRain,
//   showers,
//   heavyCloud,
//   lightCloud,
//   clear,
//   unknown
// }

// class Weather extends Equatable {
//   final WeatherCondition weatherCondition;
//   final String formatteCondition;
//   final double minTemp;
//   final double temp;
//   final double maxTemp;
//   final int locationId;
//   final String created;
//   final DateTime lastUpdated;
//   final String location;

//   const Weather(
//       {required this.weatherCondition,
//       required this.formatteCondition,
//       required this.minTemp,
//       required this.temp,
//       required this.maxTemp,
//       required this.locationId,
//       required this.created,
//       required this.lastUpdated,
//       required this.location});

//   List<Object> get props=>[
//     weatherCondition,
//     formatteCondition,
//     minTemp,
//     temp,
//     maxTemp,
//     locationId,
//     created,
//     lastUpdated,
//     location
//   ];

//   factory Weather.fromJson(dynamic jsonObject){
//     final consolidatedWeather = jsonObject["consolidated_weather"][0];
//     return Weather(
//       weatherCondition: _mapStringToWeatherCondition(consolidatedWeather["weather_state_abbr"]) ,
//       formatteCondition: consolidatedWeather[""],
//       minTemp: consolidatedWeather["min_temp"] as double,
//       temp: consolidatedWeather["the_temp"] as double,
//       maxTemp: consolidatedWeather["max_temp"] as double,
//       locationId: jsonObject["woeid"] as int, // Where on Earth
//       created: consolidatedWeather["created"],
//       lastUpdated: DateTime.now(),
//       location: jsonObject["title"]


//     );
//   }

//   static WeatherCondition _mapStringToWeatherCondition(String inputString){
//     Map<String, WeatherCondition> map = {
//       "sn" : WeatherCondition.snow,
//       "sl":WeatherCondition.sleet,
//       "h":WeatherCondition.hail,
//       "t":WeatherCondition.thunderstorm,
//       "hr":WeatherCondition.heavyRain,
//       "lr":WeatherCondition.lightRain,
//       "s":WeatherCondition.showers,
//       "hc":WeatherCondition.heavyCloud,
//       "lc": WeatherCondition.lightCloud,
//       "c": WeatherCondition.clear,

//     };
//     return map[inputString] ?? WeatherCondition.unknown;
//   }
// }

import 'package:equatable/equatable.dart';

enum WeatherCondition {
  snow,
  sleet,
  hail,
  thunderstrom,
  heavyRain,
  lightRain,
  showers,
  heavyCloud,
  lightCloud,
  clear,
  unkown
}

class Weather extends Equatable {
  final WeatherCondition weatherCondition;
  final String formattedCondition;
  final double minTemp;
  final double temp;
  final double maxTemp;
  final int locationId;
  final String created;
  final DateTime lastUpdated;
  final String location;

  const Weather({
    required this.weatherCondition,
    required this.formattedCondition,
    required this.minTemp,
    required this.temp,
    required this.maxTemp,
    required this.locationId,
    required this.created,
    required this.lastUpdated,
    required this.location,
  });

  @override
  // TODO: implement props
  List<Object> get props => [
        weatherCondition,
        formattedCondition,
        minTemp,
        temp,
        maxTemp,
        locationId,
        created,
        lastUpdated,
        location,
      ];

//convert from JSON to Weather object

// "consolidated_weather": [
//         {
//             "id": 5236769747369984,
//             "weather_state_name": "Light Rain",
//             "weather_state_abbr": "lr",
//             "wind_direction_compass": "NW",
//             "created": "2022-02-23T04:03:19.565316Z",
//             "applicable_date": "2022-02-22",
//             "min_temp": -4.57,
//             "max_temp": 7.175,
//             "the_temp": -1.3650000000000002,
//             "wind_speed": 8.318539973445743,
//             "wind_direction": 312.0,
//             "air_pressure": 1020.0,
//             "humidity": 73,
//             "visibility": 14.926578779925237,
//             "predictability": 75
//         },
  factory Weather.fromJson(dynamic jsonObject) {
    final consolidatedWeather = jsonObject['consolidated_weather'][0];
    return Weather(
        weatherCondition: _mapStringToWeatherCondition(
            consolidatedWeather['weather_state_abbr']),
        formattedCondition: consolidatedWeather['weather_state_name'] ?? '',
        minTemp: consolidatedWeather['min_temp'] as double,
        temp: consolidatedWeather['the_temp'] as double,
        maxTemp: consolidatedWeather['max_temp'] as double,
        locationId:
            jsonObject['woeid'] as int, //where on Earth Identifier = woeid
        created: consolidatedWeather['created'],
        lastUpdated: DateTime.now(),
        location: jsonObject['title']);
  }

  static WeatherCondition _mapStringToWeatherCondition(String inputString) {
    Map<String, WeatherCondition> map = {
      'sn': WeatherCondition.snow,
      'sl': WeatherCondition.sleet,
      'h': WeatherCondition.hail,
      't': WeatherCondition.thunderstrom,
      'hr': WeatherCondition.heavyRain,
      'lr': WeatherCondition.lightRain,
      's': WeatherCondition.showers,
      'hc': WeatherCondition.heavyCloud,
      'lc': WeatherCondition.lightCloud,
    };
    return map[inputString] ?? WeatherCondition.unkown;
  }
}
