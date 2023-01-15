part of 'additional_info_form_bloc.dart';

abstract class AdditionalInfoFormEvent extends Equatable {
  const AdditionalInfoFormEvent();

  @override
  List<Object> get props => [];
}

class AdditionalInfoValueUpdated extends AdditionalInfoFormEvent {
  final String value;

  const AdditionalInfoValueUpdated(this.value);
}

class AdditionalInfoFormSubmitted extends AdditionalInfoFormEvent {}
