part of 'komentar_cubit.dart';

abstract class KomentarState extends Equatable {
  const KomentarState();
}

class KomentarInitial extends KomentarState {
  @override
  List<Object?> get props => [];
}

class KomentarLoaded extends KomentarState {
  final List<KomentarModel>? comments;

  KomentarLoaded({this.comments});

  @override
  List<Object?> get props => [comments];
}

class KomentarLoadedFailed extends KomentarState {
  final String? message;

  KomentarLoadedFailed(this.message);

  @override
  List<Object?> get props => [message];
}

class KomentarStored extends KomentarState {
  final String? message;

  KomentarStored(this.message);

  @override
  List<Object?> get props => [message];
}

class KomentarStoredFailed extends KomentarState {
  final String? message;

  KomentarStoredFailed(this.message);

  @override
  List<Object?> get props => [message];
}
