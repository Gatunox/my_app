import 'dart:convert';
import 'dart:io';

class Dog {
  int id;
  String name;
  String location;
  String description;
  String imageUrl;
  int height;
  int weight;
  int longevety;

  int size;
  int grooming;
  int activity;
  int barking;
  int training;
  int coat;

  // All dogs start out at 10, because they're good dogs.
  int rating = 10;

  Dog({id, name, location, description})
      : this.id = id,
        this.name = name,
        this.location = location,
        this.description = description;


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
      var uri = Uri.http('dog.ceo', '/api/breeds/image/random');
      var request = await http.getUrl(uri);
      var response = await request.close();
      var responseBody = await response.transform(utf8.decoder).join();
      // The dog.ceo API returns a JSON object with a property
      // called 'message', which actually is the URL.
      imageUrl = json.decode(responseBody)['message'];
    } catch (exception) {
      print(exception);
    }
  }
}
