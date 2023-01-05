part of 'questions_list_bloc.dart';

abstract class QuestionsListState {
  const QuestionsListState();
}

class QuestionsListLoading extends QuestionsListState {}

class QuestionsListLoadSuccess extends QuestionsListState {
  final List<Question> questions;

  const QuestionsListLoadSuccess(this.questions);
}

class QuestionsListFail extends QuestionsListState {}
