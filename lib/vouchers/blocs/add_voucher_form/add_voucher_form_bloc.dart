import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coupon_repository/coupon_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:ms_kopalisce_admin_panel/vouchers/vouchers.dart';

part 'add_voucher_form_event.dart';
part 'add_voucher_form_state.dart';

class AddVoucherFormBloc extends Bloc<AddVoucherFormEvent, AddVoucherFormState> {
  AddVoucherFormBloc({
    Voucher? voucher,
    required CouponRepository couponRepository,
  })  : _couponRepository = couponRepository,
        super(AddVoucherFormState.initial(voucher));

  final CouponRepository _couponRepository;

  @override
  Stream<AddVoucherFormState> mapEventToState(AddVoucherFormEvent event) async* {
    if (event is AddVoucherFormDescriptionUpdated) {
      yield _mapDescriptionUpdatedToState(event);
    } else if (event is AddVoucherFormNameUpdated) {
      yield _mapNameUpadetdToState(event);
    } else if (event is AddVoucherFormDiscountAmountUpdated) {
      yield _amountUpdatedToState(event);
    } else if (event is AddVoucherFormUnitUpdated) {
      yield _mapUnitUpdatedToState(event);
    } else if (event is AddVoucherFormVoucherNumberUpdated) {
      yield _mapVoucherNumberUpdatedToState(event);
    } else if (event is AddVoucherFormSubmitted) {
      yield* _mapFormSubmittedToState();
    }
  }

  AddVoucherFormState _mapDescriptionUpdatedToState(AddVoucherFormDescriptionUpdated event) {
    final description = VoucherDescriptionFormz.dirty(event.val);

    return state.copyWith(
      description: description,
      status: Formz.validate([
        description,
        state.discountAmount,
        state.name,
        state.number,
        state.unit,
      ]),
    );
  }

  AddVoucherFormState _mapNameUpadetdToState(AddVoucherFormNameUpdated event) {
    final name = VoucherNameFormz.dirty(event.val);

    return state.copyWith(
      name: name,
      status: Formz.validate([
        name,
        state.description,
        state.discountAmount,
        state.number,
        state.unit,
      ]),
    );
  }

  AddVoucherFormState _amountUpdatedToState(AddVoucherFormDiscountAmountUpdated event) {
    final amount = VoucherDiscountAmountFormz.dirty(event.val);

    return state.copyWith(
      discountAmount: amount,
      status: Formz.validate([
        amount,
        state.description,
        state.name,
        state.number,
        state.unit,
      ]),
    );
  }

  AddVoucherFormState _mapUnitUpdatedToState(AddVoucherFormUnitUpdated event) {
    final unit = VoucherUnitFormz.dirty(event.val);

    return state.copyWith(
      unit: unit,
      status: Formz.validate([
        unit,
        state.description,
        state.discountAmount,
        state.number,
        state.name,
      ]),
    );
  }

  AddVoucherFormState _mapVoucherNumberUpdatedToState(AddVoucherFormVoucherNumberUpdated event) {
    final number = VoucherNumberFormz.dirty(event.val);

    return state.copyWith(
      number: number,
      status: Formz.validate([
        number,
        state.description,
        state.discountAmount,
        state.name,
        state.unit,
      ]),
    );
  }

  Stream<AddVoucherFormState> _mapFormSubmittedToState() async* {
    final number = VoucherNumberFormz.dirty(state.number.value);
    final description = VoucherDescriptionFormz.dirty(state.description.value);
    final discountAmount = VoucherDiscountAmountFormz.dirty(state.discountAmount.value);
    final name = VoucherNameFormz.dirty(state.name.value);
    final unit = VoucherUnitFormz.dirty(state.unit.value);

    final status = Formz.validate([number, description, discountAmount, name, unit]);

    yield state.copyWith(
      status: status,
      description: description,
      discountAmount: discountAmount,
      name: name,
      number: number,
      unit: unit,
    );

    if (state.status.isValidated) {
      try {
        yield state.copyWith(status: FormzStatus.submissionInProgress);

        Voucher voucher = Voucher(
          description: state.description.value,
          discountAmount: state.discountAmount.toInt(),
          id: '',
          name: state.name.value,
          unit: state.unit.value,
          voucherNumber: state.number.value,
        );

        log('DiscountAMount: $discountAmount');

        DocumentReference reference = await _couponRepository.addVoucher(voucher);

        voucher = voucher.copyWith(id: reference.id);

        yield state.copyWith(
          status: FormzStatus.submissionSuccess,
          voucher: voucher,
        );
      } catch (e) {
        yield state.copyWith(
          status: FormzStatus.submissionFailure,
        );
      }
    }
  }
}
