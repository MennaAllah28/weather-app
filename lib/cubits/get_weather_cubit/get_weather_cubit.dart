import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather/models/weather_model.dart';

import '../../services/weather_services.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherIntialState());

//حعمل function احط فيها ال logic
//علشان اقول لل Ui انا جبت البيانات بشكل سليم
  WeatherModel? weatherModel;
  getWeather({required String cityName}) async {
    try {
      weatherModel =
          await WeatherServices(Dio()).getCurrentWeather(cityName: cityName);

// عاوز اخلى ال cubit يقول لل ui عن طريق ال stste اللى بتقول ان في بيانات وصلت ان البيانات وصلت

//عاوز اكلم ال ui

      emit(WeatherLoadedState(weatherModel!));
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
