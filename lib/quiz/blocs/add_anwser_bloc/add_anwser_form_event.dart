part of 'add_anwser_form_bloc.dart';

abstract class AddAnswerFormEvent extends Equatable {
  const AddAnswerFormEvent();

  @override
  List<Object> get props => [];
}

class AddAnswerFormTextUpdated extends AddAnswerFormEvent {
  final String value;

  const AddAnswerFormTextUpdated(this.value);

  @override
  List<Object> get props => [value];
}

class AddAnswerFormSubmitted extends AddAnswerFormEvent {}
