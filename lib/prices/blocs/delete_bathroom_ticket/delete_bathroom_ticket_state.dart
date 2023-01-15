part of 'delete_bathroom_ticket_cubit.dart';

abstract class DeleteBathroomTicketState extends Equatable {
  const DeleteBathroomTicketState();

  @override
  List<Object> get props => [];
}

class DeleteBathroomTicketInitial extends DeleteBathroomTicketState {}

class DeleteBathroomTicketLoading extends DeleteBathroomTicketState {}

class DeleteBathroomTicketSuccess extends DeleteBathroomTicketState {
  final Ticket ticket;

  const DeleteBathroomTicketSuccess(this.ticket);
  @override
  List<Object> get props => [ticket];
}

class DeleteBathroomTicketFail extends DeleteBathroomTicketState {}
