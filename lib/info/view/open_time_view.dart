import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:info_repository/info_repository.dart';

import '../info.dart';

class OpenTimeView extends StatelessWidget {
  const OpenTimeView({Key? key}) : super(key: key);

  static route(BuildContext context) {
    return MaterialPageRoute(
      builder: (context) {
        return BlocProvider(
          create: (context) => OpenTimeBloc(
            infoRepository: RepositoryProvider.of<InfoRepository>(context),
          )..add(OpenTimeLoadRequested()),
          child: const OpenTimeView(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OpenTimeBloc, OpenTimeState>(
        builder: (context, state) {
          if (state is OpenTimeLoading) {
            return const _LoadingScreen();
          } else if (state is OpenTimeLoadSuccess) {
            return Container();
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
