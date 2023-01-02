import 'package:formz/formz.dart';
import 'package:price_repository/price_repository.dart';

enum BathroomTicketTypeFormzValidationError { invalid }

class BathroomTicketTypeFormz extends FormzInput<TicketType, BathroomTicketTypeFormzValidationError> {
  const BathroomTicketTypeFormz.dirty(super.value) : super.dirty();
  const BathroomTicketTypeFormz.pure(super.value) : super.pure();

  @override
  BathroomTicketTypeFormzValidationError? validator(TicketType value) {
    return null;
  }
}
