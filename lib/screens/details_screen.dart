import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/widgets/current_weather_view.dart';

class Details extends StatelessWidget {
  final String city;
  final String temp;
  final String maxTemp;
  final String minTemp ;
  final String iconUrl;
  final String description;
  final String willaya;
  final Function onTapLocation;
  final Function onTapSearch;
  final DateTime sunset;
  final DateTime sunrise ;
  final String wallpaper;
  final String wind;
  final String humidity;
  final String pressure;

  Details(
      {this.onTapLocation,
        this.humidity,
        this.pressure,
        this.wind,
        this.maxTemp,
        this.minTemp,
        this.sunset,
        this.sunrise,
        this.onTapSearch,
        this.willaya,
        this.description,
        this.city,
        this.temp,
        this.iconUrl,
        this.wallpaper
      });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/$wallpaper.jpg'),
              fit: BoxFit.fill
          )
      ),
      child:Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  CurrentWeatherView(
                    city: city,
                    willaya: '  ',
                    temp:temp,
                    description: description,
                    iconUrl: iconUrl,
                    sunrise: sunrise,
                    sunset: sunset,
                    maxTemp: maxTemp.toString(),
                    minTemp: minTemp.toString(),

                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.4,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                   Column(
                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                     crossAxisAlignment: CrossAxisAlignment.center,
                     children: [
                       Text('Pressure',
                       style: TextStyle(color: Colors.white,
                           fontSize: 24
                       ),
                       ),
                       Image.asset('images/pressure.png',
                         height: 50,
                         width: 50,
                         color: Colors.white,),
                       Text('$pressure hPa',
                         style: TextStyle(
                             color: Colors.white,
                             fontSize: 20
                         ),
                       ),
                     ],
                   ) ,
                   VerticalDivider(
                     color: Colors.white,
                   ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Humidity',
                          style: TextStyle(color: Colors.white,
                              fontSize: 24
                          ),
                        ),
                        Image.asset('images/humidity.png',
                          height: 50,
                          width: 50,
                          color: Colors.white,),
                        Text('$humidity %',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20
                          ),
                        ),
                      ],
                    ) ,
                    VerticalDivider(
                          color: Colors.white,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('  Wind  ',
                          style: TextStyle(color: Colors.white,
                              fontSize: 24
                          ),
                        ),
                        Image.asset('images/wind.png',
                          height: 50,
                          width: 50,
                          color: Colors.white,),
                        Text('$wind M/s',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20
                          ),
                        ),
                      ],
                    ) ,

                  ],
                ),
                 ),
              ),

          ],
        ),
      ),
    );
  }
}
