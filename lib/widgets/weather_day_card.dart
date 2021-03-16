import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../constants.dart';

class WeatherDayCard extends StatelessWidget {
  final int minTemp;
  final int maxTemp;
  final int temp;
  final String title;
  final String iconUrl;
  final DateTime dayName;
  final Function onTap;
  WeatherDayCard(
      {this.title,
       this.onTap,
      this.dayName,
      this.minTemp,
      this.temp,
      this.iconUrl,
      this.maxTemp});
  final DateFormat dateFormat = DateFormat('EEEE');
  final DateFormat dateFormat2 = DateFormat('yMd');
  final DateFormat hourFormat = DateFormat('jm');
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:  onTap,
      child: Container(
        margin: EdgeInsets.all(10),
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Text(
                  dateFormat.format(dayName),
                  style: dayStyle,
                ),
                Text(
                  dateFormat2.format(dayName),
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                Text(hourFormat.format(dayName),
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                Text(
                  title,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
            Container(
              color: Colors.transparent,
              height: 50,
              width: 50,
              child: Image(
                image:
                    NetworkImage('http://openweathermap.org/img/wn/$iconUrl.png'),
                fit: BoxFit.fill,
              ),
            ),
            Text(
              '${temp.toString()}°C',
              style: tempStyle,
            ),
          ],
        ),
      ),
    );
  }
}
