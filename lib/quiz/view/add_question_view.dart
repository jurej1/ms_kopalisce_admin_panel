import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ms_kopalisce_admin_panel/quiz/quiz.dart';
import 'package:quiz_repository/quiz_repository.dart';

class AddQuestionFormView extends StatelessWidget {
  const AddQuestionFormView({Key? key}) : super(key: key);

  static MaterialPageRoute route(BuildContext context) {
    return MaterialPageRoute(
      builder: (context) {
        return BlocProvider(
          create: (context) => AddQuestionFormBloc(
            quizRepository: RepositoryProvider.of<QuizRepository>(context),
          ),
          child: const AddQuestionFormView(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          const AddQuestionSubmitButton(),
          const SizedBox(width: 10),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          const QuestionTextInput(),
          const SizedBox(height: 20),
          AddAnwserButton(),
          const SizedBox(height: 20),
          AnwsersListDisplayer(),
        ],
      ),
    );
  }
}
