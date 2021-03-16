class Day{
  final DateTime dayName;
  final String title ;
  final String description;
  final String iconUrl;
  final int temp;
  final int minTemp;
  final int maxTemp;
  final DateTime sunset;
  final DateTime sunrise;
  final int pressure;
  final int humidity;
  final double wind;
  Day({this.pressure,this.wind,this.humidity,this.title,this.minTemp,this.maxTemp,this.dayName,this.description,this.iconUrl,this.temp,this.sunrise,this.sunset});
  factory Day.fromJson(Map<String, dynamic>jsonData){
    return Day(
      dayName: DateTime.fromMillisecondsSinceEpoch(jsonData['dt'] * 1000, isUtc: false),
      sunset: DateTime.fromMillisecondsSinceEpoch(jsonData['dt'] * 1000, isUtc: false),
      sunrise: DateTime.fromMillisecondsSinceEpoch(jsonData['dt'] * 1000, isUtc: false),
      title: jsonData['weather'][0]['main'],
      description: jsonData['weather'][0]['description'],
      iconUrl: jsonData['weather'][0]['icon'],
      temp: jsonData['main']['temp'].round(),
      maxTemp: jsonData['main']['temp_max'].round(),
      minTemp: jsonData['main']['temp_min'].round(),
      pressure: jsonData['main']['pressure'],
      humidity: jsonData['main']['humidity'],
      wind:jsonData['wind']['speed']
    );
  }
}