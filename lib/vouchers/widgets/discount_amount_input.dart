import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../vouchers.dart';

class VoucherDiscountAmountInput extends StatelessWidget {
  const VoucherDiscountAmountInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddVoucherFormBloc, AddVoucherFormState>(
      builder: (context, state) {
        return TextFormField(
          key: const ValueKey('discountAmount'),
          initialValue: state.discountAmount.value,
          decoration: InputDecoration(
            labelText: 'Discount Amount',
            errorText: state.discountAmount.invalid ? 'Invalid' : null,
          ),
          onChanged: (val) {
            BlocProvider.of<AddVoucherFormBloc>(context).add(AddVoucherFormDiscountAmountUpdated(val));
          },
          keyboardType: TextInputType.number,
        );
      },
    );
  }
}
