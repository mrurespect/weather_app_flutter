import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/WeitherProvider.dart';
import 'package:weather_app/views/home_view.dart';


void main() async{
  runApp(
      ChangeNotifierProvider(
          create: (BuildContext context) {
            return WeitherProvider();
          },
          child:const WeatherApp())
  );
}

class WeatherApp extends StatelessWidget {
   const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorSchemeSeed: Colors.red,
        ),
        home: HomeView(),
      );
  }
}

