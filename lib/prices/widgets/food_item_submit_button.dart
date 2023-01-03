import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../prices.dart';

class FoodItemSubmitButton extends StatelessWidget {
  const FoodItemSubmitButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddFoodItemBloc, AddFoodItemState>(
      builder: (context, state) {
        return ElevatedButton(
          key: UniqueKey(),
          child: const Text('Submit'),
          onPressed: () {
            BlocProvider.of<AddFoodItemBloc>(context).add(AddFoodItemFormSubmitted());
          },
        );
      },
    );
  }
}
