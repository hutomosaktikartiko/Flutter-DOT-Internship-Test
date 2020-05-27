import 'package:cached_network_image/cached_network_image.dart';
import 'package:dot_test/models/list_gallery_model.dart';
import 'package:dot_test/service/api_provider.dart';
import 'package:dot_test/views/detail_gallery_widget.dart';
import 'package:flutter/material.dart';

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  ApiProvider apiProvider = ApiProvider();

  Future<ListGallery> listGallery;

  @override
  void initState() {
    listGallery = apiProvider.getListGallery();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "List Gallery",
          style: Theme.of(context).textTheme.title,
        ),
      ),
      body: Container(
        child: FutureBuilder(
            future: listGallery,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                print("Has Data: ${snapshot.hasData}");
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, childAspectRatio: 1),
                  itemCount: snapshot.data.listGalleryResult.length,
                  itemBuilder: (context, index) {
                    return galleryItem(
                        caption:
                            '${snapshot.data.listGalleryResult[index].caption}',
                        thumbnail:
                            '${snapshot.data.listGalleryResult[index].thumbnail}',
                        image:
                            '${snapshot.data.listGalleryResult[index].image}',
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetailGallery(
                                  detailGallery:
                                      snapshot.data.listGalleryResult[index])));
                        });
                  },
                );
              } else if (snapshot.hasError) {
                print("Has Error: ${snapshot.hasError}");
                return Center(
                    child: Text(
                  'Error, Check your connections !',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 24,
                  ),
                ));
              } else {
                print("Loading...");
                return Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }

  Widget galleryItem(
      {String caption, String thumbnail, String image, Function onTap}) {
    return InkWell(
        onTap: onTap,
        child: Container(
          child: FadeInImage.assetNetwork(
            image: thumbnail,
            height: 50,
            placeholder:"assets/images/placeholder.jpg",
            fit: BoxFit.cover,
          ),
        ));
  }
}
