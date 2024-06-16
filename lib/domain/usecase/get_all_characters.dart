import 'package:arquitecture/domain/entity/character.dart';
import 'package:arquitecture/domain/repository/character_repository.dart';

class GetAllCharacters{
  CharacterRepository _repository;

  GetAllCharacters({
    required CharacterRepository repository
  }): _repository = repository;

  Future<List<Character>> call({int page=0}) async {
    return await _repository.getCharacters(page: page);
  }
}