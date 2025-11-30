// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'muscles_upcoming_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MusclesUpcomingResponse _$MusclesUpcomingResponseFromJson(
  Map<String, dynamic> json,
) => MusclesUpcomingResponse(
  message: json['message'] as String,
  musclesGroup: (json['musclesGroup'] as List<dynamic>)
      .map((e) => MuscleGroupDto.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$MusclesUpcomingResponseToJson(
  MusclesUpcomingResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'musclesGroup': instance.musclesGroup,
};
