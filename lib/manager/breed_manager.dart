import 'dart:async';

import 'package:my_app/model/data.dart';
import 'package:my_app/model/dog_model.dart';
import 'package:my_app/model/letter_model.dart';
import 'package:my_app/service/breed_service.dart';

class BreedManager {
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
      StreamController<List<Letter>>.broadcast();

  Stream<List<Letter>> get breedLetterList => _breedLetterList.stream;

  final StreamController _breedController = StreamController<Breed>.broadcast();

  Sink get breedSink => _breedController.sink;

  Stream<Breed> get breedStream => _breedController.stream;

  changeBreed(Breed breed) {
    print("adding " + breed.name + " to Stream");
    breedSink.add(breed);
  }

  void listenToBreeeListStream(String query) {
    filteredBreedList(query).listen((list) {
      print("filteredBreedList Adding _breedCount elements = " +
          list.length.toString());
      _breedCount.add(list.length);
     }, onDone: () {
      print("filteredBreedList Task 1 Done");
    }, onError: (error) {
      print("filteredBreedList Task 1 Error");
    });
    filteredBreedList(query).listen((list) {
      int current_index = 0;
      print("filteredBreedList Adding _breedLetterList elements = " +
          list.length.toString());
      letters.clear();
      letters = letterIndex
          .map((letter) => Letter(value: letter.value, enabled: false))
          .toList();
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
    }, onDone: () {
      print("filteredBreedList Task 2 Done");
    }, onError: (error) {
      print("filteredBreedList Task 2 Error");
    });
  }

  BreedManager() {
    print("-- BreadManager Build --");
  }

  dispose() {
    _breedController.close();
    _breedLetterList.close();
    _breedCount.close();
  }
}
