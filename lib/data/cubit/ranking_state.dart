part of 'ranking_cubit.dart';

abstract class RankingState extends Equatable {
  const RankingState();
}

class RankingInitial extends RankingState {
  @override
  List<Object?> get props => [];
}

class RankingLoaded extends RankingState {
  final List<RankingModel>? rankings;

  RankingLoaded({this.rankings});

  @override
  List<Object?> get props => [rankings];
}

class RankingHomeLoaded extends RankingState {
  final List<RankingModel>? rankings;

  RankingHomeLoaded({this.rankings});

  @override
  List<Object?> get props => [rankings];
}

class RankingLoadedFailed extends RankingState {
  final String? message;

  RankingLoadedFailed({this.message});

  @override
  List<Object?> get props => [];
}
