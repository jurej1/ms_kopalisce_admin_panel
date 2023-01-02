import 'package:coupon_repository/coupon_repository.dart';
import 'package:formz/formz.dart';

enum VoucherUnitFormzValidtionError { invalid }

class VoucherUnitFormz extends FormzInput<VoucherUnit, VoucherUnitFormzValidtionError> {
  const VoucherUnitFormz.dirty(super.value) : super.dirty();
  const VoucherUnitFormz.pure(super.value) : super.pure();

  @override
  VoucherUnitFormzValidtionError? validator(VoucherUnit value) {
    return null;
  }
}
