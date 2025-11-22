import 'package:fitness_app/api/models/responses/auth/user_info_dto.dart';
import 'package:json_annotation/json_annotation.dart';

part 'signup_response.g.dart';

@JsonSerializable()
class SignupResponse {
  final String message;
  final UserInfoDto user;
    final String token;


  SignupResponse( {
    required this.token,
    required this.message,
    required this.user,
  });

  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignupResponseToJson(this);
}
