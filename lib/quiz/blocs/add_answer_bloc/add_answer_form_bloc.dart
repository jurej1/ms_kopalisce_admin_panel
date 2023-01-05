import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

import '../../quiz.dart';

part 'add_answer_form_event.dart';
part 'add_anwser_form_state.dart';

class AddAnswerFormBloc extends Bloc<AddAnswerFormEvent, AddAnswerFormState> {
  AddAnswerFormBloc({AnswerForm? anwser}) : super(AddAnswerFormState.initial(anwser));

  @override
  Stream<AddAnswerFormState> mapEventToState(AddAnswerFormEvent event) async* {
    if (event is AddAnswerFormTextUpdated) {
      yield _mapTextUpdatedToState(event);
    } else if (event is AddAnswerFormSubmitted) {
      yield* _mapFormSubmittedToState();
    }
  }

  AddAnswerFormState _mapTextUpdatedToState(AddAnswerFormTextUpdated event) {
    final text = AnwserTextFormz.dirty(event.value);

    return state.copyWith(
      status: Formz.validate([text]),
      text: text,
    );
  }

  Stream<AddAnswerFormState> _mapFormSubmittedToState() async* {
    final text = AnwserTextFormz.dirty(state.text.value);

    yield state.copyWith(
      status: Formz.validate([text]),
      text: text,
    );

    if (state.status.isValidated) {
      yield state.copyWith(status: FormzStatus.submissionSuccess);
    }
  }
}
