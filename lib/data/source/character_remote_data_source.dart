import 'package:arquitecture/data/dto/character_dto.dart';

import 'network/api.dart';

abstract class CharacterRemoteSource {

  Future<List<CharacterDto>> loadCharacters({int page = 0});

}

class CharacterRemoteDataSourceImpl implements CharacterRemoteSource {

  Api api;

  CharacterRemoteDataSourceImpl(this.api);

  @override
  Future<List<CharacterDto>> loadCharacters({int page = 0}) async {
    // TODO: implement loadCharacters
    Map<String, dynamic> jsonResponse = await api.get("/character/?page=${page}");
    //print("jsonResponse ${jsonResponse}");
    return (jsonResponse["results"]  as List).map((character) => CharacterDto.toObject(character)).toList();
  }

}