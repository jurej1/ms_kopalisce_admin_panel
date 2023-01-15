part of 'open_time_bloc.dart';

abstract class OpenTimeEvent extends Equatable {
  const OpenTimeEvent();

  @override
  List<Object> get props => [];
}

class OpenTimeLoadRequested extends OpenTimeEvent {}

class OpenTimeElementUpdated extends OpenTimeEvent {
  final OpenDay openDay;

  const OpenTimeElementUpdated(this.openDay);
}
