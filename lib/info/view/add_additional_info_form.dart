import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:info_repository/info_repository.dart';
import 'package:ms_kopalisce_admin_panel/info/widgets/submit_additional_info.dart';

import '../info.dart';

class AddAdditionalInfoForm extends StatelessWidget {
  const AddAdditionalInfoForm({Key? key}) : super(key: key);

  static route(BuildContext context) {
    return MaterialPageRoute(
      builder: (context) {
        return BlocProvider(
          create: (context) => AdditionalInfoFormBloc(
            infoRepository: RepositoryProvider.of<InfoRepository>(context),
          ),
          child: const AddAdditionalInfoForm(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const AddTextInput(),
          const SubmittAdditionalInfo(),
        ],
      ),
    );
  }
}
