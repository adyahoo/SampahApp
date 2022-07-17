part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitial extends UserState {
  @override
  List<Object?> get props => [];
}

//state ketika berhasil login
class UserLoaded extends UserState {
  final UserModel? user;

  UserLoaded(this.user);

  @override
  List<Object?> get props => [user];
}

//state ketika gagal login
class UserLoadedFailed extends UserState {
  final String? message;

  UserLoadedFailed(this.message);

  @override
  List<Object?> get props => [message];
}
