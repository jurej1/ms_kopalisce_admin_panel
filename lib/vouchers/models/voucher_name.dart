import 'package:formz/formz.dart';

enum VoucherNameFormzValidationError { invalid }

class VoucherNameFormz extends FormzInput<String, VoucherNameFormzValidationError> {
  const VoucherNameFormz.dirty(super.value) : super.dirty();
  const VoucherNameFormz.pure(super.value) : super.pure();

  @override
  VoucherNameFormzValidationError? validator(String value) {
    if (value.length > 100) {
      return VoucherNameFormzValidationError.invalid;
    }
    return null;
  }
}
