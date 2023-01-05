import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../quiz.dart';

class AddAnswerView extends StatelessWidget {
  const AddAnswerView({Key? key}) : super(key: key);

  static route(BuildContext context, {AnswerForm? anwser}) {
    final questionBloc = BlocProvider.of<AddQuestionFormBloc>(context);

    return MaterialPageRoute(
      builder: (context) {
        return MultiBlocProvider(providers: [
          BlocProvider(
            create: (context) => AddAnswerFormBloc(anwser: anwser),
          ),
          BlocProvider.value(
            value: questionBloc,
          )
        ], child: const AddAnswerView());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddAnswerFormBloc, AddAnswerFormState>(
      listener: (context, state) {
        if (state.status.isSubmissionSuccess) {
          BlocProvider.of<AddQuestionFormBloc>(context).add(AddQuestionFormAnwserAdded(state.text.value));
          Navigator.of(context).pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        body: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            AnwserTextInput(),
            const SizedBox(height: 10),
            AddAnwserSubmitButton(),
          ],
        ),
      ),
    );
  }
}
