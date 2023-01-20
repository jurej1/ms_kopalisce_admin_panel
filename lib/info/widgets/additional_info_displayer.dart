import 'package:flutter/material.dart';
import 'package:info_repository/info_repository.dart';

class AdditionalInfoDisplayer extends StatelessWidget {
  const AdditionalInfoDisplayer({Key? key, required this.values}) : super(key: key);

  final List<AdditionalInfo> values;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final val = values[index];
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(val.val),
          ),
        );
      },
      itemCount: values.length,
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 4,
        );
      },
    );
  }
}
