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
    }
  }

  Stream<OpenTimeState> _mapLoadRequestedToState() async* {
    yield OpenTimeFail();

    try {
      DocumentSnapshot documentSnapshot = await _infoRepository.getOpenTime();

      OpenTime time = OpenTime.fromDocumentSnapshot(documentSnapshot);

      yield OpenTimeLoadSuccess(time);
    } catch (e) {
      yield OpenTimeFail();
    }
  }
}
