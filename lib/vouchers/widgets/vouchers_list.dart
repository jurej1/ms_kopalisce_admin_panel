import 'package:coupon_repository/coupon_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:info_repository/info_repository.dart';
import 'package:ms_kopalisce_admin_panel/vouchers/blocs/blocs.dart';

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

        return BlocProvider(
          create: (context) => DeleteVoucherCubit(
            RepositoryProvider.of<CouponRepository>(context),
          ),
          child: _ListItem(
            item: item,
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

class _ListItem extends StatelessWidget {
  const _ListItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Voucher item;

  @override
  Widget build(BuildContext context) {
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
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(VoucherQRDisplayer.route(context, data: item.voucherNumber));
                  },
                  child: const Text('QR'),
                ),
                BlocConsumer<DeleteVoucherCubit, DeleteVoucherState>(
                  listener: (context, state) {
                    if (state is DeleteVoucherSuccess) {
                      BlocProvider.of<VouchersListBloc>(context).add(VouchersListItemRemoved(item));
                    }
                  },
                  builder: (context, state) {
                    return IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        BlocProvider.of<DeleteVoucherCubit>(context).delete(item);
                      },
                    );
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
