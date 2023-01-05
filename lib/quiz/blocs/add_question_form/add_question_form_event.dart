part of 'add_question_form_bloc.dart';

abstract class AddQuestionFormEvent extends Equatable {
  const AddQuestionFormEvent();

  @override
  List<Object> get props => [];
}

class AddQuestionFormTextUpdated extends AddQuestionFormEvent {
  final String value;

  const AddQuestionFormTextUpdated(this.value);

  @override
  List<Object> get props => [value];
}

class AddQuestionFormAnswerAdded extends AddQuestionFormEvent {
  final String value;

  const AddQuestionFormAnswerAdded(this.value);

  @override
  List<Object> get props => [value];
}

class AddQuestionFormAnswerRemoved extends AddQuestionFormEvent {
  final int value;

  const AddQuestionFormAnswerRemoved(this.value);

  @override
  List<Object> get props => [value];
}

class AddQuestionFormAnswerUpdated extends AddQuestionFormEvent {
  final AnswerForm value;

  const AddQuestionFormAnswerUpdated(this.value);

  @override
  List<Object> get props => [value];
}

class AddQuestionFormRightAnswerUpdated extends AddQuestionFormEvent {
  final AnswerForm value;

  const AddQuestionFormRightAnswerUpdated(this.value);

  @override
  List<Object> get props => [value];
}

class AddQuestionFormSubmitted extends AddQuestionFormEvent {}
