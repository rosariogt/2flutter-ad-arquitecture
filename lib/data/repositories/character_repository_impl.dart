import 'package:arquitecture/data/source/character_remote_data_source.dart';
import 'package:arquitecture/domain/entity/character.dart';
import 'package:arquitecture/domain/repository/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {

  final CharacterRemoteDataSourceImpl _characterRemoteDataSourceImpl;

  CharacterRepositoryImpl({required CharacterRemoteDataSourceImpl characterRemoteDataSourceImpl}):
        _characterRemoteDataSourceImpl = characterRemoteDataSourceImpl;

  @override
  Future<List<Character>> getCharacters({int page = 0}) async {
    // TODO: implement getCharacters
    return await _characterRemoteDataSourceImpl.loadCharacters(page: page);
  }
  
}