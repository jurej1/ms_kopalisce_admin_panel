import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:price_repository/price_repository.dart';

import '../prices.dart';

class FoodItemTypeInput extends StatelessWidget {
  const FoodItemTypeInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddFoodItemBloc, AddFoodItemState>(
      builder: (context, state) {
        return DropdownButton<FoodItemType>(
          value: state.type.value,
          items: FoodItemType.values
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
            if (value != null) BlocProvider.of<AddFoodItemBloc>(context).add(AddFoodItemTypeUpdated(value));
          },
        );
      },
    );
  }
}
