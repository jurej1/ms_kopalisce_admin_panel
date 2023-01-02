part of 'vouchers_list_bloc.dart';

abstract class VouchersListState extends Equatable {
  const VouchersListState();

  @override
  List<Object> get props => [];
}

class VouchersListLoading extends VouchersListState {}

class VouchersListLoadSuccess extends VouchersListState {
  final List<Voucher> vouchers;

  const VouchersListLoadSuccess(this.vouchers);

  @override
  List<Object> get props => [vouchers];
}

class VouchersListFail extends VouchersListState {}
