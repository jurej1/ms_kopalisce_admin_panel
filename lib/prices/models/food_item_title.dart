import 'package:formz/formz.dart';

enum FoodItemTitleFormzValidationError { invalid }

class FoodItemTitleFormz extends FormzInput<String, FoodItemTitleFormzValidationError> {
  const FoodItemTitleFormz.dirty(super.value) : super.dirty();
  const FoodItemTitleFormz.pure(super.value) : super.pure();

  int get maxLength => 100;

  @override
  FoodItemTitleFormzValidationError? validator(String value) {
    if (value.length > maxLength) {
      return FoodItemTitleFormzValidationError.invalid;
    }
    return null;
  }
}
