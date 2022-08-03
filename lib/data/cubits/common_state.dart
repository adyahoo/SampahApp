part of 'common_cubit.dart';

class CommonState extends Equatable {
  int? banjarId;

  CommonState({this.banjarId});

  @override
  List<Object?> get props => [banjarId];
}

class CommonInitial extends CommonState {
  int? banjarId;

  CommonInitial({this.banjarId});

  @override
  List<Object?> get props => [];
}

class BanjarLoaded extends CommonState {
  final List<BanjarModel>? banjar;

  BanjarLoaded(this.banjar);

  @override
  List<Object?> get props => [banjar];
}

class SetBanjar extends CommonState {
  int? value;

  SetBanjar(this.value);

  @override
  List<Object?> get props => [value];
}

class LoadDataFailed extends CommonState {
  final String? message;

  LoadDataFailed(this.message);

  @override
  List<Object?> get props => [message];
}
