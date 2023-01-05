import 'package:flutter/material.dart';
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
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
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
