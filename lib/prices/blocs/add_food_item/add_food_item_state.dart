part of 'add_food_item_bloc.dart';

class AddFoodItemState extends Equatable {
  const AddFoodItemState({
    this.status = FormzStatus.pure,
    this.price = const FoodItemPriceFormz.pure('0'),
    this.type = const FoodItemTypeFormz.pure(FoodItemType.coffee),
    this.title = const FoodItemTitleFormz.pure(''),
  });

  final FormzStatus status;
  final FoodItemPriceFormz price;
  final FoodItemTypeFormz type;
  final FoodItemTitleFormz title;

  @override
  List<Object> get props => [status, price, type, title];

  AddFoodItemState copyWith({
    FormzStatus? status,
    FoodItemPriceFormz? price,
    FoodItemTypeFormz? type,
    FoodItemTitleFormz? title,
  }) {
    return AddFoodItemState(
      status: status ?? this.status,
      price: price ?? this.price,
      type: type ?? this.type,
      title: title ?? this.title,
    );
  }
}
