import 'package:equatable/equatable.dart';
import 'package:fitness_app/api/models/responses/auth/user_info_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable(explicitToJson: true)
class UserResponse extends Equatable {
  final String? message;
  final UserInfoDto? user;

  const UserResponse({
    this.message,
    this.user,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);

  @override
  List<Object?> get props => [message, user];
}