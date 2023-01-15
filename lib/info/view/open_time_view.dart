import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:info_repository/info_repository.dart';

import '../info.dart';

class OpenTimeView extends StatelessWidget {
  const OpenTimeView({Key? key}) : super(key: key);

  static route(BuildContext context) {
    return MaterialPageRoute(
      builder: (context) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => OpenTimeBloc(
                infoRepository: RepositoryProvider.of<InfoRepository>(context),
              )..add(OpenTimeLoadRequested()),
            ),
            BlocProvider(
              create: (context) => OpenTimeUpdateCubit(
                RepositoryProvider.of<InfoRepository>(context),
              ),
            )
          ],
          child: const OpenTimeView(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          BlocBuilder<OpenTimeBloc, OpenTimeState>(
            builder: (context, state) {
              if (state is OpenTimeLoadSuccess) {
                if (state.status == FormStatus.dirty) {
                  return _SubmitButton(openTime: state.openTime);
                }
                return Container();
              }
              return Container();
            },
          )
        ],
      ),
      body: BlocBuilder<OpenTimeBloc, OpenTimeState>(
        builder: (context, state) {
          if (state is OpenTimeLoading) {
            return const _LoadingScreen();
          } else if (state is OpenTimeLoadSuccess) {
            return OpenTimeDisplayer(
              openTime: state.openTime,
              status: state.status,
            );
          } else if (state is OpenTimeFail) {
            return Container();
          }
          return Container();
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

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({
    Key? key,
    required this.openTime,
  }) : super(key: key);

  final OpenTime openTime;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OpenTimeUpdateCubit, OpenTimeUpdateState>(
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () {
            BlocProvider.of<OpenTimeUpdateCubit>(context).updateToFirebase(openTime);
          },
          child: const Text('Submit'),
        );
      },
    );
  }
}
