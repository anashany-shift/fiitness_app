import 'package:json_annotation/json_annotation.dart';
import 'meal_details_dto.dart';

part 'meals_details_response.g.dart';

@JsonSerializable()
class MealsDetailsResponse {
  @JsonKey(name: 'meals')
  final List<MealDetailsDto>? meals;

  MealsDetailsResponse({this.meals});

  factory MealsDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$MealsDetailsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MealsDetailsResponseToJson(this);
}
