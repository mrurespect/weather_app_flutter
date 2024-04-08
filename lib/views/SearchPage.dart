import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weitherModel.dart';
import 'package:weather_app/providers/WeitherProvider.dart';
import 'package:weather_app/services/WeitherService.dart';


class SearchPage extends StatelessWidget {
   SearchPage({super.key});
  String value = '';


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
            onChanged: (value) {
              this.value = value;
            },
            onSubmitted: (value) async{
              await showHomeView(context, value);
            },
            decoration:  InputDecoration(
              hintText: 'Enter a city name',
              border: OutlineInputBorder(),
              labelText: 'Search',
              suffixIcon: IconButton(
                onPressed: () async {
                  await showHomeView(context, value);
                },
                icon: const Icon(Icons.search),
              ),
              contentPadding: EdgeInsets.all(20),
            ),
          ),
        ),
      ),
    );
  }

 Future<void> showHomeView(BuildContext context ,String value) async {
    WeitherService weitherService = WeitherService();
    WeitherModel weither = await weitherService.getWeither(cityName: value);
    Provider.of<WeitherProvider>(context, listen: false).weither = weither;
    Navigator.pop(context);
  }
}

