import 'package:formz/formz.dart';
import 'package:price_repository/price_repository.dart';

enum FoodItemTypeFormzValidationError { invalid }

class FoodItemTypeFormz extends FormzInput<FoodItemType, FoodItemTypeFormzValidationError> {
  const FoodItemTypeFormz.dirty(super.value) : super.dirty();
  const FoodItemTypeFormz.pure(super.value) : super.pure();

  @override
  FoodItemTypeFormzValidationError? validator(FoodItemType value) {
    return null;
  }
}
