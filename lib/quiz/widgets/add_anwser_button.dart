import 'package:flutter/material.dart';

import '../view/view.dart';

class AddAnwserButton extends StatelessWidget {
  const AddAnwserButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text('Add Anwser'),
      onPressed: () {
        Navigator.of(context).push(AddAnswerView.route(context));
      },
    );
  }
}
