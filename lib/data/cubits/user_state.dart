part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitial extends UserState {
  @override
  List<Object?> get props => [];
}

//state ketika berhasil fetch data user
class UserLoaded extends UserState {
  final UserModel? user;

  UserLoaded(this.user);

  @override
  List<Object?> get props => [user];
}

//state ketika berhasil log out
class UserLoggedOut extends UserState {
  final String message;

  UserLoggedOut(this.message);

  @override
  List<Object?> get props => [message];
}

//state ketika berhasil register
class UserRegistered extends UserState {
  final String? message;

  UserRegistered({this.message});

  @override
  List<Object?> get props => [message];
}

//state ketika gagal fetch data user
class UserLoadedFailed extends UserState {
  final String? message;

  UserLoadedFailed(this.message);

  @override
  List<Object?> get props => [message];
}
