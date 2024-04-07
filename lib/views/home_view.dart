import 'package:flutter/material.dart';
import 'package:weather_app/widgets/no_weather_body.dart';

import '../widgets/weather_info_body.dart';
import 'SearchPage.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text('Weather App'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchPage(),
                  )
              );
            },
            icon: const Icon(Icons.search),
          ),],
      ),
      body:  const NoWeatherBody(),
    );
  }
}
