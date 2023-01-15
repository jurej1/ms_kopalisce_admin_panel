import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../info.dart';

class SubmittAdditionalInfo extends StatelessWidget {
  const SubmittAdditionalInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdditionalInfoFormBloc, AdditionalInfoFormState>(
      builder: (context, state) {
        return ElevatedButton(
          key: UniqueKey(),
          child: const Text('Submit'),
          onPressed: () {
            BlocProvider.of<AdditionalInfoFormBloc>(context).add(AdditionalInfoFormSubmitted());
          },
        );
      },
    );
  }
}
