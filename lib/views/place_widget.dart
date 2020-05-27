import 'package:cached_network_image/cached_network_image.dart';
import 'package:dot_test/models/list_place_model.dart';
import 'package:dot_test/service/api_provider.dart';
import 'package:dot_test/views/detail_place_widget.dart';
import 'package:flutter/material.dart';

class Place extends StatefulWidget {
  @override
  _PlaceState createState() => _PlaceState();
}

class _PlaceState extends State<Place> {
  ApiProvider apiProvider = ApiProvider();

  Future<ListPlace> listPlace;

  @override
  void initState() {
    listPlace = apiProvider.getListPlace();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "List Place",
          style: Theme.of(context).textTheme.title,
        ),
      ),
      body: Container(
        child: FutureBuilder(
            future: listPlace,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                print("Has Data: ${snapshot.hasData}");
                return ListView.builder(
                  itemCount: snapshot.data.listPlaceResult.length,
                  itemBuilder: (context, index) {
                    return placeItem(
                        name: '${snapshot.data.listPlaceResult[index].name}',
                        location:
                            '${snapshot.data.listPlaceResult[index].location}',
                        description:
                            '${snapshot.data.listPlaceResult[index].description}',
                        image: '${snapshot.data.listPlaceResult[index].image}',
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DetailPlace(
                                  detailPlace:
                                      snapshot.data.listPlaceResult[index])));
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

  Widget placeItem(
      {String name,
      String location,
      String description,
      String image,
      Function onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Stack(children: <Widget>[
          FadeInImage.assetNetwork(
            width: MediaQuery.of(context).size.width,
            height: 200,
            image: image,
            placeholder: "assets/images/placeholder.jpg",
            fit: BoxFit.cover,
          ),
          Container(
            height: 200,
            padding: EdgeInsets.only(left: 8.0, bottom: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(1, 1),
                        blurRadius: 3.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      Shadow(
                        offset: Offset(1, 1),
                        blurRadius: 3.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ],
                  ),
                ),
                Text(
                  location,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(1, 1),
                        blurRadius: 3.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                      Shadow(
                        offset: Offset(1, 1),
                        blurRadius: 3.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
