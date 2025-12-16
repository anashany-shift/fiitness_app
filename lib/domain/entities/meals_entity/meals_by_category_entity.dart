import 'package:equatable/equatable.dart';

class MealsByCategoryEntity extends Equatable {
  final String? mealId;
    final String? mealTitle;

  final String? mealImage;

 const MealsByCategoryEntity({required this.mealId, required this.mealTitle, required this.mealImage});
 
  @override
  List<Object?> get props => [mealId,mealImage,mealTitle];
}