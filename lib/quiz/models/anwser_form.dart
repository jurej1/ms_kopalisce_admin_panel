import 'package:quiz_repository/quiz_repository.dart';

class AnwserForm extends Anwser {
  const AnwserForm({
    required super.id,
    required super.text,
    required this.isRight,
  });

  final bool isRight;

  @override
  AnwserForm copyWith({
    bool? isRight,
    int? id,
    String? text,
  }) {
    return AnwserForm(
      id: id ?? this.id,
      isRight: isRight ?? this.isRight,
      text: text ?? this.text,
    );
  }

  @override
  List<Object?> get props => [id, text, isRight];

  static List<Anwser> toAnwsersList(List<AnwserForm> anwserFormList) {
    return anwserFormList.map((e) => Anwser(id: e.id, text: e.text)).toList();
  }
}
