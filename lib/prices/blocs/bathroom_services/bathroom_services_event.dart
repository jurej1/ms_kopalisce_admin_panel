part of 'bathroom_services_bloc.dart';

abstract class BathroomServicesEvent {}

class BathroomServicesLoadRequested extends BathroomServicesEvent {}

class BathroomServicesItemRemoved extends BathroomServicesEvent {
  final Ticket ticket;

  BathroomServicesItemRemoved(this.ticket);
}
