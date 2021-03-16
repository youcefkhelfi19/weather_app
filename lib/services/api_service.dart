import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:weather_app/models/day.dart';
import 'package:weather_app/models/forecast.dart';
class ApiService{

  Future fetchCurrentCityWeather()async{
    try{
      http.Response response = await http.get('https://api.openweathermap.org/data/2.5/weather?lat=36.1898&lon=5.4108&appid=3a1c2ab39359221a3517276b745deb39&units=metric');
      if(response.statusCode == 200) {
        var data = response.body;
        return jsonDecode(data);
      }else{
        print(response.statusCode);
      }
    }catch(e){
      print(e);
    }
  }


  Future<List<Day>> fetchForecastCurrentCityWeather()async {

    try{
      http.Response response = await http.get('https://api.openweathermap.org/data/2.5/forecast?lat=36.1898&lon=5.4108&exclude=hourly&appid=3a1c2ab39359221a3517276b745deb39&units=metric');
      if(response.statusCode == 200){
        var data = response.body;
        var jsonData = jsonDecode(data);
        Forecast days = Forecast.fromJson(jsonData);
        List<Day> weatherDays =
        days.dataList.map((element) => Day.fromJson(element)).toList();
        return weatherDays;
      }else{

        print(response.statusCode.toString());
        return null;
      }
    }catch(e){
      return e;
    }
  }
  Future fetchCityWeather(String city)async{
    try{
      http.Response response = await http.get('https://api.openweathermap.org/data/2.5/weather?q=alger&appid=3a1c2ab39359221a3517276b745deb39&units=metric');
      if(response.statusCode == 200) {
        var data = response.body;
        return jsonDecode(data);
      }else{
        print(response.statusCode);
      }
    }catch(e){
      print(e);
    }
  }
  Future<List<Day>> fetchForecastCityWeather(String city)async {

    try{
      http.Response response = await http.get('https://api.openweathermap.org/data/2.5/forecast?q=alger&exclude=hourly&appid=3a1c2ab39359221a3517276b745deb39&units=metric');
      if(response.statusCode == 200){
        var data = response.body;
        var jsonData = jsonDecode(data);
        Forecast days = Forecast.fromJson(jsonData);
        List<Day> weatherDays =
        days.dataList.map((element) => Day.fromJson(element)).toList();
        return weatherDays;
      }else{

        print(response.statusCode.toString());
        return null;
      }
    }catch(e){
      return e;
    }
  }
}

