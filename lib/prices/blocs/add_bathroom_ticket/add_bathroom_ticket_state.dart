part of 'add_bathroom_ticket_bloc.dart';

class AddBathroomTicketState extends Equatable {
  const AddBathroomTicketState({
    this.status = FormzStatus.pure,
    this.price = const BathroomTicketPriceFormz.pure('0.0'),
    this.type = const BathroomTicketTypeFormz.pure(TicketType.daily),
    this.title = const BathroomTicketTitleFormz.pure(''),
  });

  final FormzStatus status;
  final BathroomTicketPriceFormz price;
  final BathroomTicketTypeFormz type;
  final BathroomTicketTitleFormz title;

  @override
  List<Object> get props => [status, price, type, title];

  AddBathroomTicketState copyWith({
    FormzStatus? status,
    BathroomTicketPriceFormz? price,
    BathroomTicketTypeFormz? type,
    BathroomTicketTitleFormz? title,
  }) {
    return AddBathroomTicketState(
      status: status ?? this.status,
      price: price ?? this.price,
      type: type ?? this.type,
      title: title ?? this.title,
    );
  }
}
