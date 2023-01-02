part of 'add_bathroom_ticket_bloc.dart';

abstract class AddBathroomTicketEvent extends Equatable {
  const AddBathroomTicketEvent();

  @override
  List<Object> get props => [];
}

class AddBathroomTicketPriceUpdated extends AddBathroomTicketEvent {
  final String value;

  const AddBathroomTicketPriceUpdated(this.value);

  @override
  List<Object> get props => [value];
}

class AddBathroomTicketTypeUpdated extends AddBathroomTicketEvent {
  final TicketType value;

  const AddBathroomTicketTypeUpdated(this.value);

  @override
  List<Object> get props => [value];
}

class AddBathroomTicketTitleUpdated extends AddBathroomTicketEvent {
  final String value;

  const AddBathroomTicketTitleUpdated(this.value);

  @override
  List<Object> get props => [value];
}

class AddBathroomTicketFormSubmitted extends AddBathroomTicketEvent {}
