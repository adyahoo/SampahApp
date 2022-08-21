import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';
import 'package:sampah/data/models/models.dart';
import 'package:sampah/data/services/services.dart';

part 'transaksi_state.dart';

class TransaksiCubit extends Cubit<TransaksiState> {
  TransaksiCubit() : super(TransaksiInitial());

  Future<void> getTransaksi() async {
    ApiReturnValue<List<TransaksiModel>> result =
        await TransaksiService.getTransaksi();

    if (result.status == true) {
      emit(TransaksiLoaded(transaksis: result.value));
    } else {
      emit(TransaksiLoadedFailed(message: result.message));
    }
  }
}
