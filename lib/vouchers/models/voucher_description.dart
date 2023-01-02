import 'package:flutter/cupertino.dart';
import 'package:formz/formz.dart';

enum VoucherDescriptionFormzValidationError { invalid }

class VoucherDescriptionFormz extends FormzInput<String, VoucherDescriptionFormzValidationError> {
  const VoucherDescriptionFormz.dirty(super.value) : super.dirty();
  const VoucherDescriptionFormz.pure(super.value) : super.pure();

  static int get maxLength => 200;

  @override
  VoucherDescriptionFormzValidationError? validator(String value) {
    if (value.length > maxLength) {
      return VoucherDescriptionFormzValidationError.invalid;
    }
    return null;
  }
}
