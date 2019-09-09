import 'package:my_app/model/dog_model.dart';
import 'package:my_app/model/letter_model.dart';

var initialDoggos = [];
var duplicateDoggos = [];

var dogIndex = []
  ..add(Letter(id: 1, value: 'A', enabled: false))
  ..add(Letter(id: 2, value: 'B', enabled: false))
  ..add(Letter(id: 3, value: 'C', enabled: false))
  ..add(Letter(id: 4, value: 'D', enabled: false))
  ..add(Letter(id: 5, value: 'E', enabled: false))
  ..add(Letter(id: 6, value: 'F', enabled: false))
  ..add(Letter(id: 7, value: 'G', enabled: false))
  ..add(Letter(id: 8, value: 'H', enabled: false))
  ..add(Letter(id: 9, value: 'I', enabled: false))
  ..add(Letter(id: 10, value: 'J', enabled: false))
  ..add(Letter(id: 11, value: 'K', enabled: false))
  ..add(Letter(id: 12, value: 'L', enabled: false))
  ..add(Letter(id: 13, value: 'M', enabled: false))
  ..add(Letter(id: 14, value: 'N', enabled: false))
  ..add(Letter(id: 15, value: 'O', enabled: false))
  ..add(Letter(id: 16, value: 'P', enabled: false))
  ..add(Letter(id: 17, value: 'Q', enabled: false))
  ..add(Letter(id: 18, value: 'R', enabled: false))
  ..add(Letter(id: 19, value: 'S', enabled: false))
  ..add(Letter(id: 20, value: 'T', enabled: false))
  ..add(Letter(id: 21, value: 'U', enabled: false))
  ..add(Letter(id: 22, value: 'V', enabled: false))
  ..add(Letter(id: 23, value: 'W', enabled: false))
  ..add(Letter(id: 24, value: 'X', enabled: false))
  ..add(Letter(id: 24, value: 'Y', enabled: false))
  ..add(Letter(id: 25, value: 'Z', enabled: false));

var dogLetterMap = new Map();
var dogIndexMap = new Map();

void generateMap() {
  Iterator i = duplicateDoggos.iterator;
  String letter = "";
  int index = 0;
  while (i.moveNext()) {
    // print("$index" + "," + i.current.name.substring(0, 1));
    if (letter != i.current.name.substring(0, 1)) {
      letter = i.current.name.substring(0, 1);
      dogLetterMap[letter] = index;
    }
    dogIndexMap[index] = letter;
    index++;
  }
  //print(dogLetterMap);
  //print(dogIndexMap);
}
