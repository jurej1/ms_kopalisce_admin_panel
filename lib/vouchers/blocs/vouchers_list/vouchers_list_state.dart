part of 'vouchers_list_bloc.dart';

abstract class VouchersListState {
  const VouchersListState();
}

class VouchersListLoading extends VouchersListState {}

class VouchersListLoadSuccess extends VouchersListState {
  final List<Voucher> vouchers;

  const VouchersListLoadSuccess(this.vouchers);
}

class VouchersListFail extends VouchersListState {}
