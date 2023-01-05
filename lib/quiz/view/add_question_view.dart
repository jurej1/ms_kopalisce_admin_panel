import 'package:flutter/material.dart';
import 'package:ms_kopalisce_admin_panel/quiz/quiz.dart';

class AddQuestionFormView extends StatelessWidget {
  const AddQuestionFormView({Key? key}) : super(key: key);

  static MaterialPageRoute route(BuildContext context) {
    return MaterialPageRoute(
      builder: (context) {
        return const AddQuestionFormView();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          AnwserTextInput(),
        ],
      ),
    );
  }
}
