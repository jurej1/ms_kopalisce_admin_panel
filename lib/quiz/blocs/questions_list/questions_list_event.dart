part of 'questions_list_bloc.dart';

abstract class QuestionsListEvent extends Equatable {
  const QuestionsListEvent();

  @override
  List<Object> get props => [];
}

class QuestionsListLoadRequested extends QuestionsListEvent {}

class QuestionsListQuestionRemoved extends QuestionsListEvent {
  final Question val;

  const QuestionsListQuestionRemoved(this.val);

  @override
  List<Object> get props => [val];
}
