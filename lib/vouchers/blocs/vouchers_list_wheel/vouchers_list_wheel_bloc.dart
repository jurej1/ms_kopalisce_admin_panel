import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coupon_repository/coupon_repository.dart';
import 'package:equatable/equatable.dart';

part 'vouchers_list_wheel_event.dart';
part 'vouchers_list_wheel_state.dart';

class VouchersListWheelBloc extends Bloc<VouchersListWheelEvent, VouchersListWheelState> {
  VouchersListWheelBloc({
    required CouponRepository couponRepository,
  })  : _couponRepository = couponRepository,
        super(VouchersListWheelLoading());

  final CouponRepository _couponRepository;

  @override
  Stream<VouchersListWheelState> mapEventToState(VouchersListWheelEvent event) async* {
    if (event is VouchersListWheelLoadRequested) {
      yield* _mapLoadRequestedToState();
    }
  }

  Stream<VouchersListWheelState> _mapLoadRequestedToState() async* {
    yield VouchersListWheelLoading();

    try {
      QuerySnapshot snapshot = await _couponRepository.loadVouchersWheelCollection();
      List<Voucher> vouchers = snapshot.docs.map((e) => Voucher.fromDocumentSnapshot(e)).toList();

      yield VouchersListWheelLoadSucces(vouchers);
    } catch (erorr) {
      yield VouchersListWheelFail();
    }
  }
}
