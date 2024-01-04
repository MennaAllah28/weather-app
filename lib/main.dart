import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather/models/weather_model.dart';
import 'views/home_view.dart';
import 'widgets/no_weather_body.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
          builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
                  builder: (context, state) {
                return MaterialApp(
                  theme: ThemeData(
                    primarySwatch: getThemeColor(
                      BlocProvider.of<GetWeatherCubit>(context)
                          .weatherModel
                          ?.weatherCondition,
                    ),
                  ),
                  debugShowCheckedModeBanner: false,
                  home: HomeView(),
                );
              })),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'Sunny':
      return Colors.deepPurple;
    case 'Clear':
      return Colors.green;
    case "Partly cloudy":
      return Colors.brown;
    case 'Cloudy':
      return Colors.indigo;
    case 'Overcast':
      return Colors.blueGrey;
    case 'Mist':
      return Colors.orange;
    case 'Patchy rain possible':
      return Colors.lightGreen;
    case 'Patchy snow possible':
      return Colors.pink;
    case 'Patchy sleet possible':
    case 'Patchy freezing drizzle possible':
      return Colors.cyan;
    case 'Thundery outbreaks possible':
    case 'Blowing snow':
    case 'Blizzard':
    case 'Fog':
    case 'Freezing fog':
      return Colors.deepPurple;
    case 'Patchy light drizzle':
    case 'Light drizzle':
    case 'Freezing drizzle':
    case 'Heavy freezing drizzle':
    case 'Patchy light rain':
      return Colors.indigo;
    case 'Light rain':
    case 'Moderate rain at times':
    case 'Moderate rain':
    case 'Heavy rain at times':
    case 'Heavy rain':
    case 'Light freezing rain':
      return Colors.lime;
    case 'Moderate or heavy freezing rain':
    case 'Light sleet':
    case 'Moderate or heavy sleet':
    case 'Patchy light snow':
    case 'Light snow':
      return Colors.teal;
    case 'Patchy moderate snow':
    case 'Moderate snow':
    case 'Patchy heavy snow':
    case 'Heavy snow':
    case 'Ice pellets':
      return Colors.amber;
    case 'Light rain shower':
    case 'Moderate or heavy rain shower':
    case 'Torrential rain shower':
    case 'Light sleet showers':
    case 'Moderate or heavy sleet showers':
      return Colors.pink;
    case 'Light snow showers':
    case 'Moderate or heavy snow showers':
    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
    case 'Patchy light rain with thunder':
      return Colors.purple;
    case 'Moderate or heavy rain with thunder':
    case 'Patchy light snow with thunder':
    case 'Moderate or heavy snow with thunder':
      return Colors.yellow;
    default:
      return Colors.lightBlue;
  }
}
