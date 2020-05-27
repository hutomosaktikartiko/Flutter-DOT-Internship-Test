import 'dart:async';
import 'package:dot_test/views/home_widget.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const String id = "splash_screen";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Timer _timer;

  startTime() {
    return _timer = Timer(Duration(seconds: 2), (){
    Navigator.of(context).pushReplacementNamed(Home.id);
    });
  }

  @override
  void initState() {
    startTime();
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Center(child: Column(
          children: <Widget>[
            Spacer(),
            Text("DOT Flutter Test", style: Theme.of(context).textTheme.title,),
            Spacer(),
            Text("Versi 1.0.0", style: TextStyle(color: Colors.white, fontSize: 15)),
            SizedBox(height: 10)
          ],
        ),),
      ),
    );
  }
}