import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:pmu_malafeev_pi31/data/dtos/outfit_dto.dart';
import 'package:pmu_malafeev_pi31/data/mappers/outfit_mapper.dart';
import 'package:pmu_malafeev_pi31/data/repositories/api_interface.dart';
import 'package:pmu_malafeev_pi31/models/home_data.dart';

class FortniteRepository extends ApiInterface {
  static final Dio _dio = Dio()
    ..interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
    ));

  static const String _baseUrl = 'https://fortnite-api.com';

  @override
  Future<HomeData?> loadData({String? q}) async {
    try {
      String url =
          '$_baseUrl/v2/cosmetics/br/search/all?type=outfit&introductionChapter=1&introductionSeason=5';
      if (q != null && q != "") {
        url += '&matchMethod=contains&name=$q';
      }
      final Response<dynamic> response = await _dio.get<Map<dynamic, dynamic>>(
        url,
      );

      final OutfitsDto dto = OutfitsDto.fromJson(response.data as Map<String, dynamic>);
      final HomeData data = dto.toDomain();
      return data;
    } on DioException catch (e) {
      return null;
    }
  }
}
