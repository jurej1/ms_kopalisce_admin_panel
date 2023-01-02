import 'package:formz/formz.dart';

enum VoucherDiscountAmountFormzValidationError { invalid }

class VoucherDiscountAmountFormz extends FormzInput<String, VoucherDiscountAmountFormzValidationError> {
  const VoucherDiscountAmountFormz.dirty(super.value) : super.dirty();
  const VoucherDiscountAmountFormz.pure(super.value) : super.pure();

  @override
  VoucherDiscountAmountFormzValidationError? validator(String value) {
    if (int.tryParse(value) != null) {
      return null;
    }
    return VoucherDiscountAmountFormzValidationError.invalid;
  }

  int toInt() {
    if (valid) {
      return int.parse(value);
    }
    return 0;
  }
}
