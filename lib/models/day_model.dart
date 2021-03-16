class DayOff {
  final DateTime date;
  final String cityName;
  final String description;
  final String iconUrl;
  final int temp;
  final int minTemp;
  final String title;
  final int maxTemp;
  final DateTime sunset;
  final DateTime sunrise;
  final double wind;
  final int humidity;
  final int pressure;

  DayOff(
      {this.humidity,
      this.pressure,
      this.wind,
      this.title,
      this.minTemp,
      this.maxTemp,
      this.date,
      this.cityName,
      this.description,
      this.iconUrl,
      this.temp,
      this.sunrise,
      this.sunset});
  factory DayOff.fromJson(Map<String, dynamic> jsonData) {
    return DayOff(
      date: DateTime.fromMillisecondsSinceEpoch(jsonData['dt'] * 1000,
          isUtc: false),
      description: jsonData['weather'][0]['description'],
      iconUrl: jsonData['weather'][0]['icon'],
      title: jsonData['weather'][0]['main'],
      temp: jsonData['temp']['day'].round(),
      maxTemp: jsonData['temp']['max'].round(),
      minTemp: jsonData['temp']['min'].round(),
      wind: jsonData['wind_speed'],
      humidity: jsonData['humidity'],
      pressure: jsonData['pressure'],
      sunrise: DateTime.fromMillisecondsSinceEpoch(jsonData['sunrise'] * 1000,
          isUtc: false),
      sunset: DateTime.fromMillisecondsSinceEpoch(jsonData['sunset'] * 1000,
          isUtc: false),
    );
  }
}
