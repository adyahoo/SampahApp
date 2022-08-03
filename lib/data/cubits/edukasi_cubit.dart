import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sampah/data/cubits/common_cubit.dart';
import 'package:sampah/data/models/models.dart';
import 'package:sampah/data/services/services.dart';

part 'edukasi_state.dart';

class EdukasiCubit extends Cubit<EdukasiState> {
  EdukasiCubit() : super(EdukasiInitial());

  Future<void> getNewestEdukasi() async {
    ApiReturnValue<List<EdukasiModel>> result =
        await EdukasiService.getNewestEdukasi();

    if (result.status == true) {
      emit(ListNewestEdukasiLoaded(edukasis: result.value));
    } else {
      emit(LoadDataFailed(result.message));
    }
  }

  Future<void> getAllEdukasi() async {
    ApiReturnValue<List<EdukasiModel>> result =
        await EdukasiService.getAllEdukasi();

    if (result.status == true) {
      emit(ListEdukasiLoaded(edukasis: result.value));
    } else {
      emit(LoadDataFailed(result.message));
    }
  }

  Future<void> getDetailEdukasi(int id) async {
    ApiReturnValue<EdukasiModel> result =
        await EdukasiService.getDetailEdukasi(id);

    if (result.status == true) {
      emit(EdukasiLoaded(edukasi: result.value));
    } else {
      emit(LoadDataFailed(result.message));
    }
  }
}
