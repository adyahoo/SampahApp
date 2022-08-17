import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sampah/data/services/services.dart';

import '../models/models.dart';

part 'common_state.dart';

class CommonCubit extends Cubit<CommonState> {
  CommonCubit() : super(CommonState());

  Future<void> getBanjar() async {
    ApiReturnValue<List<BanjarModel>> result = await CommonService.getBanjars();

    if (result.value != null) {
      emit(BanjarLoaded(result.value));
    } else {
      emit(LoadDataFailed(result.message));
    }
  }

  void setBanjar(int selectedBanjar) {
    emit(CommonState(banjarId: selectedBanjar));
  }
}
