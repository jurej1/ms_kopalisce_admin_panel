part of 'delete_voucher_cubit.dart';

abstract class DeleteVoucherState extends Equatable {
  const DeleteVoucherState();

  @override
  List<Object> get props => [];
}

class DeleteVoucherInitial extends DeleteVoucherState {}

class DeleteVoucherLoading extends DeleteVoucherState {}

class DeleteVoucherSuccess extends DeleteVoucherState {
  final Voucher voucher;
  const DeleteVoucherSuccess({
    required this.voucher,
  });

  @override
  List<Object> get props => [voucher];
}

class DeleteVoucherFail extends DeleteVoucherState {}
