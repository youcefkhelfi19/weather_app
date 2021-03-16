class Forecast{
  final List<dynamic> dataList;
  Forecast({this.dataList});
  factory Forecast.fromJson(Map<String,dynamic>map){
    return Forecast(
      dataList: map['list'],
    );
  }
}