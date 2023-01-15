import 'package:bloc/bloc.dart';
import 'package:coupon_repository/coupon_repository.dart';
import 'package:equatable/equatable.dart';

part 'delete_voucher_state.dart';

class DeleteVoucherCubit extends Cubit<DeleteVoucherState> {
  DeleteVoucherCubit(
    this.couponRepository,
  ) : super(DeleteVoucherInitial());

  final CouponRepository couponRepository;

  Future<void> delete(Voucher voucher) async {
    emit(DeleteVoucherLoading());

    try {
      await couponRepository.deleteVoucher(voucher.id);

      emit(DeleteVoucherSuccess(voucher: voucher));
    } catch (e) {
      emit(DeleteVoucherFail());
    }
  }
}
