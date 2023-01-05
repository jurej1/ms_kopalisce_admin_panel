import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../quiz.dart';

class AddAnwserButton extends StatelessWidget {
  const AddAnwserButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddQuestionFormBloc, AddQuestionFormState>(
      builder: (context, state) {
        bool isActive = state.anwsersList.value.length < state.anwsersList.maxAnwsersLenght;

        return ElevatedButton(
          onPressed: isActive
              ? () {
                  Navigator.of(context).push(AddAnswerView.route(context));
                }
              : null,
          child: const Text('Add Anwser'),
        );
      },
    );
  }
}
