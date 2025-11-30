// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'random_muscles_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RandomMusclesResponse _$RandomMusclesResponseFromJson(
  Map<String, dynamic> json,
) => RandomMusclesResponse(
  message: json['message'] as String,
  totalMuscles: (json['totalMuscles'] as num).toInt(),
  muscles: (json['muscles'] as List<dynamic>)
      .map((e) => MusclesDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$RandomMusclesResponseToJson(
  RandomMusclesResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'totalMuscles': instance.totalMuscles,
  'muscles': instance.muscles,
};
