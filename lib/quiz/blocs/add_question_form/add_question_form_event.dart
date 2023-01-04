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

class AddQuestionFormAnwserAdded extends AddQuestionFormEvent {
  final String value;

  const AddQuestionFormAnwserAdded(this.value);

  @override
  List<Object> get props => [value];
}

class AddQuestionFormAnwserRemoved extends AddQuestionFormEvent {
  final int value;

  const AddQuestionFormAnwserRemoved(this.value);

  @override
  List<Object> get props => [value];
}

class AddQuestionFormAnwserUpdated extends AddQuestionFormEvent {
  final AnwserForm value;

  const AddQuestionFormAnwserUpdated(this.value);

  @override
  List<Object> get props => [value];
}

class AddQuestionFormRightAnwserUpdated extends AddQuestionFormEvent {
  final AnwserForm value;

  const AddQuestionFormRightAnwserUpdated(this.value);

  @override
  List<Object> get props => [value];
}

class AddQuestionFormSubmitted extends AddQuestionFormEvent {}
