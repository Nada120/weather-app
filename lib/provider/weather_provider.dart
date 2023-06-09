import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';

class WeatherProvider extends ChangeNotifier{
  Weather? _weatherData;
  String? city;
  
  set weatherData (Weather? weatherData) {
    _weatherData = weatherData;
    notifyListeners();
  }

  Weather? get weatherData => _weatherData;
}