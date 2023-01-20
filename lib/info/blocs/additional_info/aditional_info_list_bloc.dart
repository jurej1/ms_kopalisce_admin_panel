import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:info_repository/info_repository.dart';

import 'package:ms_kopalisce_admin_panel/info/blocs/blocs.dart';

part 'aditional_info_list_event.dart';
part 'aditional_info_list_state.dart';

class AditionalInfoListBloc extends Bloc<AditionalInfoListEvent, AditionalInfoListState> {
  AditionalInfoListBloc(
    this.infoRepository,
  ) : super(AditionalInfoListLoading());

  final InfoRepository infoRepository;

  @override
  Stream<AditionalInfoListState> mapEventToState(AditionalInfoListEvent event) async* {
    if (event is AdditionalInfoListLoadRequested) {
      yield* _mapLoadRequestedToState();
    }
  }

  Stream<AditionalInfoListState> _mapLoadRequestedToState() async* {
    yield AditionalInfoListLoading();

    try {
      QuerySnapshot snapshot = await infoRepository.getAdditionalInfo();

      List<AdditionalInfo> infos = snapshot.docs.map((e) => AdditionalInfo.fromDocumentSnapshot(e)).toList();
      yield AditionalInfoListSuccess(values: infos);
    } catch (e) {
      yield AditionalInfoListFail();
    }
  }
}
