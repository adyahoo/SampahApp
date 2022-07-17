import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sampah/data/models/models.dart';
import 'package:sampah/data/services/services.dart';
import 'cubit.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  Future<void> login(String email, String password) async {
    ApiReturnValue<UserModel> result = await UserService.login(email, password);

    if (result.value != null) {
      emit(UserLoaded(result.value));
    } else {
      emit(UserLoadedFailed(result.message));
    }
  }

  Future<void> register(String user, String password) async {}

  Future<void> logout() async {}
}
