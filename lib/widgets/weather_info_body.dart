import 'package:flutter/material.dart';
import 'package:weather/models/weather_model.dart';

import '../main.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weatherModel});

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
        getThemeColor(weatherModel.weatherCondition),
        getThemeColor(weatherModel.weatherCondition)[300]!,
        getThemeColor(weatherModel.weatherCondition)[50]!,
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Spacer(
            flex: 3,
          ),
          Text(
            weatherModel.cityName,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'updated at ${weatherModel.date.hour}:${weatherModel.date.minute}',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.network(weatherModel.image!),
              Text(
                weatherModel.temp.toString(),
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: [
                  Text(
                    'Maxtemp: ${weatherModel.maxTemp}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'mintemp: ${weatherModel.minTemp}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
          Spacer(),
          Text(
            weatherModel.weatherCondition,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(
            flex: 5,
          ),
        ]),
      ),
    );
  }
}
