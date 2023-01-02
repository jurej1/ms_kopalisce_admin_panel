part of 'add_voucher_form_bloc.dart';

class AddVoucherFormState extends Equatable {
  const AddVoucherFormState({
    this.status = FormzStatus.pure,
    this.description = const VoucherDescriptionFormz.pure(''),
    this.unit = const VoucherUnitFormz.pure(VoucherUnit.money),
    this.discountAmount = const VoucherDiscountAmountFormz.pure('0'),
    this.name = const VoucherNameFormz.pure(''),
    this.number = const VoucherNumberFormz.pure(''),
    this.voucher,
  });

  final FormzStatus status;
  final VoucherDescriptionFormz description;
  final VoucherUnitFormz unit;
  final VoucherDiscountAmountFormz discountAmount;
  final VoucherNameFormz name;
  final VoucherNumberFormz number;
  final Voucher? voucher;

  @override
  List<Object?> get props {
    return [
      status,
      description,
      unit,
      discountAmount,
      name,
      number,
      voucher,
    ];
  }

  AddVoucherFormState copyWith({
    FormzStatus? status,
    VoucherDescriptionFormz? description,
    VoucherUnitFormz? unit,
    VoucherDiscountAmountFormz? discountAmount,
    VoucherNameFormz? name,
    VoucherNumberFormz? number,
    Voucher? voucher,
  }) {
    return AddVoucherFormState(
      status: status ?? this.status,
      description: description ?? this.description,
      unit: unit ?? this.unit,
      discountAmount: discountAmount ?? this.discountAmount,
      name: name ?? this.name,
      number: number ?? this.number,
      voucher: voucher ?? this.voucher,
    );
  }

  factory AddVoucherFormState.initial(Voucher? voucher) {
    if (voucher != null) {
      return AddVoucherFormState(
        description: VoucherDescriptionFormz.pure(voucher.description),
        discountAmount: VoucherDiscountAmountFormz.pure(voucher.discountAmount.toStringAsFixed(0)),
        name: VoucherNameFormz.pure(voucher.name),
        number: VoucherNumberFormz.pure(voucher.voucherNumber),
        unit: VoucherUnitFormz.pure(voucher.unit),
        status: FormzStatus.pure,
      );
    }
    return const AddVoucherFormState();
  }
}
