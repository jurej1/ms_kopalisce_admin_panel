part of 'vouchers_list_wheel_bloc.dart';

abstract class VouchersListWheelState extends Equatable {
  const VouchersListWheelState();

  @override
  List<Object> get props => [];
}

class VouchersListWheelLoading extends VouchersListWheelState {}

class VouchersListWheelLoadSuccess extends VouchersListWheelState {
  final List<Voucher> vouchers;

  const VouchersListWheelLoadSuccess(this.vouchers);
}

class VouchersListWheelFail extends VouchersListWheelState {}
