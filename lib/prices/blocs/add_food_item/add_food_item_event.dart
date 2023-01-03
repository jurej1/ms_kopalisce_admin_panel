part of 'add_food_item_bloc.dart';

abstract class AddFoodItemEvent extends Equatable {
  const AddFoodItemEvent();

  @override
  List<Object> get props => [];
}

class AddFoodItemTitleUpdated extends AddFoodItemEvent {
  final String value;

  const AddFoodItemTitleUpdated(this.value);

  @override
  List<Object> get props => [value];
}

class AddFoodItemPriceUpdated extends AddFoodItemEvent {
  final String value;

  const AddFoodItemPriceUpdated(this.value);

  @override
  List<Object> get props => [value];
}

class AddFoodItemTypeUpdated extends AddFoodItemEvent {
  final FoodItemType value;

  const AddFoodItemTypeUpdated(this.value);

  @override
  List<Object> get props => [value];
}

class AddFoodItemFormSubmitted extends AddFoodItemEvent {}
