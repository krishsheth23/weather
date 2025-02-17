import 'package:json_annotation/json_annotation.dart';

part 'forecast.g.dart';

@JsonSerializable()
class Forecast {
  final DateTime date;
  final double minTemp;
  final double maxTemp;
  final String condition;
  final String iconCode;

  Forecast({
    required this.date,
    required this.minTemp,
    required this.maxTemp,
    required this.condition,
    required this.iconCode,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      date: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
      minTemp: json['main']['temp_min'].toDouble(),
      maxTemp: json['main']['temp_max'].toDouble(),
      condition: json['weather'][0]['main'],
      iconCode: json['weather'][0]['icon'],
    );
  }

  String get iconUrl => 'https://openweathermap.org/img/w/$iconCode.png';
}