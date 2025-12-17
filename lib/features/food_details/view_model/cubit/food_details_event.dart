sealed class FoodDetailsEvent {}
class GetMealDetailsEvent extends FoodDetailsEvent{
final String mealId;

  GetMealDetailsEvent({required this.mealId});

}