import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../vouchers.dart';

class VoucherDescriptionInput extends StatelessWidget {
  const VoucherDescriptionInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddVoucherFormBloc, AddVoucherFormState>(
      builder: (context, state) {
        return TextFormField(
          key: ValueKey(state.description),
          initialValue: state.description.value,
          maxLength: VoucherDescriptionFormz.maxLength,
          decoration: InputDecoration(
            labelText: 'Description',
            errorText: state.number.invalid ? 'Invalid' : null,
          ),
          onChanged: (val) {
            BlocProvider.of<AddVoucherFormBloc>(context).add(AddVoucherFormDescriptionUpdated(val));
          },
        );
      },
    );
  }
}
