import 'package:flutter/material.dart';

class WeitherModel{
  String date;
  double temp;
  double minTemp;
  double maxTemp;
  String image;
  String weitherStateName;
  String cityName;

  WeitherModel(
      {required this.date,
      required this.temp,
      required this.minTemp,
      required this.maxTemp,
      required this.image,
      required this.weitherStateName,
      required this.cityName
      });

  factory WeitherModel.fromJson(Map<String,dynamic> data){
    var jsonData= data['forecast']['forecastday'][0];
    return WeitherModel(
      date: data['location']['localtime'],
      temp: data['current']['temp_c'],
      minTemp: jsonData['day']['mintemp_c'],
      maxTemp: jsonData['day']['maxtemp_c'],
      image: 'https:'+data['current']['condition']['icon'],
      weitherStateName: data['current']['condition']['text'],
      cityName: data['location']['name']
    );
  }

  @override
  String toString() {
    return 'WeitherModel{cityName: $cityName ,date: $date, temp: $temp, minTemp: $minTemp, maxTemp: $maxTemp, image: $image, weitherStateName: $weitherStateName';
  }
  Color getColorForWeather() {
    String weatherState = weitherStateName;
    switch (weatherState.toLowerCase()) {
      case 'clear':
        return const Color(0xFF0000FF); // blue
      case 'cloudy':
        return const Color(0xFF808080); // grey
      case 'partly cloudy':
        return const Color(0xFFADD8E6); // light blue
      case 'overcast':
        return const Color(0xFFA9A9A9); // dark grey
      case 'mist':
      case 'fog':
        return const Color(0xFFD3D3D3); // light grey
      case 'drizzle':
      case 'light rain':
        return const Color(0xFFB0E0E6); // light sky blue
      case 'moderate rain':
      case 'heavy rain':
      case 'showers':
      case 'light showers':
      case 'heavy showers':
        return const Color(0xFF4D80FF); // strong blue
      case 'hail':
      case 'sleet':
        return const Color(0xFFC0C0C0); // silver
      case 'light snow':
        return const Color(0xFFFFFFFF); // white
      case 'moderate snow':
      case 'heavy snow':
        return const Color(0xB3FFFFFF); // very light grey
      case 'thunderstorm':
        return const Color(0xFFFFBF00); // amber
      case 'tornado':
        return const Color(0xFFFF0000); // red
      default:
        return Colors.grey; // default grey
    }
  }
}