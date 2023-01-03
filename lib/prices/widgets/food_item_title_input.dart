import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../prices.dart';

class FoodItemTitleInput extends StatelessWidget {
  const FoodItemTitleInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddFoodItemBloc, AddFoodItemState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: state.title.value,
          decoration: InputDecoration(
            labelText: 'Title',
            errorText: state.title.invalid ? 'Invalid' : null,
          ),
          onChanged: (value) {
            BlocProvider.of<AddFoodItemBloc>(context).add(AddFoodItemTitleUpdated(value));
          },
        );
      },
    );
  }
}
