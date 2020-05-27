import 'package:dot_test/splash_screen.dart';
import 'package:dot_test/views/home_widget.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'List Place',
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: Colors.green[400],
            textTheme: TextTheme(
              title: TextStyle(color: Colors.white),
            )),
        initialRoute: SplashScreen.id,
        routes: {
          SplashScreen.id: (context) => SplashScreen(),
          Home.id: (context) => Home()
        });
  }
}
