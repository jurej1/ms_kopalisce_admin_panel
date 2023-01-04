import 'package:formz/formz.dart';
import 'package:quiz_repository/quiz_repository.dart';

enum AnwserListFormzValidationError { invalid }

class AnwserListFormz extends FormzInput<List<Anwser>, AnwserListFormzValidationError> {
  const AnwserListFormz.dirty(super.value) : super.dirty();
  const AnwserListFormz.pure(super.value) : super.pure();

  int get maxAnwsersLenght => 4;
  @override
  AnwserListFormzValidationError? validator(List<Anwser> value) {
    if (value.length > maxAnwsersLenght) {
      return AnwserListFormzValidationError.invalid;
    }
    return null;
  }
}
