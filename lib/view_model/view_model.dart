import 'package:flutter/cupertino.dart';
import 'package:weather_app/models/day.dart';
import 'package:weather_app/services/api_service.dart';

class ViewModel extends ChangeNotifier{
  List<Day> _listCurrentDaysWeather = [];
  List<Day> _listCityDaysWeather = [];
  var _current ;
  var _cityWeather;
  Future<void> getCurrent()async{
    _current = await ApiService().fetchCurrentCityWeather();
    notifyListeners();
  }
  Future<void> getCityWeather(String city )async{
    _cityWeather = await ApiService().fetchCityWeather(city);
    notifyListeners();
  }

  Future<void> getCurrentDays ()async{
    _listCurrentDaysWeather = await ApiService().fetchForecastCurrentCityWeather();
    notifyListeners();
  }
  Future<void> getCityDays (String city)async{
    _listCityDaysWeather = await ApiService().fetchForecastCityWeather(city);
    notifyListeners();
  }
  List<Day>get  listCurrentDaysWeather {
    return _listCurrentDaysWeather;
  }
  List<Day>get  listDaysWeather {
    return _listCityDaysWeather;
  }

  get current {
    return _current;
  }
  get cityWeather {
    return _cityWeather;
  }
}