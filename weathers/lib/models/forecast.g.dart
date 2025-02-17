// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Forecast _$ForecastFromJson(Map<String, dynamic> json) => Forecast(
      date: DateTime.parse(json['date'] as String),
      minTemp: (json['minTemp'] as num).toDouble(),
      maxTemp: (json['maxTemp'] as num).toDouble(),
      condition: json['condition'] as String,
      iconCode: json['iconCode'] as String,
    );

Map<String, dynamic> _$ForecastToJson(Forecast instance) => <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'minTemp': instance.minTemp,
      'maxTemp': instance.maxTemp,
      'condition': instance.condition,
      'iconCode': instance.iconCode,
    };
