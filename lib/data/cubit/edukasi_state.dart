part of 'edukasi_cubit.dart';

abstract class EdukasiState extends Equatable {
  const EdukasiState();
}

class EdukasiInitial extends EdukasiState {
  @override
  List<Object?> get props => [];
}

class ListEdukasiLoaded extends EdukasiState {
  final List<EdukasiModel>? edukasis;

  ListEdukasiLoaded({this.edukasis});

  @override
  List<Object?> get props => [edukasis];
}

class ListNewestEdukasiLoaded extends EdukasiState {
  final List<EdukasiModel>? edukasis;

  ListNewestEdukasiLoaded({this.edukasis});

  @override
  List<Object?> get props => [edukasis];
}

class EdukasiLoaded extends EdukasiState {
  final EdukasiModel? edukasi;

  EdukasiLoaded({this.edukasi});

  @override
  List<Object?> get props => [];
}

class LoadDataFailed extends EdukasiState {
  final String? message;

  LoadDataFailed(this.message);

  @override
  List<Object?> get props => [message];
}