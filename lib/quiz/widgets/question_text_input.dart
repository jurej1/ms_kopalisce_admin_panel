import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../quiz.dart';

class QuestionTextInput extends StatelessWidget {
  const QuestionTextInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddQuestionFormBloc, AddQuestionFormState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: state.questionText.value,
          decoration: InputDecoration(
            labelText: 'Title',
            errorText: state.questionText.invalid ? 'Invalid' : null,
          ),
          onChanged: (value) {
            BlocProvider.of<AddQuestionFormBloc>(context).add(AddQuestionFormTextUpdated(value));
          },
        );
      },
    );
  }
}
