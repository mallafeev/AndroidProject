import 'package:json_annotation/json_annotation.dart';
part 'outfit_dto.g.dart';

@JsonSerializable(createToJson: false)
class OutfitsDto {
  final List<OutfitDataDto>? data;

  const OutfitsDto({this.data});

  factory OutfitsDto.fromJson(Map<String, dynamic> json) => _$OutfitsDtoFromJson(json);
}

@JsonSerializable(createToJson: false)
class OutfitDataDto {
  final String? id;
  final String? name;
  final String? description;
  final OutfitRarityDto? rarity;
  final OutfitImagesDto? images;

  const OutfitDataDto({this.id, this.name, this.description, this.rarity, this.images});

  factory OutfitDataDto.fromJson(Map<String, dynamic> json) => _$OutfitDataDtoFromJson(json);
}

@JsonSerializable(createToJson: false)
class OutfitRarityDto {
  final String? value;
  final String? displayValue;

  const OutfitRarityDto({this.value, this.displayValue});

  factory OutfitRarityDto.fromJson(Map<String, dynamic> json) => _$OutfitRarityDtoFromJson(json);
}

@JsonSerializable(createToJson: false)
class OutfitImagesDto {
  final String? icon;
  final String? smallIcon;

  const OutfitImagesDto({this.icon, this.smallIcon});

  factory OutfitImagesDto.fromJson(Map<String, dynamic> json) => _$OutfitImagesDtoFromJson(json);
}
