import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ms_kopalisce_admin_panel/quiz/blocs/blocs.dart';
import 'package:quiz_repository/quiz_repository.dart';

class QuestionsList extends StatelessWidget {
  const QuestionsList({
    Key? key,
    required List<Question> questions,
  })  : _questions = questions,
        super(key: key);

  final List<Question> _questions;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemBuilder: (context, index) {
        final item = _questions[index];

        return BlocProvider(
          key: ValueKey(item),
          create: (context) => DeleteQuestionCubit(
            RepositoryProvider.of<QuizRepository>(context),
          ),
          child: _ListItem(
            item: item,
            key: ValueKey(item),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 10);
      },
      itemCount: _questions.length,
    );
  }
}

class _ListItem extends StatelessWidget {
  const _ListItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Question item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.questionText),
                const SizedBox(height: 5),
                const Text('Answers'),
                ...item.anwsers.map(
                  (e) {
                    final bool isRight = e.id == item.rightAnwser.id;
                    return Text(
                      e.text,
                      style: TextStyle(
                        color: isRight ? Colors.blue : Colors.black,
                      ),
                    );
                  },
                ).toList(),
              ],
            ),
            const Spacer(),
            BlocConsumer<DeleteQuestionCubit, DeleteQuestionState>(
              listener: (context, state) {
                if (state is DeleteQuestionSuccess) {
                  BlocProvider.of<QuestionsListBloc>(context).add(QuestionsListQuestionRemoved(item));
                }
              },
              builder: (context, state) {
                return IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    BlocProvider.of<DeleteQuestionCubit>(context).delete(item);
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
