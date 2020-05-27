import 'package:flutter/material.dart';

class Galery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List Galery", style: Theme.of(context).textTheme.title,),),
      body: Container(child: Center(child: Text("List galery"),)),
    );
  }
}