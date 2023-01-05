part of 'add_answer_form_bloc.dart';

class AddAnswerFormState extends Equatable {
  const AddAnswerFormState({
    this.status = FormzStatus.pure,
    this.text = const AnwserTextFormz.pure(''),
  });

  final FormzStatus status;
  final AnwserTextFormz text;

  @override
  List<Object> get props => [status, text];

  AddAnswerFormState copyWith({
    FormzStatus? status,
    AnwserTextFormz? text,
  }) {
    return AddAnswerFormState(
      status: status ?? this.status,
      text: text ?? this.text,
    );
  }

  factory AddAnswerFormState.initial(AnswerForm? anwser) {
    if (anwser != null) {
      return AddAnswerFormState(
        status: FormzStatus.pure,
        text: AnwserTextFormz.pure(anwser.text),
      );
    }
    return const AddAnswerFormState();
  }
}
