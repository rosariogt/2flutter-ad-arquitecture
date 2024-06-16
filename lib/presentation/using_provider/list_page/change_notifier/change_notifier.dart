import 'package:arquitecture/domain/entity/character.dart';
import 'package:flutter/cupertino.dart';

import '../../../../domain/usecase/get_all_characters.dart';
import '../../../../injection_container.dart';

enum CharacterStatus {initial, loading, success, failed}

class CharacterChangeNotifier extends ChangeNotifier {

  final GetAllCharacters _getAllCharacters;

  CharacterChangeNotifier():
    _getAllCharacters = sl.get<GetAllCharacters>(),
  _status = CharacterStatus.initial,
        _currentPage = 1,
        _characters = [];

  CharacterStatus _status;
  CharacterStatus get status => _status;

  int _currentPage;
  int get currentPage => _currentPage;

  List<Character> _characters;
  List<Character> get characters => List.of(_characters);

  Future<void> fetchNextPage() async {
    _status = CharacterStatus.loading;
    notifyListeners();
    final list = await _getAllCharacters(page: _currentPage);
    print("notifier ${list.length}");
    _currentPage++;
    _characters.addAll(list);
    _status = CharacterStatus.success;
    notifyListeners();
  }
}