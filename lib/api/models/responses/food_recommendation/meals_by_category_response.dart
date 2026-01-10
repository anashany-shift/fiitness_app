import 'package:fitness_app/api/models/responses/food_recommendation/meals_by_category_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meals_by_category_response.g.dart';

@JsonSerializable()
class MealsByCategoryResponse {
  @JsonKey(name: "meals")
  final List<MealsByCategoryDto> mealsDto;

  MealsByCategoryResponse({required this.mealsDto});

  factory MealsByCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$MealsByCategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MealsByCategoryResponseToJson(this);
}
