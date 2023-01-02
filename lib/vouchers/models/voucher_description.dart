import 'package:formz/formz.dart';

enum VoucherDescriptionFormzValidationError { invalid }

class VoucherDescriptionFormz extends FormzInput<String, VoucherDescriptionFormzValidationError> {
  const VoucherDescriptionFormz.dirty(super.value) : super.dirty();
  const VoucherDescriptionFormz.pure(super.value) : super.pure();

  @override
  VoucherDescriptionFormzValidationError? validator(String value) {
    if (value.length > 200) {
      return VoucherDescriptionFormzValidationError.invalid;
    }
    return null;
  }
}
