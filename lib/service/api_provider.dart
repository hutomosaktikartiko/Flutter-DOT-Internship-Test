import 'package:dot_test/models/list_gallery_model.dart';
import 'package:dot_test/models/list_place_model.dart';
import 'package:http/http.dart' show Client, Response;
import 'dart:convert';

class ApiProvider {
  String baseURL = "https://dot-test-70d73.firebaseapp.com/";

  Client client = Client();

  Future<ListPlace> getListPlace() async {
    Response responseListPlace = await client.get('$baseURL/list_place.json');

    if (responseListPlace.statusCode == 200) {
      return ListPlace.fromJson(jsonDecode(responseListPlace.body));
    } else {
      throw Exception(responseListPlace.statusCode);
    }
  }

  Future<ListGallery> getListGallery() async {
    Response responseListGallery = await client.get('$baseURL/list_gallery.json');

    if(responseListGallery.statusCode == 200) {
      return ListGallery.fromJson(jsonDecode(responseListGallery.body));
    } else {
      throw Exception(responseListGallery.statusCode);
    }
  }
}
