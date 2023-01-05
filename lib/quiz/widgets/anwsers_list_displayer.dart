import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../quiz.dart';

class AnwsersListDisplayer extends StatelessWidget {
  const AnwsersListDisplayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddQuestionFormBloc, AddQuestionFormState>(
      builder: (context, state) {
        if (state.anwsersList.value.isEmpty) {
          return Container();
        }
        final answers = state.anwsersList.value;
        return ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final item = answers[index];

            return ListTile(
              key: ValueKey(item),
              title: Text(item.text),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Checkbox(
                    value: item.isRight,
                    onChanged: (val) {
                      BlocProvider.of<AddQuestionFormBloc>(context).add(AddQuestionFormRightAnswerUpdated(item));
                    },
                  ),
                  IconButton(
                    onPressed: () {
                      BlocProvider.of<AddQuestionFormBloc>(context).add(AddQuestionFormAnswerRemoved(index));
                    },
                    icon: const Icon(Icons.delete),
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 10);
          },
          itemCount: answers.length,
        );
      },
    );
  }
}
