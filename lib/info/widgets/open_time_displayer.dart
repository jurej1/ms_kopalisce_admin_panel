import 'package:flutter/material.dart';
import 'package:info_repository/info_repository.dart';
import 'package:ms_kopalisce_admin_panel/info/info.dart';

class OpenTimeDisplayer extends StatelessWidget {
  const OpenTimeDisplayer({
    Key? key,
    required this.openTime,
    required this.status,
  }) : super(key: key);

  final OpenTime openTime;
  final FormStatus status;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final dayOfTheWeek = DayOfWeek.values[index];

        final OpenDay? val = openTime.getSpecificDayTime(dayOfTheWeek);

        return OpenTimeTile(
          dayOfTheWeek: dayOfTheWeek,
          key: ValueKey(dayOfTheWeek),
          val: val,
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 20);
      },
      itemCount: DayOfWeek.values.length,
    );
  }
}
