import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:info_repository/info_repository.dart';
import 'package:ms_kopalisce_admin_panel/info/blocs/additional_info/aditional_info_list_bloc.dart';
import 'package:ms_kopalisce_admin_panel/info/widgets/additional_info_displayer.dart';

class AdditionalinfoView extends StatelessWidget {
  const AdditionalinfoView({Key? key}) : super(key: key);

  static route() {
    return MaterialPageRoute(
      builder: (BuildContext context) {
        return BlocProvider(
          create: (context) {
            return AditionalInfoListBloc(RepositoryProvider.of<InfoRepository>(context))..add(AdditionalInfoListLoadRequested());
          },
          child: const AdditionalinfoView(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<AditionalInfoListBloc, AditionalInfoListState>(
        builder: (context, state) {
          if (state is AditionalInfoListLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is AditionalInfoListFail) {
            return const Center(
              child: Text('Sorry there was an error'),
            );
          } else if (state is AditionalInfoListSuccess) {
            return AdditionalInfoDisplayer(values: state.values);
          }
          return Container();
        },
      ),
    );
  }
}
