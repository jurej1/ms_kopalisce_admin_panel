import 'package:coupon_repository/coupon_repository.dart';
import 'package:flutter/material.dart';
import 'package:ms_kopalisce_admin_panel/vouchers/view/view.dart';

class VouchersListDisplayer extends StatelessWidget {
  const VouchersListDisplayer({Key? key, required this.vouchers}) : super(key: key);

  final List<Voucher> vouchers;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(20),
      itemBuilder: (context, index) {
        final item = vouchers[index];

        return Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${item.discountAmount.toStringAsFixed(0)} ${item.unit.toDisplayString()} OFF',
                          style: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text('Number: ${item.voucherNumber}'),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(VoucherQRDisplayer.route(context, data: item.voucherNumber));
                      },
                      child: const Text('QR'),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 20);
      },
      itemCount: vouchers.length,
    );
  }
}
