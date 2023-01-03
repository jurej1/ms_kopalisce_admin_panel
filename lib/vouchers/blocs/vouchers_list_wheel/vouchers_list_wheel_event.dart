part of 'vouchers_list_wheel_bloc.dart';

abstract class VouchersListWheelEvent extends Equatable {
  const VouchersListWheelEvent();

  @override
  List<Object> get props => [];
}

class VouchersListWheelLoadRequested extends VouchersListWheelEvent {}
