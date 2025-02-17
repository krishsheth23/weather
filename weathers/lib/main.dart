import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/service_locator.dart';
import 'viewmodels/weather_viewmodel.dart';
import 'views/weather_screen.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => locator<WeatherViewModel>(),
      child: MaterialApp(
        title: 'Weather App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        darkTheme: ThemeData.dark(
          useMaterial3: true,
        ),
        themeMode: ThemeMode.system,
        home: const WeatherScreen(),
      ),
    );
  }
}