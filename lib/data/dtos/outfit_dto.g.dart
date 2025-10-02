// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outfit_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OutfitsDto _$OutfitsDtoFromJson(Map<String, dynamic> json) => OutfitsDto(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => OutfitDataDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

OutfitDataDto _$OutfitDataDtoFromJson(Map<String, dynamic> json) =>
    OutfitDataDto(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      rarity: json['rarity'] == null
          ? null
          : OutfitRarityDto.fromJson(json['rarity'] as Map<String, dynamic>),
      images: json['images'] == null
          ? null
          : OutfitImagesDto.fromJson(json['images'] as Map<String, dynamic>),
    );

OutfitRarityDto _$OutfitRarityDtoFromJson(Map<String, dynamic> json) =>
    OutfitRarityDto(
      value: json['value'] as String?,
      displayValue: json['displayValue'] as String?,
    );

OutfitImagesDto _$OutfitImagesDtoFromJson(Map<String, dynamic> json) =>
    OutfitImagesDto(
      icon: json['icon'] as String?,
      smallIcon: json['smallIcon'] as String?,
    );
