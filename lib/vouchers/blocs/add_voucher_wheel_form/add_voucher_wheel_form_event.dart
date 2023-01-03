part of 'add_voucher_wheel_form_bloc.dart';

abstract class AddVoucherWheelFormEvent extends Equatable {
  const AddVoucherWheelFormEvent();

  @override
  List<Object> get props => [];
}

class AddVoucherWheelFormNameUpdated extends AddVoucherWheelFormEvent {
  final String val;

  const AddVoucherWheelFormNameUpdated(this.val);

  @override
  List<Object> get props => [val];
}

class AddVoucherWheelFormDescriptionUpdated extends AddVoucherWheelFormEvent {
  final String val;

  const AddVoucherWheelFormDescriptionUpdated(this.val);

  @override
  List<Object> get props => [val];
}

class AddVoucherWheelFormDiscountAmountUpdated extends AddVoucherWheelFormEvent {
  final String val;

  const AddVoucherWheelFormDiscountAmountUpdated(this.val);

  @override
  List<Object> get props => [val];
}

class AddVoucherWheelFormUnitUpdated extends AddVoucherWheelFormEvent {
  final VoucherUnit val;

  const AddVoucherWheelFormUnitUpdated(this.val);

  @override
  List<Object> get props => [val];
}

class AddVoucherWheelFormVoucherNumberUpdated extends AddVoucherWheelFormEvent {
  final String val;

  const AddVoucherWheelFormVoucherNumberUpdated(this.val);

  @override
  List<Object> get props => [val];
}

class AddVoucherWheelFormSubmitted extends AddVoucherWheelFormEvent {}
