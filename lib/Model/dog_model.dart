import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class Breed {
  int id;
  String name;
  String group;
  String height;
  String weight;
  String https;

  String location;
  String description;
  String imageUrl;
  String longevety;

  int size;
  int grooming;
  int activity;
  int barking;
  int training;
  int coat;

  // All dogs start out at 10, because they're good dogs.
  int rating = 10;

  Breed({id, name, height, weight, longevety, location, description, https})
      : this.id = id,
        this.name = name,
        this.height = height,
        this.weight = weight,
        this.longevety = longevety,
        this.location = location,
        this.description = description,
        this.https = https;

  int get dog_id {
    return id;
  }

  void set dog_id(int id) {
    this.id = id;
  }

  String get dog_name {
    return name;
  }

  void set dog_name(String name) {
    this.name = name;
  }

  Future getImageUrl() async {
    // Null check so our app isn't doing extra work.
    // If there's already an image, we don't need to get one.
    if (imageUrl != null) {
      return;
    }

    // This is how http calls are done in flutter:
    HttpClient http = HttpClient();
    try {
      // Use darts Uri builder
      // var uri = Uri.http('dog.ceo', '/api/breeds/image/random');
      // var request = await http.getUrl(uri);
      // var response = await request.close();
      // var responseBody = await response.transform(utf8.decoder).join();
      // // The dog.ceo API returns a JSON object with a property
      // // called 'message', which actually is the URL.
      // imageUrl = json.decode(responseBody)['message'];
      imageUrl = https;
    } catch (exception) {
      print(exception);
    }
  }

  @override
  int get hashCode {
    int result = 17;
    result = 37 * result + id.hashCode;
    result = 37 * result + name.hashCode;
    result = 37 * result + group.hashCode;
    result = 37 * result + height.hashCode;
    result = 37 * result + weight.hashCode;
    result = 37 * result + https.hashCode;
    result = 37 * result + location.hashCode;
    result = 37 * result + description.hashCode;
    // result = 37 * result + imageUrl.hashCode;
    result = 37 * result + longevety.hashCode;
    result = 37 * result + size.hashCode;
    result = 37 * result + grooming.hashCode;
    result = 37 * result + activity.hashCode;
    result = 37 * result + barking.hashCode;
    result = 37 * result + training.hashCode;
    result = 37 * result + coat.hashCode;
    return result;
  }

  @override
  bool operator ==(dynamic other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    final Breed otherDog = other;
    return otherDog.id == id &&
        otherDog.name == name &&
        otherDog.group == group &&
        otherDog.height == height &&
        otherDog.weight == weight &&
        otherDog.https == https &&
        otherDog.location == location &&
        otherDog.description == description &&
        // otherDog.imageUrl == imageUrl &&
        otherDog.longevety == longevety &&
        otherDog.size == size &&
        otherDog.grooming == grooming &&
        otherDog.activity == activity &&
        otherDog.barking == barking &&
        otherDog.training == training &&
        otherDog.coat == coat;
  }


  @override
  bool contains(Object other) {
    if (identical(this, other)) return true;
    return name.contains(other);
  }

  Breed.fromJson(Map<String, dynamic> json)
      : id = json["id"] ?? "",
        name = json["name"] ?? "",
        height = json["height"] ?? "",
        weight = json["weight"] ?? "",
        longevety = json["lifespan"] ?? "",
        location = json["location"] ?? "",
        description = json["description"] ?? "",
        https = json["https"] ?? "";

  static Future<List<Breed>> load() async {
    http.Response response =
        await http.get('https://dogos-9d19d.firebaseio.com/breeds.json');
    if (response.statusCode == 200) {
      List collection = json.decode(response.body);
      List<Breed> breeds =
          collection.map((json) => Breed.fromJson(json)).toList();
//      await Future.delayed(Duration(seconds: 3));
      return breeds;
    } else {
      // TODO: We need to recover data from local cached info.
      print("Request failed with status: ${response.statusCode}.");
    }
  }
}
