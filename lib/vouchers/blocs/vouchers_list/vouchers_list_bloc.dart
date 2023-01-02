import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coupon_repository/coupon_repository.dart';
import 'package:equatable/equatable.dart';

part 'vouchers_list_event.dart';
part 'vouchers_list_state.dart';

class VouchersListBloc extends Bloc<VouchersListEvent, VouchersListState> {
  VouchersListBloc({
    required CouponRepository couponRepository,
  })  : _couponRepository = couponRepository,
        super(VouchersListLoading());

  final CouponRepository _couponRepository;

  @override
  Stream<VouchersListState> mapEventToState(VouchersListEvent event) async* {
    if (event is VouchersListLoadRequested) {
      yield* _mapLoadRequestedToState();
    }
  }

  Stream<VouchersListState> _mapLoadRequestedToState() async* {
    try {
      yield VouchersListLoading();

      QuerySnapshot querySnapshot = await _couponRepository.loadAllVouchers();

      List<Voucher> vouchers = querySnapshot.docs.map((e) => Voucher.fromDocumentSnapshot(e)).toList();

      yield VouchersListLoadSuccess(vouchers);
    } catch (error) {
      yield VouchersListFail();
    }
  }
}
