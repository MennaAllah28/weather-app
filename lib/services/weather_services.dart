import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather/models/weather_model.dart';

class WeatherServices {
  final Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = '499ee52e61c140e5a15231849230611';
  WeatherServices(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
          '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1&aqi=no&alerts=no');

      WeatherModel weatherModel = WeatherModel.forJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String erroMessage = e.response?.data['error']['message'] ??
          'Opps there was an error, try later';
      throw Exception(erroMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('Opps there was an error, try later');
    }
  }
}
