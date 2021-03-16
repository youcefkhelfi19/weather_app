import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:weather_app/services/location.dart';

class OpacityAnimate extends StatefulWidget {
  @override
  _OpacityAnimateState createState() => _OpacityAnimateState();
}
void getLocation()async{
  await Location().getLocation();
}
class _OpacityAnimateState extends State<OpacityAnimate> {
  Tween<double> tween = Tween(begin: 0.0, end: 1.0);
  @override
  Widget build(BuildContext context) {
    Size size = Get.mediaQuery.size;
    return Center(
      child: TweenAnimationBuilder(
        duration: const Duration(seconds: 3),
        tween: tween,
        builder: (BuildContext context, double opacity, Widget child) {
          return Opacity(
            opacity: opacity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'images/cloudy.png',
                  height: size.width * 0.26,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Weather ',
                    style: Get.theme.textTheme.headline4,
                    children: <TextSpan>[
                      TextSpan(
                        text: '.Me',
                        style: Get.theme.textTheme.headline5,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        onEnd: () {
          getLocation();
          Get.off(HomeScreen());
        },
      ),
    );
  }
}