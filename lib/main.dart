import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/WeitherProvider.dart';
import 'package:weather_app/views/home_view.dart';


void main() async{
  runApp( WeatherApp());
}

class WeatherApp extends StatelessWidget {
   WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (BuildContext context) {
        return WeitherProvider();
        },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeView(),
      ),
    );
  }
}

