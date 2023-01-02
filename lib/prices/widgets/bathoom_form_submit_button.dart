import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../prices.dart';

class BathroomFormSubmitButton extends StatelessWidget {
  const BathroomFormSubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddBathroomTicketBloc, AddBathroomTicketState>(
      builder: (context, state) {
        return ElevatedButton(
          key: UniqueKey(),
          child: const Text('Submit'),
          onPressed: () {
            BlocProvider.of<AddBathroomTicketBloc>(context).add(AddBathroomTicketFormSubmitted());
          },
        );
      },
    );
  }
}
