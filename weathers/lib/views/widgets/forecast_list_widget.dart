import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../models/forecast.dart';

class ForecastListWidget extends StatelessWidget {
  final List<Forecast> forecasts;

  const ForecastListWidget({
    super.key,
    required this.forecasts,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '5-Day Forecast',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: forecasts.length,
            itemBuilder: (context, index) {
              final forecast = forecasts[index];
              return Card(
                margin: const EdgeInsets.only(right: 8),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        DateFormat('EEE').format(forecast.date),
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 4),
                      Image.network(
                        forecast.iconUrl,
                        width: 40,
                        height: 40,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${forecast.maxTemp.round()}°',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Text(
                        '${forecast.minTemp.round()}°',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.grey,
                            ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
