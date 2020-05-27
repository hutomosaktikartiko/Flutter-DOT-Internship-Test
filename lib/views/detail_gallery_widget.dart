import 'package:cached_network_image/cached_network_image.dart';
import 'package:dot_test/models/list_gallery_model.dart';
import 'package:flutter/material.dart';

class DetailGallery extends StatelessWidget {
  final ListGalleryResult detailGallery;
  const DetailGallery({Key key, this.detailGallery}) : super(key: key);

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
              image: detailGallery.image,
              placeholder: "assets/images/placeholder.jpg",
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            )),
            Flexible(
                child: Container(
              padding: const EdgeInsets.only(top: 8.0, left: 8.0),
              child: Text(detailGallery.caption),
            ))
          ],
        ),
      ),
    );
  }
}
