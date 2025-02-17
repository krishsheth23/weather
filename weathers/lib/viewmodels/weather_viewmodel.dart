import 'package:flutter/foundation.dart';
import '../models/weather.dart';
import '../models/forecast.dart';
import '../repository/weather_repository.dart';

enum WeatherState { initial, loading, loaded, error }

class WeatherViewModel extends ChangeNotifier {
  final WeatherRepository _repository;
  
  WeatherState _state = WeatherState.initial;
  Weather? _weather;
  List<Forecast>? _forecast;
  String? _error;
  String _city = '';

  WeatherViewModel(this._repository);

  // Getters
  WeatherState get state => _state;
  Weather? get weather => _weather;
  List<Forecast>? get forecast => _forecast;
  String? get error => _error;
  String get city => _city;

  Future<void> fetchWeatherData(String city) async {
    try {
      _state = WeatherState.loading;
      _city = city;
      _error = null;
      notifyListeners();

      // Fetch current weather and forecast
      final weatherResult = await _repository.fetchWeather(city);
      final forecastResult = await _repository.fetchForecast(city);

      _weather = weatherResult;
      _forecast = forecastResult;
      _state = WeatherState.loaded;
    } catch (e) {
      _state = WeatherState.error;
      _error = e.toString();
    } finally {
      notifyListeners();
    }
  }

  void reset() {
    _state = WeatherState.initial;
    _weather = null;
    _forecast = null;
    _error = null;
    _city = '';
    notifyListeners();
  }
}
