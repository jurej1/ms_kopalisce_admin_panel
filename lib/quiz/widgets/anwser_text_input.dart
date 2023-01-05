import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../quiz.dart';

class AnwserTextInput extends StatelessWidget {
  const AnwserTextInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddAnswerFormBloc, AddAnswerFormState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: state.text.value,
          decoration: InputDecoration(
            labelText: 'Title',
            errorText: state.text.invalid ? 'Invalid' : null,
          ),
          onChanged: (value) {
            BlocProvider.of<AddAnswerFormBloc>(context).add(AddAnswerFormTextUpdated(value));
          },
        );
      },
    );
  }
}
