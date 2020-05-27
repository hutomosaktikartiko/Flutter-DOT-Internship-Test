import 'package:flutter/material.dart';

class Place extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List Place", style: Theme.of(context).textTheme.title,),),
      body: Container(child: Center(child: Text("List Place"),)),
    );
  }
}