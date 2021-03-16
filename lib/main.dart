import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/screens/splash_screen.dart';
import 'package:weather_app/view_model/view_model.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider<ViewModel>(
      create: (context)=>ViewModel(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
        ),
        home: Splashscreen(),
      ),
    );
  }
}

