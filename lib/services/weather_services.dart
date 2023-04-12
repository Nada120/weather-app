import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather.dart';

class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = 'ee8952252d8c41609c7213512231104';

  Future<Weather?> getWeather({required String cityName}) async {
    Weather? weather;
    try{
      Uri url = Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);
      weather = Weather.fromJson(data);
    } catch (error) {
      debugPrint('$error');
    }
    return weather;
  } 
}