import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/weather_viewmodel.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Enter city name',
        prefixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        filled: true,
      ),
      onSubmitted: (value) {
        if (value.isNotEmpty) {
          context.read<WeatherViewModel>().fetchWeatherData(value);
        }
      },
    );
  }
}
