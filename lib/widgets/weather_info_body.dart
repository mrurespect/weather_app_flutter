import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weitherModel.dart';
import 'package:weather_app/providers/WeitherProvider.dart';

class WeatherInfoBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WeitherModel weither =Provider.of<WeitherProvider>(context).weither! ;
    return Scaffold(
      backgroundColor: updateBgColor(weither.weitherStateName),
        body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              weither.cityName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
             Text(
              'updated at ${weither.date}',
              style: const TextStyle(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  "${weither.image}",
                ),
                 Text(
                  "${weither.temp}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                 Column(
                  children: [
                    Text(
                      'Maxtemp: ${weither.maxTemp}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'Mintemp: ${weither.minTemp}',
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 32,
            ),
             Text(
              weither.weitherStateName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color updateBgColor(String weitherStateName) {
    if (weitherStateName == 'Sunny') {
      return Colors.yellow;
    } else if (weitherStateName == 'Rainy') {
      return Colors.blue;
    } else if (weitherStateName == 'Cloudy') {
      return Colors.grey;
    } else if (weitherStateName == 'Snowy') {
      return Colors.white;
    } else if (weitherStateName == 'Windy') {
      return Colors.green;
    } else if (weitherStateName == 'Foggy') {
      return Colors.grey;
    } else if (weitherStateName == 'Thunderstorm') {
      return Colors.black;
    } else if (weitherStateName == 'Hail') {
      return Colors.grey;
    } else if (weitherStateName == 'Tornado') {
      return Colors.black;
    } else if (weitherStateName == 'partly cloudy') {
      return Colors.grey;
    }
    else {
      return Colors.limeAccent;
    }
  }
}
