import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:price_repository/price_repository.dart';
import 'package:formz/formz.dart';

import '../prices.dart';

class AddFoodItemFormView extends StatelessWidget {
  const AddFoodItemFormView({Key? key}) : super(key: key);

  static MaterialPageRoute route(BuildContext context) {
    return MaterialPageRoute(
      builder: (context) {
        return BlocProvider(
          create: (context) => AddFoodItemBloc(
            priceRepository: RepositoryProvider.of<PriceRepository>(context),
          ),
          child: const AddFoodItemFormView(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AddFoodItemBloc, AddFoodItemState>(
        builder: (context, state) {
          if (state.status.isSubmissionInProgress) {
            return const _LoadingScreen();
          }
          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              FoodItemTitleInput(),
              FoodItemPriceInput(),
              FoodItemTypeInput(),
              FoodItemSubmitButton(),
            ],
          );
        },
      ),
    );
  }
}

class _LoadingScreen extends StatelessWidget {
  const _LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
