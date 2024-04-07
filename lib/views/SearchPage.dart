import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weitherModel.dart';
import 'package:weather_app/providers/WeitherProvider.dart';
import 'package:weather_app/services/WeitherService.dart';


class SearchPage extends StatelessWidget {

  //VoidCallback? updateUI;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a city '),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onSubmitted: (value) async{
              WeitherService weitherService = WeitherService();
              WeitherModel weither =await weitherService.getWeither(cityName: value);
              Provider.of<WeitherProvider>(context,listen: false).weither = weither;
              //updateUI!();
              Navigator.pop(context);
            },
            decoration: const InputDecoration(
              hintText: 'Enter a city name',
              border: OutlineInputBorder(),
              labelText: 'Search',
              suffixIcon: Icon(Icons.search),
              contentPadding: EdgeInsets.all(20),
            ),
          ),
        ),
      ),
    );
  }
}
