import 'package:pmu_malafeev_pi31/data/dtos/outfit_dto.dart';
import 'package:pmu_malafeev_pi31/models/card_data.dart';
import 'package:pmu_malafeev_pi31/models/home_data.dart';

extension OutfitDataDtoToModel on OutfitDataDto {
  CardData toDomain() => CardData(
        name ?? 'UNKNOWN',
        imageUrl: images?.icon,
        descriptionText: description ?? 'NO DESCRIPTION',
        rarity: rarity?.displayValue ?? 'NO RARITY',
    id: id,
      );
}
extension OutfitDtoToModel on OutfitsDto {
  HomeData toDomain() => HomeData(
    data: data?.map((e) => e.toDomain()).toList(),
  );
}
