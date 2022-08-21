import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sampah/data/models/models.dart';
import 'package:sampah/data/services/services.dart';

part 'penukaran_state.dart';

class PenukaranCubit extends Cubit<PenukaranState> {
  PenukaranCubit() : super(PenukaranInitial());

  Future<void> tukarSaldo(int saldo) async {
    ApiReturnValue<PenukaranModel> result =
        await PenukaranServices.tukarSaldo(saldo);

    if (result.status == true) {
      emit(StoreSaldoSuccess(result.message));
    } else {
      emit(PenukaranLoadedFailed(result.message));
    }
  }

  Future<void> getPenukaran() async {
    ApiReturnValue<List<HistoryPenukaranModel>> result =
        await PenukaranServices.getPenukaran();

    if (result.status == true) {
      emit(PenukaranLoaded(result.value));
    } else {
      emit(PenukaranLoadedFailed(result.message));
    }
  }
}
