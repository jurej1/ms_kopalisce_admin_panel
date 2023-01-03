import 'package:coupon_repository/coupon_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ms_kopalisce_admin_panel/vouchers/blocs/add_voucher_form/add_voucher_form_bloc.dart';

import '../widgets/widgets.dart';

class AddVoucherFormView extends StatelessWidget {
  const AddVoucherFormView({Key? key}) : super(key: key);

  static routeNormal(BuildContext context) {
    return MaterialPageRoute(
      builder: (_) {
        return BlocProvider(
          create: (_) => AddVoucherFormBloc(
            couponRepository: RepositoryProvider.of<CouponRepository>(context),
            type: VoucherStorageType.normal,
          ),
          child: const AddVoucherFormView(),
        );
      },
    );
  }

  static routeAddToWheel(BuildContext context) {
    return MaterialPageRoute(
      builder: (_) {
        return BlocProvider(
          create: (_) => AddVoucherFormBloc(
            couponRepository: RepositoryProvider.of<CouponRepository>(context),
            type: VoucherStorageType.wheel,
          ),
          child: const AddVoucherFormView(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Voucher'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            VoucherNameInput(),
            VoucherNumberInput(),
            VoucherUnitInput(),
            VoucherDiscountAmountInput(),
            VoucherDescriptionInput(),
            SubmitVoucherFormButton(),
          ],
        ),
      ),
    );
  }
}
