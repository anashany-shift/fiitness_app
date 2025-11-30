import 'package:fitness_app/api/models/responses/explore/food_category_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'food_category_response.g.dart';

@JsonSerializable()
class FoodCategoryResponse {
  @JsonKey(name: 'categories')
  final List<FoodCategoryDto> foodCategories;

  FoodCategoryResponse({
    required this.foodCategories,
  });

  factory FoodCategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$FoodCategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$FoodCategoryResponseToJson(this);
}

