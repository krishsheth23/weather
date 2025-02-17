import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/weather_viewmodel.dart';
import 'widgets/current_weather_widget.dart';
import 'widgets/forecast_list_widget.dart';
import 'widgets/search_bar_widget.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        elevation: 0,
      ),
      body: Consumer<WeatherViewModel>(
        builder: (context, viewModel, child) {
          return RefreshIndicator(
            onRefresh: () async {
              if (viewModel.city.isNotEmpty) {
                await viewModel.fetchWeatherData(viewModel.city);
              }
            },
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SearchBarWidget(),
                    const SizedBox(height: 20),
                    if (viewModel.state == WeatherState.loading)
                      const Center(child: CircularProgressIndicator())
                    else if (viewModel.state == WeatherState.error)
                      Center(
                        child: Text(
                          viewModel.error ?? 'An error occurred',
                          style: const TextStyle(color: Colors.red),
                        ),
                      )
                    else if (viewModel.state == WeatherState.loaded) ...[
                      CurrentWeatherWidget(weather: viewModel.weather!),
                      const SizedBox(height: 20),
                      if (viewModel.forecast != null)
                        ForecastListWidget(forecasts: viewModel.forecast!),
                    ],
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
