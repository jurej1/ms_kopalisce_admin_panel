import 'dart:developer';

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
    } else if (event is VouchersListItemRemoved) {
      yield* _mapItemRemovedToState(event);
    }
  }

  Stream<VouchersListState> _mapLoadRequestedToState() async* {
    try {
      yield VouchersListLoading();

      QuerySnapshot querySnapshot = await _couponRepository.loadAllVouchers();
      log(querySnapshot.docs.length.toString());
      List<Voucher> vouchers = querySnapshot.docs.map((e) => Voucher.fromDocumentSnapshot(e)).toList();

      yield VouchersListLoadSuccess(vouchers);
    } catch (error) {
      log(error.toString());
      yield VouchersListFail();
    }
  }

  Stream<VouchersListState> _mapItemRemovedToState(VouchersListItemRemoved event) async* {
    if (state is VouchersListLoadSuccess) {
      final currentList = (state as VouchersListLoadSuccess).vouchers;

      List<Voucher> copyList = List.from(currentList);

      copyList.removeWhere((element) => element.id == event.item.id);

      yield VouchersListLoadSuccess(copyList);
    }
  }
}
