part of 'add_question_form_bloc.dart';

class AddQuestionFormState {
  const AddQuestionFormState({
    this.questionText = const QuestionTextFormz.pure(''),
    this.anwsersList = const AnwsersListFormz.pure([]),
    this.status = FormzStatus.pure,
  });

  final QuestionTextFormz questionText;
  final AnwsersListFormz anwsersList;
  final FormzStatus status;

  AddQuestionFormState copyWith({
    QuestionTextFormz? questionText,
    AnwsersListFormz? anwsersList,
    FormzStatus? status,
  }) {
    return AddQuestionFormState(
      questionText: questionText ?? this.questionText,
      anwsersList: anwsersList ?? this.anwsersList,
      status: status ?? this.status,
    );
  }
}
