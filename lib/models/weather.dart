import 'package:flutter/material.dart';

class Weather {
  String date;
  double temp;
  double maxTemp;
  double minTemp;
  String weatherStateName;
  
  Weather({
    required this.date,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.weatherStateName
  });

  factory Weather.fromJson(dynamic json) {
    
    var forecast = json['forecast']['forecastday'][0];

    return Weather(
      date: forecast['date'], 
      temp: forecast['day']['avgtemp_c'], 
      maxTemp: forecast['day']['maxtemp_c'], 
      minTemp: forecast['day']['mintemp_c'], 
      weatherStateName: forecast['day']['condition']['text'],
    );
  }
  
  String getImage() {
    switch(weatherStateName) {
      case 'Thunderstorm': return 'assets/images/thunderstorm.gif';
      case 'Heavy rain': return 'assets/images/rainy.gif';
      case 'Light rain': return 'assets/images/rainy.gif';
      case 'Patchy rain possible': return 'assets/images/rainy.gif';
      case 'Moderate rain': return 'assets/images/rainy.gif';
      case 'Heavy cloud': return 'assets/images/cloudy.gif';
      case 'Light cloud': return 'assets/images/cloudy.gif';
      case 'Partly cloudy': return 'assets/images/cloudy.gif';
      case 'snow': return 'assets/images/snow.gif';
      case 'Heavy snow': return 'assets/images/snow.gif';
      default: return 'assets/images/sunny.gif';
    }
  }

  @override
  String toString() {
    return 'date $date, temp $temp, maxTemp $maxTemp, minTem $minTemp, weatherState $weatherStateName';
  }
}