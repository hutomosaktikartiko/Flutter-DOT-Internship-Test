class ListPlace {
  int statusCode;
  List<ListPlaceResult> listPlaceResult;

  ListPlace({this.statusCode, this.listPlaceResult});

  ListPlace.fromJson(Map<String, dynamic>json) {
    statusCode = json['status_code'];
    if (json['data'] != null) {
      listPlaceResult = new List<ListPlaceResult>();
      json['data'].forEach((v) {
        listPlaceResult.add(new ListPlaceResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    if (this.listPlaceResult != null) {
      data['data'] = this.listPlaceResult.map((v) => toJson()).toList();
    }
    return data;
  }
}

class ListPlaceResult {
  String name;
  String location;
  String description;
  String image;

  ListPlaceResult({this.name, this.location, this.description, this.image});

  ListPlaceResult.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    location = json['location'];
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['location'] = this.location;
    data['description'] = this.description;
    data['image'] = this.image;
    return data;
  }
}