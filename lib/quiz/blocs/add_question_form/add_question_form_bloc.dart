import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:ms_kopalisce_admin_panel/quiz/models/models.dart';
import 'package:quiz_repository/quiz_repository.dart';

part 'add_question_form_event.dart';
part 'add_question_form_state.dart';

class AddQuestionFormBloc extends Bloc<AddQuestionFormEvent, AddQuestionFormState> {
  AddQuestionFormBloc({
    required QuizRepository quizRepository,
  })  : _quizRepository = quizRepository,
        super(const AddQuestionFormState());

  final QuizRepository _quizRepository;

  @override
  Stream<AddQuestionFormState> mapEventToState(AddQuestionFormEvent event) async* {
    if (event is AddQuestionFormTextUpdated) {
      yield _mapQuestionTextUpdatedToState(event);
    } else if (event is AddQuestionFormAnwserAdded) {
      yield _mapAnwserAddedToState(event);
    } else if (event is AddQuestionFormAnwserRemoved) {
      yield _mapAnwserRemovedToState(event);
    } else if (event is AddQuestionFormAnwserUpdated) {
      yield _mapAnwserUpdatedToState(event);
    } else if (event is AddQuestionFormRightAnwserUpdated) {
      yield _mapRightAnwserUpdatedToState(event);
    } else if (event is AddQuestionFormSubmitted) {
      yield* _mapFormSubmittedToState();
    }
  }

  AddQuestionFormState _mapQuestionTextUpdatedToState(AddQuestionFormTextUpdated event) {
    final QuestionTextFormz text = QuestionTextFormz.dirty(event.value);

    return state.copyWith(
      questionText: text,
      status: Formz.validate([
        text,
        state.anwsersList,
      ]),
    );
  }

  AddQuestionFormState _mapAnwserAddedToState(AddQuestionFormAnwserAdded event) {
    final newList = state.anwsersList.addElementToList(event.value);
    final anwsersList = AnwsersListFormz.dirty(newList);

    return state.copyWith(
      anwsersList: anwsersList,
      status: Formz.validate([
        anwsersList,
        state.questionText,
      ]),
    );
  }

  AddQuestionFormState _mapAnwserRemovedToState(AddQuestionFormAnwserRemoved event) {
    final newList = state.anwsersList.removeElementFromListById(event.value);

    final anwsersList = AnwsersListFormz.dirty(newList);
    return state.copyWith(
      anwsersList: anwsersList,
      status: Formz.validate([
        anwsersList,
        state.questionText,
      ]),
    );
  }

  AddQuestionFormState _mapAnwserUpdatedToState(AddQuestionFormAnwserUpdated event) {
    final newList = state.anwsersList.updateAnwserFromList(event.value);

    final anwsersList = AnwsersListFormz.dirty(newList);
    return state.copyWith(
      anwsersList: anwsersList,
      status: Formz.validate([
        anwsersList,
        state.questionText,
      ]),
    );
  }

  AddQuestionFormState _mapRightAnwserUpdatedToState(AddQuestionFormRightAnwserUpdated event) {
    final newList = state.anwsersList.updateIsRight(event.value);

    final anwsersList = AnwsersListFormz.dirty(newList);
    return state.copyWith(
      anwsersList: anwsersList,
      status: Formz.validate([
        anwsersList,
        state.questionText,
      ]),
    );
  }

  Stream<AddQuestionFormState> _mapFormSubmittedToState() async* {
    final text = QuestionTextFormz.dirty(state.questionText.value);
    final anwsers = AnwsersListFormz.dirty(state.anwsersList.value);

    final status = Formz.validate([text, anwsers]);

    yield state.copyWith(anwsersList: anwsers, questionText: text, status: status);

    if (state.status.isValidated) {
      try {
        yield state.copyWith(status: FormzStatus.submissionInProgress);

        final anwsersList = AnswerForm.toAnwsersList(state.anwsersList.value);
        final rightAnwser = state.anwsersList.value.firstWhere((element) => element.isRight);

        await _quizRepository.addQuestion(
          Question(
            id: '',
            anwsers: anwsersList,
            questionText: state.questionText.value,
            rightAnwser: rightAnwser,
          ),
        );

        yield state.copyWith(status: FormzStatus.submissionSuccess);
      } catch (e) {
        yield state.copyWith(status: FormzStatus.submissionFailure);
      }
    }
  }
}
