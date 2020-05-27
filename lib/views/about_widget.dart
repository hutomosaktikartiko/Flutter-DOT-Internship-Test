import 'package:dot_test/views/abouts_nav/about_nav_widget.dart';
import 'package:dot_test/views/abouts_nav/rilis_nav_widget.dart';
import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> with SingleTickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About", style: Theme.of(context).textTheme.title,),
        bottom: PreferredSize(
          preferredSize: Size(0, 50),
          child: Container(
            width: 200,
            child: TabBar(
              labelColor: Colors.white,
              indicatorColor: Colors.white,
              controller: controller, tabs: [
              Tab(
                text: "Informasi",
              ),
              Tab(
                text: "Versi Liris",
              ),
            ]),
          ),
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: <Widget>[AboutNav(), RilisNav()],
      ),
    );
  }
}
