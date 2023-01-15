import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:info_repository/info_repository.dart';

import '../info.dart';

class OpenTimeTile extends StatelessWidget {
  const OpenTimeTile({
    Key? key,
    required this.dayOfTheWeek,
    this.val,
  }) : super(key: key);

  final DayOfWeek dayOfTheWeek;
  final OpenDay? val;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      key: ValueKey(dayOfTheWeek),
      title: Text(describeEnum(dayOfTheWeek)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ElevatedButton(
            onPressed: () async {
              showTimePicker(
                context: context,
                initialTime: val?.opens ?? TimeOfDay.now(),
              ).then((value) {
                if (value != null) {
                  BlocProvider.of<OpenTimeBloc>(context).add(
                    OpenTimeElementUpdated(
                      OpenDay(
                        dayOfWeek: dayOfTheWeek,
                        opens: value,
                        closes: val?.closes,
                      ),
                    ),
                  );
                }
              });
            },
            child: Text(val?.opens != null ? 'Opens: ${val!.opens?.hour}:${val!.opens?.minute}' : 'Nan'),
          ),
          const SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {
              showTimePicker(
                context: context,
                initialTime: val?.closes ?? TimeOfDay.now(),
              ).then((value) {
                if (value != null) {
                  BlocProvider.of<OpenTimeBloc>(context).add(
                    OpenTimeElementUpdated(
                      OpenDay(
                        dayOfWeek: dayOfTheWeek,
                        opens: val?.opens,
                        closes: value,
                      ),
                    ),
                  );
                }
              });
            },
            child: Text(val?.closes != null ? 'Closes: ${val!.closes?.hour}: ${val!.closes?.minute}' : 'Nan'),
          ),
        ],
      ),
    );
  }
}
