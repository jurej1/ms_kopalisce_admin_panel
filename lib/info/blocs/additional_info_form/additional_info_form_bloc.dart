import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:info_repository/info_repository.dart';
import 'package:ms_kopalisce_admin_panel/info/info.dart';

part 'additional_info_form_event.dart';
part 'additional_info_form_state.dart';

class AdditionalInfoFormBloc extends Bloc<AdditionalInfoFormEvent, AdditionalInfoFormState> {
  AdditionalInfoFormBloc({required this.infoRepository}) : super(const AdditionalInfoFormState());

  final InfoRepository infoRepository;

  @override
  Stream<AdditionalInfoFormState> mapEventToState(AdditionalInfoFormEvent event) async* {
    if (event is AdditionalInfoFormSubmitted) {
      yield* _mapFormSubmittedToState();
    } else if (event is AdditionalInfoValueUpdated) {
      yield* _mapValUpdatedToState(event);
    }
  }

  Stream<AdditionalInfoFormState> _mapFormSubmittedToState() async* {
    final val = AdditionalInfoValFormz.dirty(state.val.value);

    yield state.copyWith(
      status: Formz.validate([val]),
      val: val,
    );

    if (state.status.isValidated) {
      yield state.copyWith(status: FormzStatus.submissionInProgress);

      try {
        await infoRepository.addAdditionalInfo(AdditionalInfo(id: '', created: DateTime.now(), val: state.val.value));
        yield state.copyWith(status: FormzStatus.submissionSuccess);
      } catch (e) {
        yield state.copyWith(status: FormzStatus.submissionFailure);
      }
    }
  }

  Stream<AdditionalInfoFormState> _mapValUpdatedToState(AdditionalInfoValueUpdated event) async* {
    final val = AdditionalInfoValFormz.dirty(event.value);

    yield state.copyWith(
      status: Formz.validate([val]),
      val: val,
    );
  }
}
