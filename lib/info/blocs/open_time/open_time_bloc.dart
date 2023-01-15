import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:info_repository/info_repository.dart';

part 'open_time_event.dart';
part 'open_time_state.dart';

class OpenTimeBloc extends Bloc<OpenTimeEvent, OpenTimeState> {
  OpenTimeBloc({
    required InfoRepository infoRepository,
  })  : _infoRepository = infoRepository,
        super(OpenTimeFail());

  final InfoRepository _infoRepository;

  @override
  Stream<OpenTimeState> mapEventToState(OpenTimeEvent event) async* {
    if (event is OpenTimeLoadRequested) {
      yield* _mapLoadRequestedToState();
    } else if (event is OpenTimeElementUpdated) {
      yield* _mapElementUpdatedToState(event);
    }
  }

  Stream<OpenTimeState> _mapLoadRequestedToState() async* {
    yield OpenTimeFail();

    try {
      DocumentSnapshot documentSnapshot = await _infoRepository.getOpenTime();

      OpenTime time = OpenTime.fromDocumentSnapshot(documentSnapshot);

      yield OpenTimeLoadSuccess(time, status: FormStatus.pure);
    } catch (e) {
      log(e.toString());
      yield OpenTimeFail();
    }
  }

  Stream<OpenTimeState> _mapElementUpdatedToState(OpenTimeElementUpdated event) async* {
    if (state is OpenTimeLoadSuccess) {
      final currentState = (state as OpenTimeLoadSuccess);
      final val = currentState.openTime;

      List<OpenDay> copyList = List<OpenDay>.from(val.days);

      if (copyList.any((element) => element.dayOfWeek == event.openDay.dayOfWeek)) {
        copyList = copyList.map((e) {
          if (e.dayOfWeek == event.openDay.dayOfWeek) {
            return event.openDay;
          }
          return e;
        }).toList();

        yield OpenTimeLoadSuccess(OpenTime(copyList), status: FormStatus.dirty);
      } else {
        yield OpenTimeLoadSuccess(OpenTime(copyList..add(event.openDay)), status: FormStatus.dirty);
      }
    }
  }
}
