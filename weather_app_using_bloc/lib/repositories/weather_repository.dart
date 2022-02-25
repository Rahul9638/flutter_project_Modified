import 'dart:convert';
import '../models/weather.dart';
import 'package:http/http.dart' as http;

const baseUrl = 'https://www.metaweather.com';
// ignore: prefer_function_declarations_over_variables
final locationUrl = (city) => '$baseUrl/api/location/search/?query=$city';
final weatherUrl = (locationId) => '$baseUrl/api/location/$locationId';

class WeatherRepository {
  
  final http.Client httpClient;

  WeatherRepository({required this.httpClient}) : assert(httpClient != null);
  Future<int> getLocationIdFromCity(String city) async {
    final response = await httpClient.get(Uri.parse(locationUrl(city)));
    print("Response Checking ${response.body}");
    if (response.statusCode == 200) {
      final cities = jsonDecode(response.body) as List;
      return (cities.first)["woeid"] ?? {};
    } else {
      throw Exception("Error getting location id of : ${city}");
    }
  }

  // LocationId => Wether
  Future<Weather> fetchWeather(int locationId) async {
    final response = await httpClient.get(Uri.parse(weatherUrl(locationId)));
    // print(".........${response.body}");
    if (response.statusCode != 200) {
      throw Exception("Error getting weather from locationId: ${locationId}");
    }
    print("Location Id Response ${response.body}");
    final weatherJson = jsonDecode(response.body);
    return Weather.fromJson(weatherJson);
  }

  Future<Weather> getWeatherFromCity(String city) async {
    final int locationId = await getLocationIdFromCity(city);
    print("location id $locationId");
    return fetchWeather(locationId);
  }
}
