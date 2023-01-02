import 'package:coupon_repository/coupon_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../vouchers.dart';

class VoucherUnitInput extends StatelessWidget {
  const VoucherUnitInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddVoucherFormBloc, AddVoucherFormState>(
      builder: (context, state) {
        return DropdownButtonFormField<VoucherUnit>(
          value: state.unit.value,
          items: VoucherUnit.values.map((e) {
            return DropdownMenuItem(
              child: Text(describeEnum(e)),
              value: e,
              key: ValueKey(e),
            );
          }).toList(),
          onChanged: (val) {
            if (val != null) {
              BlocProvider.of<AddVoucherFormBloc>(context).add(AddVoucherFormUnitUpdated(val));
            }
          },
        );
      },
    );
  }
}
