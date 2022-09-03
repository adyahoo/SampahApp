import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sampah/data/models/models.dart';
import 'package:sampah/data/services/services.dart';

part 'ranking_state.dart';

class RankingCubit extends Cubit<RankingState> {
  RankingCubit() : super(RankingInitial());

  List<RankingModel> empty = [];

  Future<void> getAllRanking() async {
    ApiReturnValue<List<RankingModel>> result =
        await RankingServices.getAllRanking();

    if (result.status == true) {
      emit(RankingLoaded(rankings: result.value));
    } else {
      emit(RankingLoadedFailed(message: result.message));
    }
  }

  Future<void> getTopRanking() async {
    ApiReturnValue<List<RankingModel>> result =
        await RankingServices.getTopRanking();

    if (result.status == true) {
      emit(RankingHomeLoaded(rankings: result.value));
    } else {
      emit(RankingLoadedFailed(message: result.message));
    }
  }
}
