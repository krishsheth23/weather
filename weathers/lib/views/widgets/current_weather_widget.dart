import 'package:flutter/material.dart';
import '../../models/weather.dart';

class CurrentWeatherWidget extends StatelessWidget {
  final Weather weather;

  const CurrentWeatherWidget({
    super.key,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              weather.cityName,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${weather.temperature.round()}°C',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Text(
                      weather.condition,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                Image.network(
                  weather.iconUrl,
                  width: 80,
                  height: 80,
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _WeatherDetail(
                  icon: Icons.water_drop,
                  label: 'Humidity',
                  value: '${weather.humidity}%',
                ),
                _WeatherDetail(
                  icon: Icons.air,
                  label: 'Wind Speed',
                  value: '${weather.windSpeed} m/s',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _WeatherDetail extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _WeatherDetail({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon),
        const SizedBox(height: 4),
        Text(label),
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
