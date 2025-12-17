part of 'food_details_cubit.dart';

class FoodDetailsState extends Equatable {
  final BaseState<List<FoodDatailsEntity>>? foodDatailsEntity;

  const FoodDetailsState({this.foodDatailsEntity});
  FoodDetailsState copyWith({
    final BaseState<List<FoodDatailsEntity>>? foodDatailsEntity,
  }) {
    return FoodDetailsState(
      foodDatailsEntity: foodDatailsEntity ?? this.foodDatailsEntity,
    );
  }

  @override
  List<Object?> get props => [foodDatailsEntity];
}
