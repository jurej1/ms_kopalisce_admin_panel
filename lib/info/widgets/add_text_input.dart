import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ms_kopalisce_admin_panel/info/info.dart';

class AddTextInput extends StatelessWidget {
  const AddTextInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdditionalInfoFormBloc, AdditionalInfoFormState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: state.val.value,
          decoration: InputDecoration(
            labelText: 'Message',
            errorText: state.val.invalid ? 'Invalid' : null,
          ),
          onChanged: (value) {
            BlocProvider.of<AdditionalInfoFormBloc>(context).add(AdditionalInfoValueUpdated(value));
          },
        );
      },
    );
  }
}
