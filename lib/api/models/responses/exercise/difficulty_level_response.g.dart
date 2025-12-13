// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'difficulty_level_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DifficultyLevelsResponse _$DifficultyLevelsResponseFromJson(
  Map<String, dynamic> json,
) => DifficultyLevelsResponse(
  message: json['message'] as String,
  totalLevels: (json['totalLevels'] as num).toInt(),
  difficultyLevels: (json['difficulty_levels'] as List<dynamic>)
      .map((e) => LevelDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DifficultyLevelsResponseToJson(
  DifficultyLevelsResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'totalLevels': instance.totalLevels,
  'difficulty_levels': instance.difficultyLevels,
};
