import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../prices.dart';

class BathroomTicketPriceInput extends StatelessWidget {
  const BathroomTicketPriceInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddBathroomTicketBloc, AddBathroomTicketState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: state.price.value,
          decoration: InputDecoration(
            labelText: 'Price',
            errorText: state.price.invalid ? 'Invalid' : null,
          ),
          onChanged: (value) {
            BlocProvider.of<AddBathroomTicketBloc>(context).add(AddBathroomTicketPriceUpdated(value));
          },
        );
      },
    );
  }
}
