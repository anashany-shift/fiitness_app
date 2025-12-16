import 'package:json_annotation/json_annotation.dart';

part 'meals_by_category_dto.g.dart';

@JsonSerializable()
class MealsByCategoryDto {
  @JsonKey(name: 'strMeal')
  final String name;

  @JsonKey(name: 'strMealThumb')
  final String thumbnail;

  @JsonKey(name: 'idMeal')
  final String id;

  MealsByCategoryDto({
    required this.name,
    required this.thumbnail,
    required this.id,
  });

  factory MealsByCategoryDto.fromJson(Map<String, dynamic> json) =>
      _$MealsByCategoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MealsByCategoryDtoToJson(this);
}
