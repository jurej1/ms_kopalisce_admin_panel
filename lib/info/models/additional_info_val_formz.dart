import 'package:formz/formz.dart';

enum AdditionalInfoValValidationError { invalid }

class AdditionalInfoValFormz extends FormzInput<String, AdditionalInfoValValidationError> {
  const AdditionalInfoValFormz.dirty(super.value) : super.dirty();
  const AdditionalInfoValFormz.pure(super.value) : super.pure();

  @override
  AdditionalInfoValValidationError? validator(String value) {
    return null;
  }
}
