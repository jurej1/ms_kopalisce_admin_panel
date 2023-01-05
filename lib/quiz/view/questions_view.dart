import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ms_kopalisce_admin_panel/quiz/blocs/blocs.dart';
import 'package:ms_kopalisce_admin_panel/quiz/quiz.dart';
import 'package:quiz_repository/quiz_repository.dart';

class QuestionsView extends StatelessWidget {
  const QuestionsView({Key? key}) : super(key: key);

  static route(BuildContext context) {
    return MaterialPageRoute(builder: (context) {
      return BlocProvider(
        create: (context) => QuestionsListBloc(
          quizRepository: RepositoryProvider.of<QuizRepository>(context),
        )..add(QuestionsListLoadRequested()),
        child: const QuestionsView(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: BlocBuilder<QuestionsListBloc, QuestionsListState>(
          builder: (context, state) {
            if (state is QuestionsListLoadSuccess) {
              return QuestionsList(questions: state.questions);
            } else if (state is QuestionsListLoading) {
              return const _LoadingScreen();
            } else if (state is QuestionsListFail) {
              return const _ErrorScreen();
            }
            return Container();
          },
        ),
      ),
    );
  }
}

class _LoadingScreen extends StatelessWidget {
  const _LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _ErrorScreen extends StatelessWidget {
  const _ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Error. Please Try Again Later'),
    );
  }
}
