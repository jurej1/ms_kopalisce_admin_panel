import 'package:formz/formz.dart';

enum AnwserTextFormzValidationError { invalid }

class AnwserTextFormz extends FormzInput<String, AnwserTextFormzValidationError> {
  const AnwserTextFormz.dirty(super.value) : super.dirty();
  const AnwserTextFormz.pure(super.value) : super.pure();

  static int get maxLength => 100;

  @override
  AnwserTextFormzValidationError? validator(String value) {
    if (value.length > maxLength) {
      return AnwserTextFormzValidationError.invalid;
    }
    return null;
  }
}
