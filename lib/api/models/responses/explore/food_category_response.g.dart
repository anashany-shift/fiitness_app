// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodCategoryResponse _$FoodCategoryResponseFromJson(
  Map<String, dynamic> json,
) => FoodCategoryResponse(
  foodCategories: (json['categories'] as List<dynamic>)
      .map((e) => FoodCategoryDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$FoodCategoryResponseToJson(
  FoodCategoryResponse instance,
) => <String, dynamic>{'categories': instance.foodCategories};
