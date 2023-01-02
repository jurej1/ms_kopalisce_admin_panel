import 'package:coupon_repository/coupon_repository.dart';
import 'package:flutter/material.dart';

class VouchersListDisplayer extends StatelessWidget {
  const VouchersListDisplayer({Key? key, required this.vouchers}) : super(key: key);

  final List<Voucher> vouchers;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Container();
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 20);
      },
      itemCount: vouchers.length,
    );
  }
}
