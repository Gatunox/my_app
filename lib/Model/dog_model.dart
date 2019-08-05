import 'dart:convert';
import 'dart:io';

class Dog {
  int id;
  String name;
  String location;
  String description;
  String imageUrl;
  String height;
  String weight;
  String longevety;
  String https;

  int size;
  int grooming;
  int activity;
  int barking;
  int training;
  int coat;

  // All dogs start out at 10, because they're good dogs.
  int rating = 10;

  Dog({id, name, height, weight, longevety, location, description, https})
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
  bool operator ==(other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    final Dog otherDog = other;
    return otherDog.id == id &&
        otherDog.name == name &&
        otherDog.location == location &&
        otherDog.description == description &&
        otherDog.imageUrl == imageUrl &&
        otherDog.height == height &&
        otherDog.weight == weight &&
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
}
