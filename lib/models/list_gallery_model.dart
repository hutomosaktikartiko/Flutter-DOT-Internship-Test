class ListGallery {
  int statusCode;
  List<ListGalleryResult> listGalleryResult;

  ListGallery({this.statusCode, this.listGalleryResult});

  ListGallery.fromJson(Map<String, dynamic>json) {
    statusCode = json['status_code'];
    if (json['data'] != null) {
      listGalleryResult = new List<ListGalleryResult>();
      json['data'].forEach((v) {
        listGalleryResult.add(new ListGalleryResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    if (this.listGalleryResult != null) {
      data['data'] = this.listGalleryResult.map((v) => toJson()).toList();
    }
    return data;
  }
}

class ListGalleryResult {
  String caption;
  String thumbnail;
  String image;

  ListGalleryResult({this.caption, this.thumbnail, this.image});

  ListGalleryResult.fromJson(Map<String, dynamic> json) {
    caption = json['caption'];
    thumbnail = json['thumbnail'];
    image = json['image'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['caption'] = this.caption;
    data['thumbnail'] = this.thumbnail;
    data['image'] = this.image;
    return data;
  }
}