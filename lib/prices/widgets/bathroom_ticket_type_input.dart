import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:price_repository/price_repository.dart';

import '../prices.dart';

class BathroomTicketTypeInput extends StatelessWidget {
  const BathroomTicketTypeInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddBathroomTicketBloc, AddBathroomTicketState>(
      builder: (context, state) {
        return DropdownButton<TicketType>(
          value: state.type.value,
          items: TicketType.values
              .map(
                (e) => DropdownMenuItem(
                  value: e,
                  child: Text(
                    e.toStringReadable(),
                  ),
                ),
              )
              .toList(),
          onChanged: (value) {
            if (value != null) BlocProvider.of<AddBathroomTicketBloc>(context).add(AddBathroomTicketTypeUpdated(value));
          },
        );
      },
    );
  }
}
