part of 'aditional_info_list_bloc.dart';

abstract class AditionalInfoListEvent extends Equatable {
  const AditionalInfoListEvent();

  @override
  List<Object> get props => [];
}

class AdditionalInfoListLoadRequested extends AditionalInfoListEvent {}
