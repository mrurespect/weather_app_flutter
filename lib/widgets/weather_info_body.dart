import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weitherModel.dart';
import 'package:weather_app/providers/WeitherProvider.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    WeitherModel weither =Provider.of<WeitherProvider>(context).weither! ;
    DateTime parsedDateTime;
    try {
      parsedDateTime = DateTime.parse(weither.date);
    } catch (e) {
      parsedDateTime = DateTime.now();
    }
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                weither.getColorForWeather(),
                Colors.orange,
              ],
            ),
          ),
          child: Padding(
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
                'Updated at ${parsedDateTime.hour.toString().padLeft(2, '0')}:${parsedDateTime.minute.toString().padLeft(2, '0')}',
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
                    weither.image,
                    fit: BoxFit.cover,
                    width: 150,
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
        ),
    );
  }


}
