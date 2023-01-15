import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:info_repository/info_repository.dart';

class OpenTimeDisplayer extends StatelessWidget {
  const OpenTimeDisplayer({
    Key? key,
    required this.openTime,
  }) : super(key: key);

  final OpenTime openTime;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final dayOfTheWeek = DayOfWeek.values[index];

        final OpenDay? val = openTime.getSpecificDayTime(dayOfTheWeek);

        return ListTile(
          key: ValueKey(dayOfTheWeek),
          title: Text(describeEnum(dayOfTheWeek)),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  showTimePicker(
                    context: context,
                    initialTime: val?.opens ?? TimeOfDay.now(),
                  );
                },
                child: Text(val?.opens != null ? 'Opens: ${val!.opens.toString()}' : 'nan'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  showTimePicker(
                    context: context,
                    initialTime: val?.closes ?? TimeOfDay.now(),
                  );
                },
                child: Text(val?.closes != null ? 'Closes: ${val!.closes.toString()}' : 'Nan'),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 20);
      },
      itemCount: DayOfWeek.values.length,
    );
  }
}
