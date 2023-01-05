import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../quiz.dart';

class AddAnswerView extends StatelessWidget {
  const AddAnswerView({Key? key}) : super(key: key);

  static route(BuildContext context, {AnswerForm? anwser}) {
    return MaterialPageRoute(builder: (context) {
      return BlocProvider(
        create: (context) => AddAnswerFormBloc(anwser: anwser),
        child: const AddAnswerView(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [],
      ),
    );
  }
}
