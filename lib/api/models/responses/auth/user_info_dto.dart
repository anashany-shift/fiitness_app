import 'package:json_annotation/json_annotation.dart';
part 'user_info_dto.g.dart';

@JsonSerializable()
class UserInfoDto {
  @JsonKey(name: '_id')
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String gender;
  final int age;
  final int weight;
  final int height;
  final String activityLevel;
  final String goal;
  final String photo;
  final String createdAt;

  UserInfoDto({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.age,
    required this.weight,
    required this.height,
    required this.activityLevel,
    required this.goal,
    required this.photo,
    required this.createdAt,
  });

  factory UserInfoDto.fromJson(Map<String, dynamic> json) =>
      _$UserInfoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoDtoToJson(this);
}
