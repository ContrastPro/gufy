import 'package:flutter/material.dart';
import 'package:gufy/global/colors.dart';
import 'package:gufy/home_screen/home_screen.dart';
import 'package:gufy/splash_screen/splash_screen.dart';
import 'package:gufy/app_intro_screen/app_intro.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: liteBlue,
        primaryColor: darkBlue,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Г.У.Ф.И',
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/AppIntroScreen': (BuildContext context) => AppIntro(),
        '/HomeScreen': (BuildContext context) => HomeScreen(),
      },
    );
  }
}
