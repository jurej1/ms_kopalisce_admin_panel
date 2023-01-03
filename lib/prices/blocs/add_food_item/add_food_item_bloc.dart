import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:ms_kopalisce_admin_panel/prices/models/models.dart';
import 'package:price_repository/price_repository.dart';

part 'add_food_item_event.dart';
part 'add_food_item_state.dart';

class AddFoodItemBloc extends Bloc<AddFoodItemEvent, AddFoodItemState> {
  AddFoodItemBloc({
    required PriceRepository priceRepository,
  })  : _priceRepository = priceRepository,
        super(const AddFoodItemState());

  final PriceRepository _priceRepository;

  @override
  Stream<AddFoodItemState> mapEventToState(AddFoodItemEvent event) async* {
    if (event is AddFoodItemPriceUpdated) {
      yield _mapPriceUpdatedToState(event);
    } else if (event is AddFoodItemTitleUpdated) {
      yield _mapTitleUpdatedToState(event);
    } else if (event is AddFoodItemTypeUpdated) {
      yield _mapTypeUpdatedToState(event);
    } else if (event is AddFoodItemFormSubmitted) {
      yield* _mapFormSubmittedToState();
    }
  }

  AddFoodItemState _mapPriceUpdatedToState(AddFoodItemPriceUpdated event) {
    final price = FoodItemPriceFormz.dirty(event.value);

    return state.copyWith(
      price: price,
      status: Formz.validate([
        price,
        state.title,
        state.type,
      ]),
    );
  }

  AddFoodItemState _mapTitleUpdatedToState(AddFoodItemTitleUpdated event) {
    final title = FoodItemTitleFormz.dirty(event.value);

    return state.copyWith(
      title: title,
      status: Formz.validate([
        title,
        state.price,
        state.type,
      ]),
    );
  }

  AddFoodItemState _mapTypeUpdatedToState(AddFoodItemTypeUpdated event) {
    final type = FoodItemTypeFormz.dirty(event.value);

    return state.copyWith(
      type: type,
      status: Formz.validate([
        type,
        state.price,
        state.title,
      ]),
    );
  }

  Stream<AddFoodItemState> _mapFormSubmittedToState() async* {
    final type = FoodItemTypeFormz.dirty(state.type.value);
    final title = FoodItemTitleFormz.dirty(state.title.value);
    final price = FoodItemPriceFormz.dirty(state.price.value);

    final status = Formz.validate([type, title, price]);

    yield state.copyWith(
      price: price,
      status: status,
      title: title,
      type: type,
    );

    if (state.status.isValidated) {
      try {
        yield state.copyWith(status: FormzStatus.submissionInProgress);

        await _priceRepository.addFoodItem(
          FoodItem(
            id: '',
            price: state.price.toDouble(),
            title: state.title.value,
            type: state.type.value,
          ),
        );

        yield state.copyWith(status: FormzStatus.submissionSuccess);
      } catch (e) {
        yield state.copyWith(status: FormzStatus.submissionFailure);
      }
    }
  }
}
