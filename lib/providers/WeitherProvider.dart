import 'package:flutter/cupertino.dart';
import 'package:weather_app/models/weitherModel.dart';

class WeitherProvider extends ChangeNotifier{
  WeitherModel? _weither ;
  set weither (WeitherModel? weither){
    _weither=weither;
    notifyListeners(); // notify all listeners that use this data  to rebuild the UI , they all have listen = true by default
  }
  WeitherModel? get weither => _weither;
}