part of 'penukaran_cubit.dart';

abstract class PenukaranState extends Equatable {
  const PenukaranState();
}

class PenukaranInitial extends PenukaranState {
  @override
  List<Object?> get props => [];
}

class StoreSaldoSuccess extends PenukaranState {
  final String? message;

  StoreSaldoSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

class StoreSaldoFailed extends PenukaranState {
  final String? message;

  StoreSaldoFailed(this.message);

  @override
  List<Object?> get props => [message];
}
