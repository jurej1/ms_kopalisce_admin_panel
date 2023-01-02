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
          create: (context) => AddBathroomTicketBloc(
            priceRepository: RepositoryProvider.of<PriceRepository>(context),
          ),
          child: const AddBathroomTicketView(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddBathroomTicketBloc, AddBathroomTicketState>(
      builder: (context, state) {
        if (state.status.isSubmissionInProgress) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView(
          children: [
            BathroomTicketTitleInput(),
            BathroomTicketPriceInput(),
            BathroomTicketTypeInput(),
            BathroomFormSubmitButton(),
          ],
        );
      },
    );
  }
}
