import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../vouchers.dart';

class SubmitVoucherFormButton extends StatelessWidget {
  const SubmitVoucherFormButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddVoucherFormBloc, AddVoucherFormState>(
      builder: (context, state) {
        return ElevatedButton(
          key: UniqueKey(),
          child: const Text('Submit'),
          onPressed: () {
            BlocProvider.of<AddVoucherFormBloc>(context).add(AddVoucherFormSubmitted());
          },
        );
      },
    );
  }
}
