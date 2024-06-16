import 'package:arquitecture/domain/entity/location.dart';

class Character {
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  String? image;
  String? url;
  List<String>? episode;
  DateTime? created;
  Location? location;
  Location? origin;

  Character({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.image,
    this.url,
    this.episode,
    this.created,
    this.location,
    this.origin
  });
}