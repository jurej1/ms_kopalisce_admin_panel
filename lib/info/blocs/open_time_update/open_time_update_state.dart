part of 'open_time_update_cubit.dart';

abstract class OpenTimeUpdateState extends Equatable {
  const OpenTimeUpdateState();

  @override
  List<Object> get props => [];
}

class OpenTimeUpdateInitial extends OpenTimeUpdateState {}

class OpenTimeUpdateLoading extends OpenTimeUpdateState {}

class OpenTimeUpdateSuccess extends OpenTimeUpdateState {
  final OpenTime openTime;

  const OpenTimeUpdateSuccess(this.openTime);

  @override
  List<Object> get props => [openTime];
}

class OpenTimeUpdateFail extends OpenTimeUpdateState {}
