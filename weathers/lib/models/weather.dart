import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather {
  final String cityName;
  final double temperature;
  final int humidity;
  final double windSpeed;
  final String condition;
  final String iconCode;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.humidity,
    required this.windSpeed,
    required this.condition,
    required this.iconCode,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      humidity: json['main']['humidity'],
      windSpeed: json['wind']['speed'].toDouble(),
      condition: json['weather'][0]['main'],
      iconCode: json['weather'][0]['icon'],
    );
  }

  String get iconUrl => 'https://openweathermap.org/img/w/$iconCode.png';
}