import 'package:formz/formz.dart';

enum FormzItemPriceFormzValidationError { invalid }

class FoodItemPriceFormz extends FormzInput<String, FormzItemPriceFormzValidationError> {
  const FoodItemPriceFormz.dirty(super.value) : super.dirty();
  const FoodItemPriceFormz.pure(super.value) : super.pure();

  @override
  FormzItemPriceFormzValidationError? validator(String value) {
    if (double.tryParse(value) == null) {
      return FormzItemPriceFormzValidationError.invalid;
    }
    return null;
  }

  double toDouble() {
    return double.parse(value);
  }
}
