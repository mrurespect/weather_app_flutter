import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weitherModel.dart';
class WeitherService {
  Future<WeitherModel> getWeither({required String cityName}) async {
    String baseUrl = 'http://api.weatherapi.com/v1';
    String apiKey = const String.fromEnvironment("API_KEY");
    Uri url =(Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7'));
    var response =await http.get(url);
    Map<String,dynamic> data= jsonDecode(response.body);
    WeitherModel weither= WeitherModel.fromJson(data);
    return weither;
  }
}