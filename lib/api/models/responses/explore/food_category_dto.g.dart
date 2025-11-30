// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_category_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FoodCategoryDto _$FoodCategoryDtoFromJson(Map<String, dynamic> json) =>
    FoodCategoryDto(
      id: json['idCategory'] as String,
      name: json['strCategory'] as String,
      thumbnail: json['strCategoryThumb'] as String,
      description: json['strCategoryDescription'] as String,
    );

Map<String, dynamic> _$FoodCategoryDtoToJson(FoodCategoryDto instance) =>
    <String, dynamic>{
      'idCategory': instance.id,
      'strCategory': instance.name,
      'strCategoryThumb': instance.thumbnail,
      'strCategoryDescription': instance.description,
    };
