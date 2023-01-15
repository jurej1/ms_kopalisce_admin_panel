part of 'delete_question_cubit.dart';

abstract class DeleteQuestionState extends Equatable {
  const DeleteQuestionState();

  @override
  List<Object> get props => [];
}

class DeleteQuestionInitial extends DeleteQuestionState {}

class DeleteQuestionLoading extends DeleteQuestionState {}

class DeleteQuestionSuccess extends DeleteQuestionState {
  final Question question;

  const DeleteQuestionSuccess(this.question);

  @override
  List<Object> get props => [question];
}

class DeleteQuestionFail extends DeleteQuestionState {}
