import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz_repository/quiz_repository.dart';

part 'questions_list_event.dart';
part 'questions_list_state.dart';

class QuestionsListBloc extends Bloc<QuestionsListEvent, QuestionsListState> {
  QuestionsListBloc({
    required QuizRepository quizRepository,
  })  : _quizRepository = quizRepository,
        super(QuestionsListLoading());

  final QuizRepository _quizRepository;

  @override
  Stream<QuestionsListState> mapEventToState(QuestionsListEvent event) async* {
    if (event is QuestionsListLoadRequested) {
      yield* _mapLoadRequestedToState(event);
    } else if (event is QuestionsListQuestionRemoved) {
      yield* _mapQuestionRemovedToState(event);
    }
  }

  Stream<QuestionsListState> _mapLoadRequestedToState(QuestionsListLoadRequested event) async* {
    yield QuestionsListLoading();

    try {
      QuerySnapshot snapshot = await _quizRepository.loadAllQuestions();

      List<Question> questions = snapshot.docs.map((e) => Question.fromDocumentSnapshot(e)).toList();

      if (questions.isEmpty) {
        yield const QuestionsListLoadSuccess([]);
      } else {
        yield QuestionsListLoadSuccess(questions);
      }
    } catch (error) {
      yield QuestionsListFail();
    }
  }

  Stream<QuestionsListState> _mapQuestionRemovedToState(QuestionsListQuestionRemoved event) async* {
    if (state is QuestionsListLoadSuccess) {
      final questions = (state as QuestionsListLoadSuccess).questions;

      final questionsCopy = List<Question>.from(questions);

      questions.removeWhere((element) => element.id == event.val.id);

      yield QuestionsListLoadSuccess(questionsCopy);
    }
  }
}
