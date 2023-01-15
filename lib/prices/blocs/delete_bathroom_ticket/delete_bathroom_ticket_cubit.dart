import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:price_repository/price_repository.dart';

part 'delete_bathroom_ticket_state.dart';

class DeleteBathroomTicketCubit extends Cubit<DeleteBathroomTicketState> {
  DeleteBathroomTicketCubit(
    this.priceRepository,
  ) : super(DeleteBathroomTicketInitial());

  final PriceRepository priceRepository;

  Future<void> delete(Ticket ticket) async {
    emit(DeleteBathroomTicketLoading());

    try {
      await priceRepository.deleteTicketById(ticket.id);

      emit(DeleteBathroomTicketSuccess(ticket));
    } catch (e) {
      emit(DeleteBathroomTicketFail());
    }
  }
}
