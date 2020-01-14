import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_app/model/dog_model.dart';

class BreedService {
  static String _url = "https://dogos-9d19d.firebaseio.com/breeds.json";

  static Future<List<Breed>> load({query}) async {
    http.Response response = await http.get(_url);
    if (response.statusCode == 200) {
      List collection = json.decode(response.body);
      Iterable<Breed> breeds = collection.map((json) => Breed.fromJson(json));
//      await Future.delayed(Duration(seconds: 3));
      if (query != null && query.isNotEmpty) {
        breeds = breeds.where((breed) => breed.dog_name.toLowerCase().contains(query));
        print("returning filted list = " + breeds.length.toString());
        return breeds.toList();
      } else {
        print("returning full list = " + breeds.length.toString());
        return breeds.toList();
      }
    } else {
      // TODO: We need to recover data from local cached info.Ï
      print("Request failed with status: ${response.statusCode}.");
    }
    return null;
  }
}
