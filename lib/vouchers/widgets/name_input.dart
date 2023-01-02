import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../vouchers.dart';

class VoucherNameInput extends StatelessWidget {
  const VoucherNameInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddVoucherFormBloc, AddVoucherFormState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: state.name.value,
          maxLength: VoucherNameFormz.maxLength,
          decoration: InputDecoration(
            labelText: 'Name',
            errorText: state.number.invalid ? 'Invalid' : null,
          ),
          onChanged: (val) {
            BlocProvider.of<AddVoucherFormBloc>(context).add(AddVoucherFormNameUpdated(val));
          },
        );
      },
    );
  }
}
