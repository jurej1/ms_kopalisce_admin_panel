import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:ms_kopalisce_admin_panel/prices/models/bathroom_ticket_Title.dart';
import 'package:ms_kopalisce_admin_panel/prices/prices.dart';

part 'add_bathroom_ticket_event.dart';
part 'add_bathroom_ticket_state.dart';

class AddBathroomTicketBloc extends Bloc<AddBathroomTicketEvent, AddBathroomTicketState> {
  AddBathroomTicketBloc() : super(AddBathroomTicketInitial());

  @override
  Stream<AddBathroomTicketState> mapEventToState(AddBathroomTicketEvent event) {}
}
