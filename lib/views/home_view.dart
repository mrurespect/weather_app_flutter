import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

import '../models/weitherModel.dart';
import '../providers/WeitherProvider.dart';
import 'SearchPage.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  void updateUI() {
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    WeitherModel? weither =Provider.of<WeitherProvider>(context).weither ;
    return Scaffold(
      appBar: AppBar(
        title:  const Text('Weather App'),
        backgroundColor: Colors.limeAccent,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  SearchPage(),
                  )
              );
            },
            icon: const Icon(Icons.search),
          ),],
      ),
      body: weither == null ? const NoWeatherBody() : WeatherInfoBody(),
    );
  }
}
