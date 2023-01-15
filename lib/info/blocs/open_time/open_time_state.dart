part of 'open_time_bloc.dart';

abstract class OpenTimeState extends Equatable {
  const OpenTimeState();

  @override
  List<Object> get props => [];
}

class OpenTimeLoading extends OpenTimeState {}

enum FormStatus { pure, dirty }

class OpenTimeLoadSuccess extends OpenTimeState {
  final OpenTime openTime;

  final FormStatus status;

  const OpenTimeLoadSuccess(
    this.openTime, {
    required this.status,
  });

  @override
  List<Object> get props => [openTime];
}

class OpenTimeFail extends OpenTimeState {}
