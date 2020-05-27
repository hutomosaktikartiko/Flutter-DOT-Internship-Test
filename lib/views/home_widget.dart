import 'package:dot_test/views/about_widget.dart';
import 'package:dot_test/views/galery_widget.dart';
import 'package:dot_test/views/place_widget.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  static const String id = "home";
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _currentIndex = 0;
  final List<Widget> _children = [
    Place(),
    Galery(),
    About()
  ];

  void onTapTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTapTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("List Place")),
          BottomNavigationBarItem(icon: Icon(Icons.insert_photo), title: Text("List Galery")),
          BottomNavigationBarItem(icon: Icon(Icons.info), title: Text("About")),
        ]),
    );
  }
}