import 'package:fitness_app/api/models/responses/auth/login_response.dart';
import 'package:fitness_app/api/models/responses/auth/signup_response.dart';
import 'package:fitness_app/domain/entities/responses/auth_entity/login_entity.dart';
import 'package:fitness_app/domain/entities/responses/auth_entity/signup_entity_response.dart';

extension LoginResponseMapper on LoginResponse {
  LoginEntity toEntity() {
    return LoginEntity(
      token: token,
    );
  }
}
extension SignUPResponseMapper on SignupResponse {
  SignupEntityResponse toEntity() {
    return SignupEntityResponse(
      token:token ,
    );
  }
}