import 'package:get_it/get_it.dart';
import '../repository/weather_repository.dart';
import '../viewmodels/weather_viewmodel.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  // Register WeatherRepository as a singleton
  locator.registerLazySingleton(() => WeatherRepository());
  
  // Register WeatherViewModel as a factory (new instance each time)
  locator.registerFactory(() => WeatherViewModel(locator<WeatherRepository>()));
}