part of 'vouchers_list_bloc.dart';

abstract class VouchersListEvent extends Equatable {
  const VouchersListEvent();

  @override
  List<Object> get props => [];
}

class VouchersListLoadRequested extends VouchersListEvent {}
