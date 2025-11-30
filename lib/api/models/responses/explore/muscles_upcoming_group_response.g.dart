// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'muscles_upcoming_group_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MusclesUpcomingGroupResponse _$MusclesUpcomingGroupResponseFromJson(
  Map<String, dynamic> json,
) => MusclesUpcomingGroupResponse(
  message: json['message'] as String,
  muscleGroup: MuscleGroupDto.fromJson(
    json['muscleGroup'] as Map<String, dynamic>,
  ),
  muscles: (json['muscles'] as List<dynamic>)
      .map((e) => MusclesDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$MusclesUpcomingGroupResponseToJson(
  MusclesUpcomingGroupResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'muscleGroup': instance.muscleGroup,
  'muscles': instance.muscles,
};
