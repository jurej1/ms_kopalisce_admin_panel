part of 'additional_info_form_bloc.dart';

class AdditionalInfoFormState extends Equatable {
  const AdditionalInfoFormState({
    this.status = FormzStatus.pure,
    this.val = const AdditionalInfoValFormz.pure(''),
  });

  final FormzStatus status;
  final AdditionalInfoValFormz val;

  @override
  List<Object> get props => [status, val];

  AdditionalInfoFormState copyWith({
    FormzStatus? status,
    AdditionalInfoValFormz? val,
  }) {
    return AdditionalInfoFormState(
      status: status ?? this.status,
      val: val ?? this.val,
    );
  }
}
