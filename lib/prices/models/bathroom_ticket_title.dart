import 'package:formz/formz.dart';

enum BathroomTicketFormzValidationError { invalid }

class BathroomTicketTitleFormz extends FormzInput<String, BathroomTicketFormzValidationError> {
  const BathroomTicketTitleFormz.dirty(super.value) : super.dirty();
  const BathroomTicketTitleFormz.pure(super.value) : super.pure();

  int get maxLenght => 100;

  @override
  BathroomTicketFormzValidationError? validator(String value) {
    if (value.length > maxLenght) {
      return BathroomTicketFormzValidationError.invalid;
    }
    return null;
  }
}
