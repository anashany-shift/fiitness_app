// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meals_details_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealsDetailsResponse _$MealsDetailsResponseFromJson(
  Map<String, dynamic> json,
) => MealsDetailsResponse(
  meals: (json['meals'] as List<dynamic>?)
      ?.map((e) => MealDetailsDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$MealsDetailsResponseToJson(
  MealsDetailsResponse instance,
) => <String, dynamic>{'meals': instance.meals};
