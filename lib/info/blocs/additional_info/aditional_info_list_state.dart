part of 'aditional_info_list_bloc.dart';

abstract class AditionalInfoListState {
  const AditionalInfoListState();
}

class AditionalInfoListLoading extends AditionalInfoListState {}

class AditionalInfoListSuccess extends AditionalInfoListState {
  List<AdditionalInfo> values;
  AditionalInfoListSuccess({
    required this.values,
  });
}

class AditionalInfoListFail extends AditionalInfoListState {}
