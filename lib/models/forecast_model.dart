

class ForecastOff{
  final List<dynamic> daysList;
  ForecastOff({this.daysList});
  factory ForecastOff.fromJson(Map<String , dynamic>daysMap){
    return ForecastOff(
      daysList : daysMap['daily'],
    );
  }
}