import 'package:pmu_malafeev_pi31/models/home_data.dart';

abstract class ApiInterface {
  Future<HomeData?> loadData();
}
