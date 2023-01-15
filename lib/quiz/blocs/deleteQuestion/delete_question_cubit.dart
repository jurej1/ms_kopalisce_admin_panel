import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz_repository/quiz_repository.dart';

part 'delete_question_state.dart';

class DeleteQuestionCubit extends Cubit<DeleteQuestionState> {
  DeleteQuestionCubit(
    this.quizRepository,
  ) : super(DeleteQuestionInitial());

  final QuizRepository quizRepository;

  Future<void> delete(Question question) async {
    emit(DeleteQuestionLoading());

    try {
      await quizRepository.deleteQuestionById(question.id);
      emit(DeleteQuestionSuccess(question));
    } catch (e) {
      emit(DeleteQuestionFail());
    }
  }
}
