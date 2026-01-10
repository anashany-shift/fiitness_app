// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meals_by_category_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealsByCategoryDto _$MealsByCategoryDtoFromJson(Map<String, dynamic> json) =>
    MealsByCategoryDto(
      name: json['strMeal'] as String,
      thumbnail: json['strMealThumb'] as String,
      id: json['idMeal'] as String,
    );

Map<String, dynamic> _$MealsByCategoryDtoToJson(MealsByCategoryDto instance) =>
    <String, dynamic>{
      'strMeal': instance.name,
      'strMealThumb': instance.thumbnail,
      'idMeal': instance.id,
    };
