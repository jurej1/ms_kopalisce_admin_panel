part of 'add_bathroom_ticket_bloc.dart';

class AddBathroomTicketState extends Equatable {
  const AddBathroomTicketState();

  final FormzStatus status;
  final BathroomTicketPriceFormz price;
  final BathroomTicketTypeFormz type;
  final BathroomTicketTitleFormz title;

  @override
  List<Object> get props => [];
}
