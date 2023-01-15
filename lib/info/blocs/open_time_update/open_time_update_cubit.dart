import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:info_repository/info_repository.dart';

part 'open_time_update_state.dart';

class OpenTimeUpdateCubit extends Cubit<OpenTimeUpdateState> {
  OpenTimeUpdateCubit(
    this.infoRepository,
  ) : super(OpenTimeUpdateInitial());

  final InfoRepository infoRepository;

  Future<void> updateToFirebase(OpenTime val) async {
    emit(OpenTimeUpdateLoading());

    try {
      await infoRepository.setOpenTime(val);

      emit(OpenTimeUpdateSuccess(val));
    } catch (e) {
      log(e.toString());
      emit(OpenTimeUpdateFail());
    }
  }
}
