part of 'vouchers_list_wheel_bloc.dart';

abstract class VouchersListWheelState extends Equatable {
  const VouchersListWheelState();

  @override
  List<Object> get props => [];
}

class VouchersListWheelLoading extends VouchersListWheelState {}

class VouchersListWheelLoadSucces extends VouchersListWheelState {
  final List<Voucher> vouchers;

  const VouchersListWheelLoadSucces(this.vouchers);
}

class VouchersListWheelFail extends VouchersListWheelState {}
