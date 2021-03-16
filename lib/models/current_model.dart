class CurrentData {
  final DateTime date ;
  final String cityName;
  final String description;
  final String iconUrl;
  final int temp;
  final int minTemp;
  final int maxTemp;
  final DateTime sunset;
  final DateTime sunrise;
CurrentData({this.minTemp,this.maxTemp,this.date,this.cityName,this.description,this.iconUrl,this.temp,this.sunrise,this.sunset});
  factory CurrentData.fromJson(Map<String,dynamic>jsonData){
    return CurrentData(
        date: DateTime.fromMillisecondsSinceEpoch(jsonData['dt'] * 1000,isUtc: false),
       cityName: jsonData['name'],
      description: jsonData['weather'][0]['description'],
      iconUrl: jsonData['weather'][0]['icon'],
      temp: jsonData['main']['temp'].round(),
      maxTemp: jsonData['main']['temp_max'].round(),
      minTemp: jsonData['main']['temp_min'].round(),
      sunrise:DateTime.fromMillisecondsSinceEpoch(jsonData['sys']['sunrise'] * 1000,isUtc: false),
      sunset: DateTime.fromMillisecondsSinceEpoch(jsonData['sys']['sunset'] * 1000,isUtc: false),
    );
  }
}