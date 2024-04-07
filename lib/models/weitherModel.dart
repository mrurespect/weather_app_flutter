class WeitherModel{
  String date;
  double temp;
  double minTemp;
  double maxTemp;
  String image;
  String weitherStateName;
  String cityName;

  WeitherModel(
      {required this.date,
      required this.temp,
      required this.minTemp,
      required this.maxTemp,
      required this.image,
      required this.weitherStateName,
      required this.cityName
      });

  factory WeitherModel.fromJson(Map<String,dynamic> data){
    var jsonData= data['forecast']['forecastday'][0];
    return WeitherModel(
      date: data['location']['localtime'],
      temp: data['current']['temp_c'],
      minTemp: jsonData['day']['mintemp_c'],
      maxTemp: jsonData['day']['maxtemp_c'],
      image: 'https:'+data['current']['condition']['icon'],
      weitherStateName: data['current']['condition']['text'],
      cityName: data['location']['name']
    );
  }

  @override
  String toString() {
    return 'WeitherModel{cityName: $cityName ,date: $date, temp: $temp, minTemp: $minTemp, maxTemp: $maxTemp, image: $image, weitherStateName: $weitherStateName';
  }
}