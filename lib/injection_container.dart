import 'package:arquitecture/data/repositories/character_repository_impl.dart';
import 'package:arquitecture/data/source/character_remote_data_source.dart';
import 'package:arquitecture/data/source/network/api.dart';
import 'package:arquitecture/domain/usecase/get_all_characters.dart';
import 'package:get_it/get_it.dart';

import 'domain/repository/character_repository.dart';

final sl = GetIt.instance;

Future<void>init() async{
  sl.registerLazySingleton<Api>(() => Api());
  sl.registerLazySingleton<CharacterRemoteDataSourceImpl>(() => CharacterRemoteDataSourceImpl(sl()));
  sl.registerLazySingleton<CharacterRepository>(() => CharacterRepositoryImpl(characterRemoteDataSourceImpl :sl()));
  sl.registerLazySingleton<GetAllCharacters>(() => GetAllCharacters( repository:sl()));

}