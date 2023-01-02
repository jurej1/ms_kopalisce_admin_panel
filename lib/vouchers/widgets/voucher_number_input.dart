import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocs.dart';

class VoucherNumberInput extends StatelessWidget {
  const VoucherNumberInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddVoucherFormBloc, AddVoucherFormState>(
      builder: (context, state) {
        return TextFormField(
          key: const ValueKey('voucherNumber'),
          initialValue: state.description.value,
          decoration: InputDecoration(
            labelText: 'Voucher Number',
            errorText: state.number.invalid ? 'Invalid' : null,
          ),
          onChanged: (val) {
            BlocProvider.of<AddVoucherFormBloc>(context).add(AddVoucherFormVoucherNumberUpdated(val));
          },
          keyboardType: TextInputType.number,
        );
      },
    );
  }
}
