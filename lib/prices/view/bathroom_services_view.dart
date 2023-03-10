import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ms_kopalisce_admin_panel/prices/blocs/blocs.dart';
import 'package:ms_kopalisce_admin_panel/prices/widgets/bathroom_services_builder_modified.dart';
import 'package:price_repository/price_repository.dart';

class BathroomServicesView extends StatelessWidget {
  const BathroomServicesView({Key? key}) : super(key: key);

  static MaterialPageRoute route(BuildContext context) {
    return MaterialPageRoute(builder: (context) {
      return const BathroomServicesView();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BathroomServicesBloc, BathroomServicesState>(
        builder: (context, state) {
          if (state is BathroomServicesLoading) {
            return const _LoadingScreen();
          } else if (state is BathroomServicesLoadFail) {
            return const _ErrorScreen();
          } else if (state is BathroomServicesLoadSuccess) {
            return BathroomServicesBuilderModified(tickets: state.tickets);
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

class _ErrorScreen extends StatelessWidget {
  const _ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Sorry There was an error'),
    );
  }
}
