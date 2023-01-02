import 'package:formz/formz.dart';

enum BathroomTicketPriceFormzValidationError { invalid }

class BathroomTicketPriceFormz extends FormzInput<String, BathroomTicketPriceFormzValidationError> {
  const BathroomTicketPriceFormz.dirty(super.value) : super.dirty();
  const BathroomTicketPriceFormz.pure(super.value) : super.pure();

  @override
  BathroomTicketPriceFormzValidationError? validator(String value) {
    if (double.tryParse(value) == null) {
      return BathroomTicketPriceFormzValidationError.invalid;
    }
    return null;
  }
}
