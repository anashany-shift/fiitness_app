import 'package:json_annotation/json_annotation.dart';
part 'food_category_dto.g.dart';
@JsonSerializable()
class FoodCategoryDto {
  @JsonKey(name: 'idCategory')
  final String id;

  @JsonKey(name: 'strCategory')
  final String name;

  @JsonKey(name: 'strCategoryThumb')
  final String thumbnail;

  @JsonKey(name: 'strCategoryDescription')
  final String description;

  FoodCategoryDto({
    required this.id,
    required this.name,
    required this.thumbnail,
    required this.description,
  });

  factory FoodCategoryDto.fromJson(Map<String, dynamic> json) =>
      _$FoodCategoryDtoFromJson(json);

  Map<String, dynamic> toJson() => _$FoodCategoryDtoToJson(this);
}
