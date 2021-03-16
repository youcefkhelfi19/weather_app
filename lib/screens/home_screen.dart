import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/current_model.dart';
import 'package:weather_app/models/day.dart';
import 'package:weather_app/screens/details_screen.dart';
import 'package:weather_app/view_model/view_model.dart';
import 'package:weather_app/widgets/current_weather_view.dart';
import 'package:weather_app/widgets/weather_day_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CurrentData currentData = CurrentData();
  List<Day> daysWeather = [];
  bool _isLoading = false;
  String wallpaper = 'def';
  String cityName;
  void getAll() async {
    setState(() {
      _isLoading = true;
    });
    await Provider.of<ViewModel>(context,listen:false).getCurrentDays();
    await Provider.of<ViewModel>(context, listen: false).getCurrent();
    var currentWeather = Provider.of<ViewModel>(context, listen: false).current;
    setState(() {
      daysWeather = Provider.of<ViewModel>(context, listen: false).listCurrentDaysWeather;
      currentData = CurrentData.fromJson(currentWeather);
      wallpaper = currentData.iconUrl;
      _isLoading = false;
    });
  }
  void getAllCity() async {
    setState(() {
      _isLoading = true;
    });
    await Provider.of<ViewModel>(context,listen:false).getCityDays(cityName);
    await Provider.of<ViewModel>(context, listen: false).getCityWeather(cityName);
    var currentWeather = Provider.of<ViewModel>(context, listen: false).cityWeather;
    setState(() {
      daysWeather = Provider.of<ViewModel>(context, listen: false).listDaysWeather;
      currentData = CurrentData.fromJson(currentWeather);
      wallpaper = currentData.iconUrl;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    getAll();
    super.initState();
  }
  GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/$wallpaper.jpg'), fit: BoxFit.fill)),
      child: _isLoading == true
          ? Scaffold(
              backgroundColor: Colors.transparent,
              body: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.transparent,
              body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        CurrentWeatherView(
                          city: currentData.cityName,
                          willaya: '  ',
                          temp: currentData.temp.toString(),
                          description: currentData.description,
                          iconUrl: currentData.iconUrl,
                          sunrise: currentData.sunrise,
                          sunset: currentData.sunset,
                          maxTemp: currentData.maxTemp.toString(),
                          minTemp: currentData.minTemp.toString(),
                          onTapLocation: () async {
                            getAll();
                          },
                          onTapSearch: () async {
                            showDialog(context: context, builder: (context){
                              return Dialog(
                                backgroundColor: Colors.white38,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  height: 200,
                                  child: Form(
                                    key: _formKey,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        TextFormField(
                                          style: TextStyle(
                                              fontSize:18,
                                              color: Colors.black38
                                          ),
                                          decoration: InputDecoration(
                                            hintText: 'Type city name',
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.black38,
                                                  width: 5.0),
                                            ),
                                            filled: true,
                                            fillColor: Colors.grey,

                                          ),
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return 'Type city name';
                                            }
                                            return null;
                                          },
                                          onSaved: (value){
                                            cityName = value;
                                          },

                                        ),
                                        MaterialButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          onPressed:(){
                                            if(_formKey.currentState.validate()){
                                              _formKey.currentState.save();
                                              getAllCity();
                                              Navigator.pop(context);
                                            }
                                          },
                                          child: Text('Find',
                                            style: TextStyle(
                                                color: Colors.white38,
                                                fontSize: 20
                                            ),
                                          ),
                                          color: Colors.black54,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40),
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: daysWeather.length,
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 200,
                            child: VerticalDivider(
                              width: 4,
                              color: Colors.white,
                            ),
                          );
                        },
                        itemBuilder: (context, index) {
                          return WeatherDayCard(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Details(
                                    city:currentData.cityName ,
                                    willaya: '  ',
                                    temp: daysWeather[index].temp.toString(),
                                    description: daysWeather[index].description,
                                    iconUrl: daysWeather[index].iconUrl,
                                    wallpaper: daysWeather[index].iconUrl,
                                    sunrise: daysWeather[index].sunrise,
                                    sunset: daysWeather[index].sunset,
                                    maxTemp: daysWeather[index].maxTemp.toString(),
                                    minTemp: daysWeather[index].minTemp.toString(),
                                    pressure: daysWeather[index].pressure.toString(),
                                    wind: daysWeather[index].wind.toString(),
                                    humidity: daysWeather[index].humidity.toString(),
                                  ),
                                ),
                              );
                            },
                            temp: daysWeather[index].temp,
                            title: daysWeather[index].title,
                            iconUrl: daysWeather[index].iconUrl,
                            dayName: daysWeather[index].dayName,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
