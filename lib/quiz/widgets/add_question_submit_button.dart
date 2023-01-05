import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

import '../quiz.dart';

class AddQuestionSubmitButton extends StatelessWidget {
  const AddQuestionSubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddQuestionFormBloc, AddQuestionFormState>(
      builder: (context, state) {
        final bool isLoading = state.status.isSubmissionInProgress;
        return ElevatedButton(
          key: UniqueKey(),
          child: isLoading ? const CircularProgressIndicator() : const Text('Submit'),
          onPressed: () {
            BlocProvider.of<AddQuestionFormBloc>(context).add(AddQuestionFormSubmitted());
          },
        );
      },
    );
  }
}
