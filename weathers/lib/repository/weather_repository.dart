// ignore_for_file: unused_import

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weathers/models/weather.dart';
import 'package:weathers/models/forecast.dart';
import 'package:weathers/config/api_config.dart';

class WeatherRepository {
  final String apiKey = ApiConfig.openWeatherMapKey;
  final String baseUrl = 'https://api.openweathermap.org/data/2.5';

  Future<Weather> fetchWeather(String city) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/weather?q=$city&appid=$apiKey&units=metric'),
      );

      if (response.statusCode == 200) {
        return Weather.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load weather data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching weather: $e');
    }
  }

  Future<List<Forecast>> fetchForecast(String city) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/forecast?q=$city&appid=$apiKey&units=metric'),
      );
      
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> forecastList = data['list'];
        
        Map<String, Forecast> dailyForecasts = {};
        
        for (var item in forecastList) {
          final DateTime date = DateTime.fromMillisecondsSinceEpoch(item['dt'] * 1000);
          final String dayKey = '${date.year}-${date.month}-${date.day}';
          
          if (!dailyForecasts.containsKey(dayKey) && date.hour >= 11 && date.hour <= 13) {
            dailyForecasts[dayKey] = Forecast.fromJson(item);
          }
        }
        
        return dailyForecasts.values.toList();
      } else {
        throw Exception('Failed to load forecast: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching forecast: $e');
    }
  }
}