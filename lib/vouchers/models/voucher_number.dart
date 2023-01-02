import 'package:formz/formz.dart';

enum VoucherNumberFormzValidationError { invalid }

class VoucherNumberFormz extends FormzInput<String, VoucherNumberFormzValidationError> {
  const VoucherNumberFormz.dirty(super.value) : super.dirty();
  const VoucherNumberFormz.pure(super.value) : super.pure();

  @override
  VoucherNumberFormzValidationError? validator(String value) {
    final b = RegExp(r'^[0-9]+$').hasMatch(value); // string contains only numbers == true

    if (b == false) {
      return VoucherNumberFormzValidationError.invalid;
    }
    return null;
  }
}
