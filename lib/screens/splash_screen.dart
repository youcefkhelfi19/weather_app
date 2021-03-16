import 'package:flutter/material.dart';
import 'package:weather_app/animation/animation.dart';

class Splashscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OpacityAnimate(),
    );
  }
}