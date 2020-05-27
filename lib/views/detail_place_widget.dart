import 'package:cached_network_image/cached_network_image.dart';
import 'package:dot_test/models/list_place_model.dart';
import 'package:flutter/material.dart';

class DetailPlace extends StatelessWidget {
  final ListPlaceResult detailPlace;
  const DetailPlace({Key key, this.detailPlace}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            "Detail Gallery",
            style: Theme.of(context).textTheme.title,
          )),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
                child: FadeInImage.assetNetwork(
              image: detailPlace.image,
              placeholder: "assets/images/placeholder.jpg",
              fit: BoxFit.cover,
            )),
            Flexible(
                child: Container(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0),
              child: Column(
                children: <Widget>[
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        detailPlace.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(detailPlace.description),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
