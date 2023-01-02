part of 'add_voucher_form_bloc.dart';

abstract class AddVoucherFormEvent extends Equatable {
  const AddVoucherFormEvent();

  @override
  List<Object> get props => [];
}

class AddVoucherFormNameUpdated extends AddVoucherFormEvent {
  final String val;

  const AddVoucherFormNameUpdated(this.val);

  @override
  List<Object> get props => [val];
}

class AddVoucherFormDescriptionUpdated extends AddVoucherFormEvent {
  final String val;

  const AddVoucherFormDescriptionUpdated(this.val);

  @override
  List<Object> get props => [val];
}

class AddVoucherFormDiscountAmountUpdated extends AddVoucherFormEvent {
  final String val;

  const AddVoucherFormDiscountAmountUpdated(this.val);

  @override
  List<Object> get props => [val];
}

class AddVoucherFormUnitUpdated extends AddVoucherFormEvent {
  final VoucherUnit val;

  const AddVoucherFormUnitUpdated(this.val);

  @override
  List<Object> get props => [val];
}

class AddVoucherFormVoucherNumberUpdated extends AddVoucherFormEvent {
  final String val;

  const AddVoucherFormVoucherNumberUpdated(this.val);

  @override
  List<Object> get props => [val];
}

class AddVoucherFormSubmitted extends AddVoucherFormEvent {}
