part of 'helpers.dart';

class CharacterHelper {
  static List<String> listCharacter = [
    'Avatar 1',
    'Avatar 2',
    'Avatar 3',
  ];

  static List<String> shuffledTenCharacter() {
    List<String> _list = [];

    for (var i = 0; i < 10; i++) {
      listCharacter.shuffle();
      _list.add(listCharacter.first);
    }

    return _list;
  }
}
