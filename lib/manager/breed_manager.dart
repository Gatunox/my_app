import 'dart:async';

import 'package:my_app/model/data.dart';
import 'package:my_app/model/dog_model.dart';
import 'package:my_app/model/letter_model.dart';
import 'package:my_app/service/breed_service.dart';

class BreadManager {
  final StreamController<int> _breedCount = StreamController<int>();
  Stream<int> get breedCount => _breedCount.stream;

  Stream<List<Breed>> get breedList {
    print("loading without query");
    return Stream.fromFuture(BreedService.load());
  }

  Stream<List<Breed>> filteredBreedList(String query) {
    print("loading with = " + query.toString());
    return Stream.fromFuture(BreedService.load(query: query));
  }

  final StreamController<List<Letter>> _breedLetterList =
      StreamController<List<Letter>>();

  Stream<List<Letter>> get breedLetterList => _breedLetterList.stream;

  void listenToBreeeListStream(String query) {
    filteredBreedList(query).listen((list) {
      print("filteredBreedList Adding _breedCount elements = " +
          list.length.toString());
      _breedCount.add(list.length);
    });
    filteredBreedList(query).listen((list) {
      int current_index = 0;
      print("filteredBreedList Adding _breedLetterList elements = " +
          list.length.toString());
      letters.clear();
      letters = letterIndex.map((letter) => Letter(value: letter.value, enabled: false)).toList();
      //letters.addAll(letterIndex);
      list.forEach((breed) {
        final Letter letter = Letter(value: breed.name.substring(0, 1));
        final int index = letters.indexOf(letter);
        if (index != -1 && letters[index].enabled == false) {
          letters[index].enabled = true;
          letters[index].points_to = current_index;
        }
        current_index += 1;
      });
      _breedLetterList.add(letters);
      // letters.forEach((letter) => print(letter.value));
    });
  }

  BreadManager() {
    print("-- BreadManager Build --");

    // breedList.listen((list) => _breedCount.add(list.length));

    // breedList.listen((list) {
    //   int current_index = 0;
    //   //List<Letter> letters = List<Letter>();
    //   letters.clear();
    //   letters.addAll(letterIndex);
    //   list.forEach((breed) {
    //     final Letter letter = Letter(value: breed.name.substring(0, 1));
    //     final int index = letters.indexOf(letter);
    //     if (index != -1 && letters[index].enabled == false) {
    //       letters[index].enabled = true;
    //       letters[index].points_to = current_index;
    //     }
    //     current_index += 1;
    //   });
    //   _breedLetterList.add(letters);
    //   // letters.forEach((letter) => print(letter.value));
    // });
  }

  dispose() {
    _breedLetterList.close();
    _breedCount.close();
  }
}
