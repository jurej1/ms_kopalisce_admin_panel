import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:price_repository/price_repository.dart';
import 'package:formz/formz.dart';

import '../prices.dart';

class AddBathroomTicketView extends StatelessWidget {
  const AddBathroomTicketView({Key? key}) : super(key: key);

  static MaterialPageRoute route(BuildContext context) {
    return MaterialPageRoute(
      builder: (context) {
        return BlocProvider(
          create: (_) => AddBathroomTicketBloc(
            priceRepository: RepositoryProvider.of<PriceRepository>(context),
          ),
          child: const AddBathroomTicketView(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AddBathroomTicketBloc, AddBathroomTicketState>(
        builder: (context, state) {
          if (state.status.isSubmissionInProgress) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              BathroomTicketTitleInput(),
              const SizedBox(height: 10),
              BathroomTicketPriceInput(),
              const SizedBox(height: 10),
              BathroomTicketTypeInput(),
              const SizedBox(height: 10),
              BathroomFormSubmitButton(),
            ],
          );
        },
      ),
    );
  }
}
