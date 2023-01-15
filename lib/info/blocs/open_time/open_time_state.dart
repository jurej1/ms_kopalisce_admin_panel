part of 'open_time_bloc.dart';

abstract class OpenTimeState extends Equatable {
  const OpenTimeState();

  @override
  List<Object> get props => [];
}

class OpenTimeLoading extends OpenTimeState {}

class OpenTimeLoadSuccess extends OpenTimeState {
  final OpenTime openTime;

  const OpenTimeLoadSuccess(this.openTime);

  @override
  List<Object> get props => [openTime];
}

class OpenTimeFail extends OpenTimeState {}
