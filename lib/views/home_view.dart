import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

import '../models/weitherModel.dart';
import '../providers/WeitherProvider.dart';
import 'SearchPage.dart';

class HomeView extends StatefulWidget {
   HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  //void updateUI() {
  //  setState(() {});
  //}
  @override
  Widget build(BuildContext context) {
    WeitherModel? weither =Provider.of<WeitherProvider>(context).weither ;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: weither?.getColorForWeather() ?? Colors.blue,
        title:  const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>   SearchPage(),
                  )
              );
            },
            icon: const Icon(Icons.search),
          ),],
      ),
      body: weither == null ? const NoWeatherBody() : const WeatherInfoBody(),
    );
  }
}
