import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'add_question_form_event.dart';
part 'add_question_form_state.dart';

class AddQuestionFormBloc extends Bloc<AddQuestionFormEvent, AddQuestionFormState> {
  AddQuestionFormBloc() : super(AddQuestionFormInitial());

  @override
  Stream<AddQuestionFormState> mapEventToState(AddQuestionFormEvent event) async* {}
}
