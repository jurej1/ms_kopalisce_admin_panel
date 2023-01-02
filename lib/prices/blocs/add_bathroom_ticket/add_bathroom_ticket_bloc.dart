import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:ms_kopalisce_admin_panel/prices/prices.dart';
import 'package:price_repository/price_repository.dart';

part 'add_bathroom_ticket_event.dart';
part 'add_bathroom_ticket_state.dart';

class AddBathroomTicketBloc extends Bloc<AddBathroomTicketEvent, AddBathroomTicketState> {
  AddBathroomTicketBloc({
    required PriceRepository priceRepository,
  })  : _priceRepository = priceRepository,
        super(const AddBathroomTicketState());

  final PriceRepository _priceRepository;

  @override
  Stream<AddBathroomTicketState> mapEventToState(AddBathroomTicketEvent event) async* {
    if (event is AddBathroomTicketFormSubmitted) {
      yield* _mapFormSubmittedToState();
    } else if (event is AddBathroomTicketPriceUpdated) {
      yield _mapPriceUpdatedToState(event);
    } else if (event is AddBathroomTicketTitleUpdated) {
      yield _mapTitleUpdatedToState(event);
    } else if (event is AddBathroomTicketTypeUpdated) {
      yield _mapTypeUpdatedToState(event);
    }
  }

  Stream<AddBathroomTicketState> _mapFormSubmittedToState() async* {
    final price = BathroomTicketPriceFormz.dirty(state.price.value);
    final title = BathroomTicketTitleFormz.dirty(state.title.value);
    final type = BathroomTicketTypeFormz.dirty(state.type.value);

    final status = Formz.validate([price, title, type]);

    yield state.copyWith(
      price: price,
      status: status,
      title: title,
      type: type,
    );

    if (state.status.isValidated) {
      yield state.copyWith(status: FormzStatus.submissionInProgress);

      try {
        await _priceRepository.addTicket(
          Ticket(
            price: price.toDoubleValue(),
            title: title.value,
            type: type.value,
            id: '',
          ),
        );

        yield state.copyWith(status: FormzStatus.submissionSuccess);
      } catch (e) {
        yield state.copyWith(status: FormzStatus.submissionFailure);
      }
    }
  }

  AddBathroomTicketState _mapPriceUpdatedToState(AddBathroomTicketPriceUpdated event) {
    final price = BathroomTicketPriceFormz.dirty(event.value);

    return state.copyWith(
      price: price,
      status: Formz.validate([
        price,
        state.title,
        state.type,
      ]),
    );
  }

  AddBathroomTicketState _mapTitleUpdatedToState(AddBathroomTicketTitleUpdated event) {
    final title = BathroomTicketTitleFormz.dirty(event.value);
    return state.copyWith(
      title: title,
      status: Formz.validate([
        title,
        state.price,
        state.type,
      ]),
    );
  }

  AddBathroomTicketState _mapTypeUpdatedToState(AddBathroomTicketTypeUpdated event) {
    final type = BathroomTicketTypeFormz.dirty(event.value);

    return state.copyWith(
      type: type,
      status: Formz.validate([
        type,
        state.price,
        state.title,
      ]),
    );
  }
}
