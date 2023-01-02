import 'package:formz/formz.dart';

enum VoucherDiscountAmountFormzValidationError { invalid }

class VoucherDiscountAmountFormz extends FormzInput<String, VoucherDiscountAmountFormzValidationError> {
  const VoucherDiscountAmountFormz.dirty(super.value) : super.dirty();
  const VoucherDiscountAmountFormz.pure(super.value) : super.pure();

  @override
  VoucherDiscountAmountFormzValidationError? validator(String value) {
    final b = RegExp(r'^[0-9]+$').hasMatch(value); // string contains only numbers == true

    if (b == false) {
      return VoucherDiscountAmountFormzValidationError.invalid;
    }
    return null;
  }

  int toInt() {
    if (valid) {
      return int.parse(value);
    }
    return 0;
  }
}
