import 'package:arquitecture/data/dto/location_dto.dart';
import 'package:arquitecture/domain/entity/character.dart';

class CharacterDto extends Character {

  CharacterDto({
    super.id,
    super.name,
    super.status,
    super.species,
    super.type,
    super.gender,
    super.origin,
    super.location,
    super.image,
    super.episode,
    super.url,
    super.created});

  factory CharacterDto.toObject(Map<String, dynamic> json){
    return CharacterDto(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        species: json["species"],
        type: json["type"],
        gender: json["gender"],
        image: json["image"],
        url: json["url"],
        episode: List<String>.from(json["episode"]),
        created: DateTime.parse(json["created"]),
        location: LocationDto.toObject(json["location"]),
        origin: LocationDto.toObject(json["origin"]));
  }

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "status": status,
    "species": species,
    "type": type,
    "gender": gender,
    "image": image,
    "origin": LocationDto.fromLocation(origin!).toMap(),
    "location": LocationDto.fromLocation(location!).toMap(),
    "url": url,
    "created": created.toString(),
    "episode": List<dynamic>.from(episode!.map((e) => e))
  };

}