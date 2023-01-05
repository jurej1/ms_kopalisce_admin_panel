import 'package:quiz_repository/quiz_repository.dart';

class AnswerForm extends Answer {
  const AnswerForm({
    required super.id,
    required super.text,
    required this.isRight,
  });

  final bool isRight;

  @override
  AnswerForm copyWith({
    bool? isRight,
    int? id,
    String? text,
  }) {
    return AnswerForm(
      id: id ?? this.id,
      isRight: isRight ?? this.isRight,
      text: text ?? this.text,
    );
  }

  @override
  List<Object?> get props => [id, text, isRight];

  static List<Answer> toAnwsersList(List<AnswerForm> anwserFormList) {
    return anwserFormList.map((e) => Answer(id: e.id, text: e.text)).toList();
  }
}
