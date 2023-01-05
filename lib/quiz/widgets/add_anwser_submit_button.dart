import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ms_kopalisce_admin_panel/quiz/blocs/blocs.dart';

class AddAnwserSubmitButton extends StatelessWidget {
  const AddAnwserSubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddAnswerFormBloc, AddAnswerFormState>(
      builder: (context, state) {
        return ElevatedButton(
          key: UniqueKey(),
          child: const Text('Submit'),
          onPressed: () {
            BlocProvider.of<AddAnswerFormBloc>(context).add(AddAnswerFormSubmitted());
          },
        );
      },
    );
  }
}
