import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pmu_malafeev_pi31/data/repositories/fortnite_repository.dart';
import 'package:pmu_malafeev_pi31/presentation/bloc/events.dart';
import 'package:pmu_malafeev_pi31/presentation/bloc/state.dart';

class HomeBlock extends Bloc<HomeEvent, HomeState> {
  final FortniteRepository repo;

  HomeBlock(this.repo) : super(const HomeState()) {
    on<HomeLoadDataEvent>(_onLoadData);
  }

  Future<void> _onLoadData(HomeLoadDataEvent event, Emitter<HomeState> emit) async {
    emit(state.copyWith(isLoading: true));
    String? error;

    final data = await repo.loadData(q: event.search);

    emit(state.copyWith(
      isLoading: false,
      data: data,
      error: error,
    ));
  }
}
