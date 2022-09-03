import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sampah/data/models/models.dart';
import 'package:sampah/data/services/services.dart';

part 'komentar_state.dart';

class KomentarCubit extends Cubit<KomentarState> {
  KomentarCubit() : super(KomentarInitial());

  Future<void> getComments() async {
    ApiReturnValue<List<KomentarModel>> result =
        await KomentarServices.getComments();

    List<KomentarModel> empty = [];

    if (result.status == true) {
      emit(KomentarLoaded(comments: result.value));
    } else {
      emit(KomentarLoadedFailed(result.message));
    }
  }

  Future<void> storeComment(String chat) async {
    ApiReturnValue<String> result = await KomentarServices.storeComment(chat);

    if (result.status == true) {
      emit(KomentarStored(result.message));
    } else {
      emit(KomentarStoredFailed(result.message));
    }
  }
}
