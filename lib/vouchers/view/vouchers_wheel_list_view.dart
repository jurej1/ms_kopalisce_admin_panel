import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../vouchers.dart';

class VouchersWheelListView extends StatelessWidget {
  const VouchersWheelListView({Key? key}) : super(key: key);

  static MaterialPageRoute route(BuildContext context) {
    return MaterialPageRoute(
      builder: (context) {
        return const VouchersWheelListView();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<VouchersListBloc, VouchersListState>(
        builder: (context, state) {
          if (state is VouchersListLoading) {
            return const _LoadingDisplayer();
          } else if (state is VouchersListLoadSuccess) {
            if (state.vouchers.isNotEmpty) {
              return VouchersListDisplayer(vouchers: state.vouchers);
            } else {
              return Container();
            }
          } else if (state is VouchersListFail) {
            return const _LoadFailDisplayer();
          }

          return Container();
        },
      ),
    );
  }
}

class _LoadingDisplayer extends StatelessWidget {
  const _LoadingDisplayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _LoadFailDisplayer extends StatelessWidget {
  const _LoadFailDisplayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Sorry there was an error'),
    );
  }
}
