import 'package:formz/formz.dart';

enum QuestionTextFormzValidationError { invalid }

class QuestionTextFormz extends FormzInput<String, QuestionTextFormzValidationError> {
  const QuestionTextFormz.dirty(super.value) : super.dirty();
  const QuestionTextFormz.pure(super.value) : super.pure();

  @override
  QuestionTextFormzValidationError? validator(String value) {
    return null;
  }
}
