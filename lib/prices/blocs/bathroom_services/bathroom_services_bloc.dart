import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:price_repository/price_repository.dart';

part 'bathroom_services_event.dart';
part 'bathroom_services_state.dart';

class BathroomServicesBloc extends Bloc<BathroomServicesEvent, BathroomServicesState> {
  BathroomServicesBloc({
    required PriceRepository priceRepository,
  })  : _priceRepository = priceRepository,
        super(BathroomServicesLoading());

  final PriceRepository _priceRepository;

  @override
  Stream<BathroomServicesState> mapEventToState(BathroomServicesEvent event) async* {
    if (event is BathroomServicesLoadRequested) {
      yield* _mapLoadRequestedToState();
    } else if (event is BathroomServicesItemRemoved) {
      yield* _mapRemovedToState(event);
    }
  }

  Stream<BathroomServicesState> _mapLoadRequestedToState() async* {
    try {
      yield BathroomServicesLoading();

      QuerySnapshot querySnapshot = await _priceRepository.loadBathroomServicesPriceList();
      List<Ticket> tickets = querySnapshot.docs.map((e) => Ticket.fromDocuntSnapshot(e)).toList();

      yield BathroomServicesLoadSuccess(tickets);
    } catch (e) {
      yield BathroomServicesLoadFail();
    }
  }

  Stream<BathroomServicesState> _mapRemovedToState(BathroomServicesItemRemoved event) async* {
    if (state is BathroomServicesLoadSuccess) {
      final currentList = (state as BathroomServicesLoadSuccess).tickets;

      List<Ticket> copyList = List.from(currentList);

      copyList.removeWhere((element) => element.id == event.ticket.id);

      yield (BathroomServicesLoadSuccess(copyList));
    }
  }
}
