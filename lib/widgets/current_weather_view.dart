import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/widgets/custom_appbare.dart';
import '../constants.dart';


class CurrentWeatherView extends StatelessWidget {
  final String city;
  final String temp;
  final String maxTemp;
  final String minTemp ;
  final String iconUrl;
  final String description;
  final String willaya;
  final Function onTapLocation;
  final Function onSaved;
  final Function onTapSearch;
  final DateTime sunset;
  final DateTime sunrise ;
  CurrentWeatherView(
      {this.onTapLocation,
        this.maxTemp,
        this.minTemp,
       this.sunset,
       this.sunrise,
      this.onTapSearch,
      this.willaya,
      this.description,
      this.city,
      this.temp,
      this.onSaved,
      this.iconUrl});
  final DateFormat dateFormat = DateFormat('jm');
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 0, left: 10, right: 10, bottom: 10),
      margin: EdgeInsets.only(top: 40, right: 10, left: 10),
      decoration: BoxDecoration(
          color: Colors.transparent, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      CustomAppBar(
        onTapSearch: onTapSearch,
        onTapLocation: onTapLocation,
      ),

          Row(
            children: [
              RichText(
                  text: TextSpan(children: [
                TextSpan(
                  text: '$city ',
                  style: TextStyle(
                      fontSize: 45,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                TextSpan(
                    text: '$willaya',
                    style: TextStyle(fontSize: 20, color: Colors.white))
              ])),
            ],
          ),
          Row(
            children: [
              Container(
                color: Colors.transparent,
                height: 40,
                width: 40,
                child: Image(
                  image: NetworkImage('http://openweathermap.org/img/wn/$iconUrl.png'),
                  fit: BoxFit.fill,
                ),
              ),
              Text(
                description,
                style: tempStyle,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                '${temp.toString()}°C',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 100,
                    fontWeight: FontWeight.w100),
              ),

              Container(
                width: MediaQuery.of(context).size.width*0.2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('${maxTemp.toString()}°C',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18
                      ),
                    ),

                    SizedBox(
                      width: 40,
                      child: Divider(
                        color: Colors.white,
                      ),
                    ),
                    Text('${minTemp.toString()}°C',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
         Container(
           width: MediaQuery.of(context).size.width*0.4,
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [

               Text('Sunrise: ${dateFormat.format(sunrise)} ',
                 style: TextStyle(
                     color: Colors.white,
                     fontSize: 18
                 ),
               ),
               SizedBox(
                 width: 140,
                 child: Divider(
                   color: Colors.white,
                 ),
               ),
               Text('Sunset : ${dateFormat.format(sunset)} ',
                 style: TextStyle(
                     color: Colors.white,
                     fontSize: 18
                 ),
               ),
             ],
           ),
         )
        ],
      ),
    );
  }
}
